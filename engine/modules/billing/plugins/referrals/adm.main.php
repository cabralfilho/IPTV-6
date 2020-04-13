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
	var $_Config = array();

	function main()
	{
		# Настройки и установка
		#
		$_Lang = include MODULE_PATH . "/plugins/referrals/lang.php";

		if( ! file_exists( MODULE_DATA . "/plugin.referrals.php" ) )
		{
			$this->install();
		}

		$_Config = $this->Dashboard->LoadConfig( "referrals" );

		# Сохранить настройки
		#
		if( isset( $_POST['save'] ) )
		{
			if( $_POST['user_hash'] == "" or $_POST['user_hash'] != $this->Dashboard->hash )
			{
				return "Hacking attempt! User not found {$_POST['user_hash']}";
			}

			$_POST['save_con']['bonuses'] = $_Config['bonuses'];

			$this->Dashboard->SaveConfig("plugin.referrals", $_POST['save_con']);
			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $this->Dashboard->lang['save_settings'] );
		}

		# Сохранить бонусы
		#
		if( isset( $_POST['update'] ) )
		{
			$_added = $_POST['added_bonus'];
			$_saved = array();

			foreach ($_added as $id => $value)
			{
				$_act = $value['act'] == '+' ? '+' : '-';

				$_saved[] = $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $value['plugin']) ) .
							'|' . $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $value['desc']) ) .
							'|' . $this->Dashboard->API->Convert($value['bonus']) .
							'|' . intval($value['bonus_percent']) .
							'|' . $_act .
							'|' . $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $value['sum']) );
			}

			$_new_config = $_Config;
			$_new_config['bonuses'] .= '||' . implode('||', $_saved);

			$this->Dashboard->SaveConfig("plugin.referrals", $_new_config);
			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $_Lang['bonus_add'] );
		}

		# Изменить бонус
		#
		if( isset( $_POST['save_bonus'] ) )
		{
			$_edit_id = intval( $_POST['edit_number'] );

			if( $_edit_id )
			{
				$edit_plugin = $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $_POST['edit_plugin']) );
				$edit_desc = $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $_POST['edit_desc']) );
				$edit_act = $_POST['edit_act'] == '+' ? '+' : '-';
				$edit_sum = $this->Dashboard->LQuery->db->safesql( str_replace("|", '/', $_POST['edit_sum']) );
				$edit_bonus = $this->Dashboard->API->Convert($_POST['edit_bonus']);
				$edit_bonus_percent = intval( $_POST['edit_bonus_percent'] );

				$position_id = 0;
				$_save_bonuses = array();

				foreach (explode('||', $_Config['bonuses']) as $bonus_string)
				{
					$bonus = explode('|', $bonus_string);

					if( ! $bonus[2] )
					{
						continue;
					}

					$position_id ++;

					if( $position_id == $_edit_id )
					{
						$_save_bonuses[] = $edit_plugin .
											'|' . $edit_desc .
											'|' . $edit_bonus .
											'|' . $edit_bonus_percent .
											'|' . $edit_act .
											'|' . $edit_sum;
					}
					else
					{
						$_save_bonuses[] = $bonus_string;
					}
				}

				$_new_config = $_Config;
				$_new_config['bonuses'] = implode('||', $_save_bonuses);

				$this->Dashboard->SaveConfig("plugin.referrals", $_new_config);
				$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $_Lang['bonus_save'], '?mod=billing&c=referrals' );
			}
		}

		# Удалить бонус
		#
		if( $remove_id = intval( $_GET['remove'] ) )
		{
			$_new_bonuses = array();

			$position_id = 0;

			foreach (explode('||', $_Config['bonuses']) as $bonus_string)
			{
				$bonus = explode('|', $bonus_string);

				if( ! $bonus[2] )
				{
					continue;
				}

				$position_id ++;

				if( $position_id != $remove_id )
				{
					$_new_bonuses[] = $bonus_string;
				}
			}

			$_new_config = $_Config;
			$_new_config['bonuses'] = implode('||', $_new_bonuses);

			$this->Dashboard->SaveConfig("plugin.referrals", $_new_config);
			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $_Lang['bonus_remove'], '?mod=billing&c=referrals' );
		}

		# Приглашения
		#
		$this->Dashboard->ThemeEchoHeader();

		$this->Dashboard->ThemeAddTR( array(
			'<td width="1%">#</td>',
			'<td width="15%">' . $this->Dashboard->lang['history_date'] . '</td>',
			'<td style="text-align: left">' . $_Lang['from'] . '</td>',
			'<td width="15%">' . $_Lang['to'] . '</td>'
		));

		$PerPage = $this->Dashboard->config['paging'];
		$StartFrom = intval( $GET['page'] );

		$this->Dashboard->LQuery->parsPage( $StartFrom, $PerPage );

		$ResultCount = $this->Dashboard->LQuery->db->super_query( "SELECT COUNT(*) as count
																	FROM " . USERPREFIX . "_billing_referrals" );

		$this->Dashboard->LQuery->db->query( "SELECT * FROM " . USERPREFIX . "_billing_referrals ORDER BY ref_id desc LIMIT {$StartFrom}, {$PerPage}" );

		while ( $Value = $this->Dashboard->LQuery->db->get_row() )
		{
			$this->Dashboard->ThemeAddTR( array(
				$Value['ref_id'],
				$this->Dashboard->ThemeChangeTime( $Value['ref_time'] ),
				$this->Dashboard->ThemeInfoUser( $Value['ref_login'] ),
				$this->Dashboard->ThemeInfoUser( $Value['ref_from'] )
			));
		}

		$TabFirst .= $this->Dashboard->ThemeParserTable();

		if( $ResultCount['count'])
		{
			$TabFirst .= $this->Dashboard->ThemePadded( '
				<div class="pull-left" style="margin:7px; vertical-align: middle">
					<ul class="pagination pagination-sm">' .
						$this->Dashboard->API->Pagination(
							$ResultCount['count'],
							$GET['page'],
							$PHP_SELF .
							"?mod=billing&c=referrals&p=page/{p}",
							" <li><a href=\"{page_num_link}\">{page_num}</a></li>",
							"<li class=\"active\"><span>{page_num}</span></li>",
							$PerPage
						) . '</ul>
					</ul>
				</div>', 'box-footer', 'right' );
		}
		else
		{
			$TabFirst .= $this->Dashboard->ThemePadded( $this->Dashboard->lang['history_no'], '' );
		}

		$TabFirst .= $this->Dashboard->ThemeParserStr();

		$tabs[] = array(
				'id' => 'list',
				'title' => $_Lang['users'],
				'content' => $TabFirst
		);

		# Конструктор бонусов
		#
		$this->Dashboard->ThemeAddTR( array( $_Lang['table_header'] ));

		$remove_num = 0;

		foreach ( explode('||', $_Config['bonuses']) as $bonus_string)
		{
			$bonus = explode('|', $bonus_string);

			if( ! $bonus[2] )
			{
				continue;
			}

			$remove_num++;

			$this->Dashboard->ThemeAddTR( array(
				$remove_num,
				$bonus[0],
				$bonus[1],
				( $bonus[4] == '+' ? $_Lang['plus'] : $_Lang['minus'] ),
				$bonus[5],
				( $bonus[3] ? $bonus[3] . ' %' : $bonus[2] . ' ' . $this->Dashboard->API->Declension( $bonus[2] ) ),
				"<center>
					<a href='#' onClick='logShowDialogByID( \"#bonus_{$remove_num}\" ); return false' class='tip' title='{$_Lang['edit']}'><i class='icon-cogs' style='cursor: pointer'></i></a>&nbsp;&mdash;&nbsp;
					<a href='?mod=billing&c=referrals&remove={$remove_num}' class='tip' title='{$_Lang['remove']}'><i class='icon-trash' style='cursor: pointer'></i></a>
				 </center>
				 <div id=\"bonus_" . $remove_num . "\" title=\"{$_Lang['edit']} #{$remove_num}\" style=\"display:none\">
					</form><form action=\"\" method=\"post\">
						<input name='edit_number' value='{$remove_num}' type='hidden'>
						<input name='edit_plugin' value='{$bonus[0]}' class='edit bk' type='text' style='width: 100%'><br /><br />
						<input name='edit_desc' value='{$bonus[1]}' class='edit bk' type='text' style='width: 100%'><br /><br />
						<select name='edit_act' style='width: 100%'><option value='-'>{$_Lang['minus']}</option><option value='+' " . ( $bonus[4] == '+' ? ' selected' : '' ) . ">{$_Lang['plus']}</option></select><br /><br />
						<input name='edit_sum' value='{$bonus[5]}' class='edit bk' type='text' style='width: 100%'><br /><br />
						<input name='edit_bonus' value='{$bonus[2]}' class='edit bk' type='text' style='width: 85%'> {$this->Dashboard->API->Declension( $bonus[2] )}<br><br>
						<input name='edit_bonus_percent' value='{$bonus[3]}' class='edit bk' type='text' style='width: 85%'> %<br /><br />
						" . $this->Dashboard->MakeButton("save_bonus", $this->Dashboard->lang['save'], "green") . "
					</form>
				 </div>"
			));
		}

		$TabSecond = $this->Dashboard->ThemeParserTable('bonuses-list');

		if( ! $_Config['bonuses'] )
		{
			$TabSecond .= $_Lang['null'];
		}

		$TabSecond .= $this->Dashboard->ThemePadded(
			'<input class="btn btn-blue" style="margin:7px;" onClick="billingReferralsAdd()" type="button" value="+ Добавить">' .
			 $this->Dashboard->MakeButton("update", $this->Dashboard->lang['save'], "green")
		);


		$tabs[] = array(
				'id' => 'bonus',
				'title' => $_Lang['partner_bonus'],
				'content' => $TabSecond
		);

		# Форма настроек
		#
		$this->Dashboard->ThemeAddStr(
			$this->Dashboard->lang['settings_status'],
			$this->Dashboard->lang['refund_status_desc'],
			$this->Dashboard->MakeCheckBox("save_con[status]", $_Config['status'])
		);

		$this->Dashboard->ThemeAddStr(
			$_Lang['setting_1'],
			$_Lang['setting_1_d'],
			"<input name=\"save_con[name]\" style=\"width: 100%\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['name'] ."\">"
		);

		$this->Dashboard->ThemeAddStr(
			$_Lang['setting_2'],
			$_Lang['setting_2_d'],
			"<input name=\"save_con[link]\" style=\"width: 100%\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['link'] ."\">"
		);

		$this->Dashboard->ThemeAddStr(
			$_Lang['setting_3'],
			$_Lang['setting_3_d'],
			"<input name=\"save_con[bonus]\" style=\"width: 20%\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['bonus'] ."\"> " . $this->Dashboard->API->Declension( $_Config['bonus'] )
		);

		$TabThird = $this->Dashboard->ThemeParserStr();
		$TabThird .= $this->Dashboard->ThemePadded( $this->Dashboard->MakeButton("save", $this->Dashboard->lang['save'], "green") );

		$tabs[] = array(
				'id' => 'settings',
				'title' => $_Lang['settings'],
				'content' => $TabThird
		);

		$Content = $this->Dashboard->PanelPlugin('plugins/referrals', 'icon-cogs', $_Config['status'] );
		$Content .= '<script type="text/javascript" src="engine/modules/billing/plugins/referrals/icon/referrals.js"></script>';
		$Content .= $this->Dashboard->PanelTabs( $tabs );

		$Content .= $this->Dashboard->ThemeEchoFoother();

		return $Content;
	}

	# Установка
	#
	private function install()
	{
		$tableSchema = array();
		$tableSchema[] = "DROP TABLE IF EXISTS " . PREFIX . "_billing_referrals";
		$tableSchema[] = "CREATE TABLE IF NOT EXISTS `" . PREFIX . "_billing_referrals` (
							  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
							  `ref_time` int(11) NOT NULL,
							  `ref_login` varchar(21) NOT NULL,
							  `ref_user_id` int(11) NOT NULL,
							  `ref_from` varchar(21) NOT NULL,
							  PRIMARY KEY (`ref_id`)
							) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

		foreach( $tableSchema as $table )  $this->Dashboard->LQuery->db->super_query($table);

		$this->Dashboard->SaveConfig("plugin.referrals", array('status'=>"0"));

		return;
	}
}
?>
