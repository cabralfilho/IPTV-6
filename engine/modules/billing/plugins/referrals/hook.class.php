<?php	if( !defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );
/*
=====================================================
 Billing
-----------------------------------------------------
 evgeny.tc@gmail.com
-----------------------------------------------------
 This code is copyrighted
=====================================================
*/

if( ! class_exists("HookReferrals") )
{
	Class HookReferrals
	{
		var $plugin = array();
		var $api = false;

		function pay( $user, $plus, $minus, $balance, $desc, $plugin = '', $plugin_id = 0 )
		{
			# Плагин отключен
			#
			if( ! $this->plugin['status'] ) return;
			
			# Поиск партнера
			#
			$_Partner = $this->api->db->super_query( "SELECT * FROM " . USERPREFIX . "_billing_referrals WHERE ref_login = '" . $user . "'" );
		
			if( ! $_Partner ) return;
			
			# Вознаграждения
			#
			foreach ( explode('||', $this->plugin['bonuses']) as $bonus_string)
			{
				$bonus = explode('|', $bonus_string);

				if( ! $bonus[1] )
				{
					continue;
				}
				
				$pay = false;
				
				if( $bonus[0] == $plugin )
				{					
					$fMetka = substr($bonus[5], 0, 1);
					$fValue = substr($bonus[5], 1);
					
					# Пополнение
					#
					if( $bonus[4] == '+' and $plus > 0 )
					{
						$_Sum = $plus;
						
						if( $fMetka == '>' and $plus > $fValue )
						{
							$pay = true;
						}
						else if( $fMetka == '<' and $plus < $fValue )
						{
							$pay = true;
						}
						else if( $fMetka == '=' and $plus == $fValue )
						{
							$pay = true;
						}
					}
					
					# Расход
					#
					if( $bonus[4] == '-' and $minus > 0 )
					{
						$_Sum = $minus;
						
						if( $fMetka == '>' and $minus > $fValue )
						{
							$pay = true;
						}
						else if( $fMetka == '<' and $minus < $fValue )
						{
							$pay = true;
						}
						else if( $fMetka == '=' and $minus == $fValue )
						{
							$pay = true;
						}
					}
					
					# Размер вознаграждения
					#
					if( intval( $bonus[3] ) )
					{
						$_Bonus = ( $_Sum / 100 ) * $bonus[3];
					}
					else 
					{
						$_Bonus = $bonus[2];
					}
					
					# Начислить
					#
					if( $pay )
					{
						$this->api->PlusMoney( 
							$_Partner['ref_from'], 
							$_Bonus, 
							$bonus[1],
							'referrals', 
							$_Partner['ref_user_id']
						);
					}
				}
			}
		}
	}
}

return new HookReferrals();
?>
