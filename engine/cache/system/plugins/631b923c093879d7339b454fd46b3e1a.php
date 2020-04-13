<?php
  @include_once (DLEPlugins::Check(ENGINE_DIR.'/inc/fnc_iptv.php'));
 $USERS = $db->query("SELECT * FROM " . USERPREFIX . "_users WHERE time_limit<'".time()."' AND time_limit!=''"); 
	while ( $row = $db->get_array( $USERS ) ) {
      if($row['npass']){
			NC_edit_user($row['name'],base64_decode($row['npass']));
        $db->super_query( "UPDATE `" . USERPREFIX . "_users` SET `time_limit`='', user_group='{$iptvconf['g1']}' WHERE `user_id`='{$row['user_id']}'" );
      }
	}
die ("dones");
  ?>