<?PHP


if( !defined( 'DATALIFEENGINE' ) OR !defined( 'LOGGED_IN' ) ) {
	header( "HTTP/1.1 403 Forbidden" );
	header ( 'Location: ../../' );
	die( "Hacking attempt!" );
}

if( $member_id['user_group'] != 1 ) {
	msg( "error", $lang['index_denied'], $lang['index_denied'] );
}

require_once (ENGINE_DIR . '/data/iptvconf.php');
foreach($user_group as $k=>$v){
	$group_list[$v['id']] = $v['group_name'];
}

if( $action == "save" ) {

	if( $_REQUEST['user_hash'] == "" or $_REQUEST['user_hash'] != $dle_login_hash ) {
		
		die( "Hacking attempt! User not found" );
	
	}

	$db->query( "INSERT INTO " . USERPREFIX . "_admin_logs (name, date, ip, action, extras) values ('".$db->safesql($member_id['name'])."', '{$_TIME}', '{$_IP}', '78', '')" );
	
	$save_con = $_POST['save_con'];
	$save_con['preload'] = intval($save_con['preload']);

	
	$find = array();
	$replace = array();
	
	$find[] = "'\r'";
	$replace[] = "";
	$find[] = "'\n'";
	$replace[] = "";
	
	$save_con = $save_con + $iptvconf;
	
	$handler = fopen( ENGINE_DIR . '/data/iptvconf.php', "w" );
	fwrite( $handler, "<?PHP \n\n\n\n\$iptvconf = array (\n\n" );
	foreach ( $save_con as $name => $value ) {
		
		$value = trim(strip_tags(stripslashes( $value )));
		$value = htmlspecialchars( $value, ENT_QUOTES, $config['charset']);
		$value = preg_replace( $find, $replace, $value );
			
		$name = trim(strip_tags(stripslashes( $name )));
		$name = htmlspecialchars( $name, ENT_QUOTES, $config['charset'] );
		$name = preg_replace( $find, $replace, $name );
		
		$value = str_replace( "$", "&#036;", $value );
		$value = str_replace( "{", "&#123;", $value );
		$value = str_replace( "}", "&#125;", $value );
		$value = str_replace( chr(92), "", $value );
		$value = str_replace( chr(0), "", $value );
		$value = str_replace( '(', "", $value );
		$value = str_replace( ')', "", $value );
		$value = str_ireplace( "decode", "dec&#111;de", $value );
		
		$name = str_replace( "$", "&#036;", $name );
		$name = str_replace( "{", "&#123;", $name );
		$name = str_replace( "}", "&#125;", $name );
		$name = str_replace( '/', "", $name );
		$name = str_replace( chr(92), "", $name );
		$name = str_replace( chr(0), "", $name );
		$name = str_replace( '(', "", $name );
		$name = str_replace( ')', "", $name );
		$name = str_ireplace( "decode", "dec&#111;de", $name );
		
		fwrite( $handler, "'{$name}' => '{$value}',\n\n" );
	
	}
	fwrite( $handler, ");\n\n?>" );
	fclose( $handler );
	
	clear_cache();
	
	if (function_exists('opcache_reset')) {
		opcache_reset();
	}
	
	msg( "success", $lang['opt_sysok'], $lang['opt_sysok_1'], "?mod=iptv" );
}



	echoheader( "<i class=\"fa fa-play-circle-o position-left\"></i><span class=\"text-semibold\">Настройка интеграции Nice панели</span>", "Настройка интеграции Nice панели" );

function showRow($title = "", $description = "", $field = "", $class = "") {
	echo "<tr>
       <td class=\"col-xs-6 col-sm-6 col-md-7\"><div class=\"media-heading text-semibold\">{$title}</div><span class=\"text-muted text-size-small hidden-xs\">{$description}</span></td>
       <td class=\"col-xs-6 col-sm-6 col-md-5\">{$field}</td>
       </tr>";
}
	
function makeDropDown($options, $name, $selected) {
	$output = "<select class=\"uniform\" name=\"$name\">\r\n";
	foreach ( $options as $value => $description ) {
		$output .= "<option value=\"$value\"";
		if( $selected == $value ) {
			$output .= " selected ";
		}
		$output .= ">$description</option>\n";
	}
	$output .= "</select>";
	return $output;
}

