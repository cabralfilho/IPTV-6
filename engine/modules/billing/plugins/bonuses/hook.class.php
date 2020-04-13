<?php	if( ! defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );
/**
 * DLE Billing
 *
 * @link          https://github.com/mr-Evgen/dle-billing-module
 * @author        dle-billing.ru <evgeny.tc@gmail.com>
 * @copyright     Copyright (c) 2012-2017, mr_Evgen
 */

if( ! class_exists("HookBonuses") )
{
	Class HookBonuses
	{
		var $plugin = array();
		var $api = false;

		function pay( $user, $plus, $minus, $balance, $desc, $plugin = '', $plugin_id = '' )
		{
			if( $plugin != 'pay' ) return;

			$_Lang = @include MODULE_PATH . '/plugins/bonuses/lang.php';

			$countPay = $this->api->db->super_query( "SELECT COUNT(*) as `count`
														FROM " . USERPREFIX . "_billing_history
														WHERE history_user_name = '" . $user . "' and history_plugin = 'pay'" );

			# Первый платеж
			#
			if( $this->plugin['status'] and $countPay['count'] == 1 and $plus >= $this->plugin['f_sum'] )
			{
				if( $this->plugin['f_bonus_sum'] )
				{
					# Фиксированная сумма
					#
					$this->api->PlusMoney(
						$user,
						$this->plugin['f_bonus_sum'],
						$_Lang['bonus_first_comment'],
						'bonuses',
						$plugin_id
					);
				}
				else
				{
					# Процент от платежа
					#
					$this->api->PlusMoney(
						$user,
						( $plus / 100 * $this->plugin['f_bonus_percent']),
						$_Lang['bonus_first_comment'],
						'bonuses',
						$plugin_id
					);
				}
			}

			# Последующие платежи
			#
			if( $this->plugin['s_status'] and $countPay['count'] > 1 and $plus >= $this->plugin['s_sum'] )
			{
				if( $this->plugin['s_bonus_sum'] )
				{
					# Фиксированная сумма
					#
					$this->api->PlusMoney(
						$user,
						$this->plugin['s_bonus_sum'],
						$_Lang['bonus_comment'],
						'bonuses',
						$plugin_id
					);
				}
				else
				{
					# Процент от платежа
					#
					$this->api->PlusMoney(
						$user,
						( $plus / 100 * $this->plugin['s_bonus_percent']),
						$_Lang['bonus_comment'],
						'bonuses',
						$plugin_id
					);
				}
			}

			# Активация профиля
			#
			if( $this->plugin['active_status']
				and $this->plugin['active_count'] >= $countPay['count']
				and $plus >= $this->plugin['active_min'] )
			{
				$_uGroup = $this->api->db->super_query( "SELECT user_group FROM " . USERPREFIX . "_users WHERE name = '" . $user . "'" );

				if( in_array( $_uGroup['user_group'], explode(',', $this->plugin['active_from']) ) )
				{
					$this->api->db->query( "UPDATE " . PREFIX . "_users
									SET user_group='" . $this->plugin['active_to'] . "'
									WHERE name='" . $user. "'" );
				}
			}
		}
	}
}

return new HookBonuses();
?>
