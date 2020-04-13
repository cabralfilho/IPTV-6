<?php if( ! defined( 'DATALIFEENGINE' ) ) die( "Hacking attempt!" );
/**
 * DLE Billing
 *
 * @link          https://github.com/mr-Evgen/dle-billing-module
 * @author        dle-billing.ru <evgeny.tc@gmail.com>
 * @copyright     Copyright (c) 2012-2017, mr_Evgen
 */

if( file_exists( ENGINE_DIR . '/data/billing/plugin.bonuses.php' ) and ! $_COOKIE['billing_plugins_bonus_day'] )
{
	$plugin_config = include ENGINE_DIR . '/data/billing/plugin.bonuses.php';

	if( $plugin_config['t_status'] == '1' )
	{
		$plugin_lang = include ENGINE_DIR . '/modules/billing/plugins/bonuses/lang.php';

		$_SearchPay = $db->super_query( "SELECT `history_date` FROM " . USERPREFIX . "_billing_history
												WHERE history_user_name='" . $member_id['name'] . "'
													AND history_plugin='bonuses'
													AND history_plugin_id='0'
													ORDER BY history_date desc
													LIMIT 1" );

		if( $_TIME > ( $_SearchPay['history_date'] + 86400 ) )
		{
			include ENGINE_DIR . '/modules/billing/OutAPI.php';

			if( ! $plugin_config['bonus3_alert_pm'] )
			{
				$BillingAPI->alert_pm = false;
			}

			if( ! $plugin_config['bonus3_alert_main'] )
			{
				$BillingAPI->alert_main = false;
			}

			$BillingAPI->PlusMoney(
				$member_id['name'],
				$plugin_config['t_bonus_sum'],
				$plugin_lang['info'],
				'bonuses'
			);

			SetCookie("billing_plugins_bonus_day", "1", $_TIME + 24 * 3600);

            unset($BillingAPI);

        }
		else
		{
            SetCookie("billing_plugins_bonus_day", "1", $_SearchPay['history_date'] + 86400);
        }

		unset($plugin_lang, $_SearchPay);
	}

	unset($plugin_config);
}
