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

Class ADMIN
{
	function main()
	{
		global $user_group;

		require_once MODULE_PATH . "/plugins/paygroups/lang.php";

		# Сохранить настройки плагина
		#
		if( isset( $_POST['save'] ) )
		{
			if( $_POST['user_hash'] == "" or $_POST['user_hash'] != $this->Dashboard->hash )
			{
				return "Hacking attempt! User not found {$_POST['user_hash']}";
			}

			$_POST['save_con']['stop'] = implode(",", $_POST['save_stop']);

			$this->Dashboard->SaveConfig("plugin.paygroups", $_POST['save_con'], "plugin_config");
			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $this->Dashboard->lang['save_settings'] );
		}

		# Сохранить настройки группы
		#
		if( isset( $_POST['update'] ) )
		{
			if( $_POST['user_hash'] == "" or $_POST['user_hash'] != $this->Dashboard->hash )
			{
				return "Hacking attempt! User not found {$_POST['user_hash']}";
			}

			$SaveCon = $_POST['save_con'];

			foreach( $SaveCon as $group_tag => $group_info )
			{
				$SetStart[] = array();

				foreach( $SaveCon[$group_tag]['start'] as $group_tag_info )
				{
					$SetStart[] = $group_tag_info;
				}

				$SaveCon[$group_tag]['start'] = implode(',', $SetStart);
			}

			$this->SaveFileArray( $SaveCon );

			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $plugin_lang['a_update'] );
		}

		$_Config = $this->Dashboard->LoadConfig( "paygroups", true, array('stop' => "1,2,4") );
		$_GroupConfig = $this->Dashboard->LoadConfig( "paygroups_list", true );

		$this->Dashboard->ThemeEchoHeader();

		# Форма настроек
		#
		$this->Dashboard->ThemeAddStr(
			$this->Dashboard->lang['settings_status'],
			$this->Dashboard->lang['refund_status_desc'],
			$this->Dashboard->MakeCheckBox("save_con[status]", $_Config['status'])
		);

		$this->Dashboard->ThemeAddStr(
			$plugin_lang['a_stop'],
			$plugin_lang['a_stop_desc'],
			"<select name=\"save_stop[]\" class=\"edit bk\" style=\"width: 50%\" multiple>" . $this->Dashboard->GetGroups( explode(",", $_Config['stop']), 5 ) . "</select>"
		);

		$SettingForm = $this->Dashboard->ThemeParserStr();
		$SettingForm .= $this->Dashboard->ThemePadded( $this->Dashboard->MakeButton("save", $this->Dashboard->lang['save'], "green") );

		$tabs[] = array(
				'id' => 'settings',
				'title' => $plugin_lang['settings_title'],
				'content' => $SettingForm
		);

		foreach( $user_group as $group_id => $group_info )
		{
			if( in_array( $group_id, explode(",", $_Config['stop']) ) or $group_id == '5' ) continue;

			$type = $group_info['time_limit']
						? array( '0' => $plugin_lang['a_time_all'], '1' => $plugin_lang['a_time'] )
						: array( '0' => $plugin_lang['a_time_all'] );

			$this->Dashboard->ThemeAddStr(
				$plugin_lang['a_status'],
				$plugin_lang['a_status_desc'],
				$this->Dashboard->MakeICheck("save_con[group_{$group_id}][status]", $_GroupConfig['group_'.$group_id]['status'])
			);

			$this->Dashboard->ThemeAddStr(
				$plugin_lang['a_start'],
				$plugin_lang['a_start_desc'],
				"<select name=\"save_con[group_{$group_id}][start][]\" class=\"edit bk\" style=\"width: 50%\" multiple>" . $this->Dashboard->GetGroups( explode( ',', $_GroupConfig['group_'.$group_id]['start'] ), 5 ) . "</select>"
			);

			$this->Dashboard->ThemeAddStr(
				$plugin_lang['a_type'],
				$plugin_lang['a_type_desc'],
				$this->Dashboard->GetSelect( $type, "save_con[group_{$group_id}][type]", $_GroupConfig['group_'.$group_id]['type']  ) . ( !$group_info['time_limit'] ? $plugin_lang['a_type_info'] : "" )
			);

			$this->Dashboard->ThemeAddStr(
				$plugin_lang['a_price'],
				$plugin_lang['a_price_desc'],
				"<textarea style=\"width:100%;height:100px;\" name=\"save_con[group_{$group_id}][price]\">".$_GroupConfig['group_'.$group_id]['price']."</textarea>"
			);

			$this->Dashboard->ThemeAddStr(
				$plugin_lang['a_link'],
				$plugin_lang['a_link_desc'],
				"<textarea style=\"width:100%;height:50px;\" onClick=\"this.focus(); this.select()\">&lt;a href='#' onClick='BillingGroup.Form({$group_id})'>{$plugin_lang['a_go']}&laquo;{$group_info['group_name']}&raquo;&lt;/a></textarea>"
			);

			$tabs[] = array(
					'id' => 'group_' . $group_id,
					'title' => $group_info['group_name'],
					'content' => $this->Dashboard->ThemeParserStr() . $this->Dashboard->ThemePadded( $this->Dashboard->MakeButton( "update", $plugin_lang['a_btn_update'], "green" ) )
			);
		}

		$Content = $this->Dashboard->PanelPlugin('plugins/paygroups', 'icon-cogs', $_Config['status'] );
		$Content .= $this->Dashboard->PanelTabs( $tabs );
		$Content .= $this->Dashboard->ThemeEchoFoother();

		return $Content;
	}

	private function SaveFileArray( $save_con )
	{
		$handler = fopen( MODULE_DATA . '/plugin.paygroups_list.php', "w" );

		fwrite( $handler, "<?PHP \n\n" );
        fwrite( $handler, "#Edit from " . $_SERVER['REQUEST_URI'] . " " . langdate('d.m.Y H:i:s', $this->_TIME) . " \n\n" );
        fwrite( $handler, "return array \n" );
        fwrite( $handler, "( \n" );

		foreach ( $save_con as $name => $info )
		{
			$this->array_parse( $name );

			fwrite( $handler, "'{$name}' => array(\n\n" );

			foreach ( $info as $info_key => $info_val )
			{
				$this->array_parse( $info_key );
				$this->array_parse( $info_val );

				fwrite( $handler, "'{$info_key}' => \"{$info_val}\",\n" );
			}

			fwrite( $handler, "),\n" );
		}

		fwrite( $handler, ");\n\n?>" );
		fclose( $handler );

		return;
	}

	private function array_parse( &$data )
	{
		$data = str_replace( "$", "&#036;", $data );
		$data = str_replace( "{", "&#123;", $data );
		$data = str_replace( "}", "&#125;", $data );
	}
}
?>
