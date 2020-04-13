<?PHP

if( !defined( 'DATALIFEENGINE' ) ) {
	header( "HTTP/1.1 403 Forbidden" );
	header ( 'Location: ../../../' );
	die( "Hacking attempt!" );
}
require_once (DLEPlugins::Check(ENGINE_DIR . '/data/iptvconf.php'));

function NC_add_user($name,$pass,$enddate=0){
  global $db, $_TIME, $config, $iptvconf;
  $enddate = ($enddate > 0) ? $enddate : time() + $iptvconf['testperiod'] * 86400;
  	$enddate = date('Y-m-d',$enddate + 86400);
  	$ptext ='{"command":"add","user":"'.$name.'","pass":"'.$pass.'","notes":"test","maxcon":"'.$iptvconf['maxconn'].'","enddate":"'.$enddate.'","categories":"'.$iptvconf['ccnel'].'","ip":"","reseller":""}';

	ST_add_user($name,$pass,$enddate);
	@NP_CURL($ptext);
	@NP_CURL2($ptext);
	@ASTRA_CURL($name,$pass,$enddate);
	return true;
}

function NC_edit_user($name,$pass,$enddate=0){
  global $db, $_TIME, $config, $iptvconf;
  $npass = base64_encode($pass);
  if($enddate == 0){
  	$USER = $db->super_query("SELECT * FROM `" . USERPREFIX . "_users` WHERE name='{$name}' AND npass='{$npass}'");
		if($USER['user_group'] == $iptvconf['g2']){
			$enddate = (intval($USER['time_limit']) > 0) ? $USER['time_limit'] : time() + 86400 * 10000;
		}else{
			  if($USER['reg_date'] + 86400 * $iptvconf['testperiod'] < time() ){
				$enddate = time() - 86500;
			  }else{
				$enddate = $USER['reg_date'] + 86400 * $iptvconf['testperiod'];
			  }
			
		}
  }
  	$enddate = date('Y-m-d',$enddate + 86400);
	$ptext ='{"command":"edit","user":"'.$name.'","pass":"'.$pass.'","notes":"test","maxcon":"'.$iptvconf['maxconn'].'","enddate":"'.$enddate.'","categories":"'.$iptvconf['ccnel'].'","ip":"","reseller":""}';

NC_add_user($name,$pass,$enddate);
ST_edit_user($name,$pass,$enddate);	
  @NP_CURL($ptext);
	@NP_CURL2($ptext);

	@ASTRA_CURL($name,$pass,$enddate);
	return true;
}
function NC_del_user($name){
  global $db, $_TIME, $config, $iptvconf;
	$ptext ='{"command":"del","user":"'.$name.'"}';
	@NP_CURL($ptext);
	@NP_CURL2($ptext);
	return true;
}

function NP_END($user_id){
  global $db, $_TIME, $config, $iptvconf;
  $USER = $db->super_query("SELECT * FROM `" . USERPREFIX . "_users` WHERE user_id='{$user_id}'");
  NC_add_user($USER['name'],base64_decode($USER['npass']),$_TIME + 172800);
  NC_edit_user($USER['name'],base64_decode($USER['npass']),$_TIME - 172800);
}

function NP_CURL($ptext){
  global $db, $_TIME, $config, $iptvconf;
  $key = $iptvconf['key'];
  $iv = $iptvconf['iv'];
  $ciphertext_raw = openssl_encrypt($ptext, "AES-128-CBC", $key, $options=OPENSSL_RAW_DATA, $iv);
  $encoded = 'http://'.$iptvconf['server'].'/wapi/' . bin2hex($ciphertext_raw);

  $curl = curl_init($encoded); 

  curl_setopt($curl, CURLOPT_FAILONERROR, true); 
  curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
  $result = curl_exec($curl); 
  $text = json_decode($result, true);
  return $text['info'];
}

function NP_CURL2($ptext){
  global $db, $_TIME, $config, $iptvconf;
  $key = $iptvconf['key2'];
  $iv = $iptvconf['iv2'];
  $ciphertext_raw = openssl_encrypt($ptext, "AES-128-CBC", $key, $options=OPENSSL_RAW_DATA, $iv);
  $encoded = 'http://'.$iptvconf['server2'].'/wapi/' . bin2hex($ciphertext_raw);

  $curl = curl_init($encoded); 

  curl_setopt($curl, CURLOPT_FAILONERROR, true); 
  curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
  $result = curl_exec($curl); 
  $text = json_decode($result, true);
  return $text['info'];
}




function ST_add_user($name,$pass,$enddate){
	global $db, $_TIME, $config, $iptvconf;
	$enddate = date('Y-m-d H:i:s',strtotime($enddate));
	@ST_CURL('accounts','POST',array('login'=>$name,'password'=>$pass,'account_number'=>$name,'end_date'=>$enddate));
}

function ST_edit_user($name,$pass,$enddate){
	global $db, $_TIME, $config, $iptvconf;
	$enddate = date('Y-m-d H:i:s',strtotime($enddate));
	@ST_CURL('accounts/'.$name,'PUT',array('end_date'=>$enddate));	
}

function ST_CURL($method="users/groteus",$POST=false,$DATA=false){
	global $db, $_TIME, $config, $iptvconf;
  $curl = curl_init($iptvconf['stserver'].$method); 
curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: Basic ".base64_encode($iptvconf['stuser'].":".$iptvconf['stpwd'])));
  curl_setopt($curl, CURLOPT_FAILONERROR, true); 
  curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
if($POST){
	curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $POST);
	if($DATA){
		curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($DATA));
	}
}
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
  $result = curl_exec($curl); 
}

function ASTRA_CURL($LOGIN,$PASS,$ENABLE=false){
	global $db, $_TIME, $config, $iptvconf;
	$ENABLE = (strtotime(date('d-m-Y H:i:s',strtotime($ENABLE))) > time()) ? true : false;
$req = json_encode(array(
    'cmd' => 'set-user',
    'id' => $LOGIN,
    'user' => array(
		'enable' => $ENABLE,
		'type' => '3',
		'password' => $PASS,
      'conlimit' => $iptvconf['maxconn'],
	),
));	
	
	$ch = curl_init("http://".$iptvconf['astra_server']."/control/");
	curl_setopt($ch, CURLOPT_HEADER, 1);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_USERPWD, $iptvconf['astra_admin'].":".$iptvconf['astra_password']);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	$res = curl_exec($ch);
	curl_close($ch);	
	return true;
}
//print_r($_SERVER);
?>