function makeCheckBox($name, $selected) {
	$selected = $selected ? "checked" : "";
	
	return "<input class=\"switch\" type=\"checkbox\" name=\"$name\" value=\"1\" {$selected}>";
}


echo <<<HTML
<form action="?mod=iptv&action=save" name="conf" id="conf" method="post">
<div class="panel panel-flat">
  <div class="panel-body">
    {$lang['vconf_title']}
  </div>
  <div class="table-responsive">
  <table class="table table-striped">
HTML;


	showRow( "Группа Минимум", "Группа в которую необходимо перевести пользователя после окончания тарифного плана", makeDropDown( $group_list, "save_con[g1]", "{$iptvconf['g1']}" ) );
	showRow( "Группа Максимум", "Группа в которую необходимо перевести пользователя при оплате тарифа", makeDropDown( $group_list, "save_con[g2]", "{$iptvconf['g2']}" ) );
	showRow( "Адрес Nice панели", "Только IP адрес и порт, например 127.0.0.1:4300", "<input type=\"text\" name=\"save_con[server]\" value=\"{$iptvconf['server']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Wapi aes key:iv", "Генерируются в Nice панеле Tools->Config в самом низу", "<input type=\"text\" name=\"save_con[key]\" value=\"{$iptvconf['key']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">:<input type=\"text\" name=\"save_con[iv]\" value=\"{$iptvconf['iv']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Адрес Nice панели (№2)", "Только IP адрес и порт, например 127.0.0.1:4300", "<input type=\"text\" name=\"save_con[server2]\" value=\"{$iptvconf['server2']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Wapi aes key:iv (№2)", "Генерируются в Nice панеле Tools->Config в самом низу", "<input type=\"text\" name=\"save_con[key2]\" value=\"{$iptvconf['key2']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">:<input type=\"text\" name=\"save_con[iv2]\" value=\"{$iptvconf['iv2']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Группы каналов", "Группы каналов для подключения через запятую, например 1,2,3,4", "<input type=\"text\" name=\"save_con[ccnel]\" value=\"{$iptvconf['ccnel']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">" );
	showRow( "Логин и пароль от сталкер портала", "Задается в настройках сталкер портала", "<input type=\"text\" name=\"save_con[stuser]\" value=\"{$iptvconf['stuser']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">:<input type=\"text\" name=\"save_con[stpwd]\" value=\"{$iptvconf['stpwd']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Адрес API сталкерпортала", "Полный URL вместе с http://", "<input type=\"text\" name=\"save_con[stserver]\" value=\"{$iptvconf['stserver']}\" class=\"form-control\" style=\"text-align: center;\">", "white-line" );
	showRow( "Адрес ASTRA панели", "Только IP адрес и порт, например 127.0.0.1:4002", "<input type=\"text\" name=\"save_con[astra_server]\" value=\"{$iptvconf['astra_server']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Логин и пароль от ASTRA", "Задается в настройках астры (логин и пароль администратора)", "<input type=\"text\" name=\"save_con[astra_admin]\" value=\"{$iptvconf['astra_admin']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">:<input type=\"text\" name=\"save_con[astra_password]\" value=\"{$iptvconf['astra_password']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">", "white-line" );
	showRow( "Тестовый период", "Период в днях, в течении которого после регистрации будет пробный период", "<input type=\"number\" name=\"save_con[testperiod]\" value=\"{$iptvconf['testperiod']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\"> (дней)" );
	showRow( "Максимальное кол-во подключений", "После изменения пользователь должен выйти и войти на сайт", "<input type=\"number\" name=\"save_con[maxconn]\" value=\"{$iptvconf['maxconn']}\" class=\"form-control\" style=\"max-width:150px; text-align: center;\">" );
	echo <<<HTML
</table></div></div>
<div style="margin-bottom:30px;">
<input type="hidden" name="user_hash" value="{$dle_login_hash}" />
<button type="submit" class="btn bg-teal btn-raised position-left"><i class="fa fa-floppy-o position-left"></i>{$lang['user_save']}</button>
</div>

</form>
HTML;

if(!is_writable(ENGINE_DIR . '/data/iptvconf.php')) {

	$lang['stat_system'] = str_replace ("{file}", "engine/data/iptvconf.php", $lang['stat_system']);

	echo "<div class=\"alert alert-warning alert-styled-left alert-arrow-left alert-component\">{$lang['stat_system']}</div>";

}

echofooter();
?>