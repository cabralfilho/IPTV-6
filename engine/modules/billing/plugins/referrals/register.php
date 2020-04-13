<?PHP

if( ! defined( 'DATALIFEENGINE' ) )
{
	die( "Hacking attempt!" );
}

# Регистрация реферала
#
if( file_exists( ENGINE_DIR . '/data/billing/plugin.referrals.php' ) )
{
	$_Config = include ENGINE_DIR . '/data/billing/plugin.referrals.php';

	if( $_Config['status'] == '1' and $_SESSION['myPartner'] )
	{
		$_Login = $social_user['nickname'] ? $social_user['nickname'] : $name;

		$db->query( "INSERT INTO " . USERPREFIX . "_billing_referrals (ref_time, ref_login, ref_user_id, ref_from) 
											VALUES ('" . $_TIME . "', '" . $_Login . "', '" . $id . "', '" . $db->safesql( $_SESSION['myPartner'] ) . "')" );

		if( $_Config['bonus'] > 0 )
		{
			$_Lang = include ENGINE_DIR . "/modules/billing/plugins/referrals/lang.php";

			require_once ENGINE_DIR . '/modules/billing/OutAPI.php';

			$BillingAPI->PlusMoney(
				$_SESSION['myPartner'],
				$_Config['bonus'],
				sprintf( $_Lang['pay_desc'], urlencode($_Login), $_Login ),
				'referrals',
				$id
			);

			unset($BillingAPI);
		}
	}
}
?>
