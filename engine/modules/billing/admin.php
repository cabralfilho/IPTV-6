<?php	if( ! defined( 'DATALIFEENGINE' ) OR ! LOGED_IN ) die( "Hacking attempt!" );
/**
 * DLE Billing
 *
 * @link          https://github.com/mr-Evgen/dle-billing-module
 * @author        dle-billing.ru <evgeny.tc@gmail.com>
 * @copyright     Copyright (c) 2012-2017, mr_Evgen
 */

if( ! in_array( $member_id['user_group'], array(1) ) )
{
	msg( "error", $lang['index_denied'], $lang['index_denied'] );
}

define( 'BILLING_MODULE', TRUE );
define( 'MODULE_PATH', ENGINE_DIR . "/modules/billing" );
define( 'MODULE_DATA', ENGINE_DIR . "/data/billing" );

# Установка
#
if( ! file_exists( MODULE_DATA . '/config.php' ) )
{
	require_once MODULE_PATH . '/helpers/install.php';

	exit();
}

require_once MODULE_PATH . '/helpers/library.querys.php';
require_once MODULE_PATH . '/helpers/api.php';
require_once MODULE_PATH . '/helpers/dashboard.php';

Dashboard::Start();
