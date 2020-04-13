<?php
ini_set('default_charset', 'windows-1251');
@session_start();
@ob_start();
@ob_implicit_flush(0);
@error_reporting(E_ALL ^ E_WARNING ^ E_NOTICE);
@ini_set('display_errors', true);
@ini_set('html_errors', true);
@ini_set('error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE);
define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );


include (ENGINE_DIR.'/data/config.php');
require_once ENGINE_DIR.'/classes/mysql.php';
require_once ENGINE_DIR.'/data/dbconfig.php';
require_once ENGINE_DIR.'/modules/functions.php';

$type = $_POST['type'];
$site = $_POST['site'];
$key = $_POST['key'];
$id = $_POST['id'];

//sleep(1);

if ($type == "1" AND $site == "1") {
$finds = '/download/'.$key.'/1/'.$id.'/PERSONAL_LIST.m3u';
$title = 'C������ ��������';}


elseif($type == "11" AND $site == "1") {
$finds = '/Custom/IpTvPlayer.exe';
$title = 'IPTV-PLAYER';}

elseif ($type == "2" AND $site == "1") {
$finds = '/download/'.$key.'/1/'.$id.'/userbouquet_iptv.tv';
$title = 'C������ ENIGMA2';}

elseif ($type == "3" AND $site == "1"){
$finds = '/download/'.$key.'/1/'.$id.'/webtv_usr.xml';
$title = 'C������ �������� WEBTV_USR (SPARK)';}

elseif ($type == "4" AND $site == "1"){
$finds = '/download/'.$key.'/1/'.$id.'/nStream.xml';
$title = 'C����� �������� SAMSUNG';}

/*
elseif ($type == "3" AND $site == "1"){
$finds = '/playlist.tv?key='.$key;
$title = 'C����� �������� Enigma 2';}
*/
elseif ($type == "1" AND $site == "2") {
$finds = '/download/'.$key.'/2/'.$id.'/PERSONAL_LIST.m3u';
$title = 'C������ �������� M3U';}

elseif ($type == "2" AND $site == "2") {
$finds = '/download/'.$key.'/2/'.$id.'/userbouquet_iptv.tv';
$title = 'C������ ENIGMA2';}

elseif ($type == "3" AND $site == "2"){
$finds = '/download/'.$key.'/2/'.$id.'/webtv_usr.xml';
$title = 'C������ �������� WEBTV_USR (SPARK)';}

elseif ($type == "4" AND $site == "2"){
$finds = '/download/'.$key.'/2/'.$id.'/nStream.xml';
$title = 'C������ �������� SAMSUNG';}

else {
$finds = '�� ������� ���� �� �����';
}

echo '<p><center><iframe target="_top"  src="https://iptv.alternativa.fun/iptvplayer-docs.htm" style="border:0px #ffffff hidden;" name="iptv" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="115px" width="300px" allowfullscreen></iframe></centrer></p>';

echo '<p>&nbsp;<p align="center"><a  href="http://server1tv.ddns.net/playlist.m3u8?key='.$key.'" ><input name="������� " type="button" value="������� �������� M3U"><p>&nbsp;</a>';

echo '<p><center>������ �� ��������������� �������� <p>&nbsp;</p>';
echo '<p>&nbsp;</p><center>http://server1tv.ddns.net/playlist.m3u8?key='.$key.'</center><p>&nbsp;</p>';
echo '<p><center>���������� ��� �������</center>&nbsp;</p>';
echo '<p align="center"><a href="https://play.google.com/store/apps/details?id=com.niklabs.pp"><input name="������� " type="button" value="�������"></a></p>';

?>