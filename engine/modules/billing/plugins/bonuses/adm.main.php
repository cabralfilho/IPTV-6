<?php	if( ! defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );
/**
 * DLE Billing
 *
 * @link          https://github.com/mr-Evgen/dle-billing-module
 * @author        dle-billing.ru <evgeny.tc@gmail.com>
 * @copyright     Copyright (c) 2012-2017, mr_Evgen
 */

Class ADMIN
{
	var $_Lang = array();

	function __construct()
	{
		$this->_Lang = require MODULE_PATH . '/plugins/bonuses/lang.php';
	}

	function main()
	{
		# Файл настроек
		#
		$_Config = $this->Dashboard->LoadConfig( "bonuses", true, array('status'=>"0") );

		# Сохранить настройки
		#
		if( isset( $_POST['save'] ) )
		{
			if( $_POST['user_hash'] == "" or $_POST['user_hash'] != $this->Dashboard->hash )
			{
				return "Hacking attempt! User not found {$_POST['user_hash']}";
			}

			$_POST['save_con']['active_from'] = implode(",", $_POST['active_from']);

			$this->Dashboard->SaveConfig("plugin.bonuses", $_POST['save_con']);
			$this->Dashboard->ThemeMsg( $this->Dashboard->lang['ok'], $this->Dashboard->lang['save_settings'] );
		}

		# Tab 1
		#
		$this->Dashboard->ThemeEchoHeader();

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['on'],
			$this->_Lang['on_desc'],
			$this->Dashboard->MakeCheckBox("save_con[status]", $_Config['status'])
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['sum'],
			$this->_Lang['sum_desc'],
			"<input name=\"save_con[f_sum]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['f_sum'] ."\">"
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['bonus'],
			$this->_Lang['bonus_f_desc'],
			"<input name=\"save_con[f_bonus_sum]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['f_bonus_sum'] ."\"> "
				. $this->Dashboard->API->Declension( $_Config['f_bonus_sum'] )
				. " / <input name=\"save_con[f_bonus_percent]\" class=\"edit bk\" style=\"width: 50px\" type=\"text\" value=\"" . $_Config['f_bonus_percent'] ."\" /> %"
	 	);

		$tabs[] = array(
				'id' => 'tab1',
				'title' => $this->_Lang['tab1'],
				'content' => $this->Dashboard->ThemeParserStr()
		);

		# Tab 2
		#
		$this->Dashboard->ThemeAddStr(
			$this->_Lang['on'],
			$this->_Lang['on_desc'],
			$this->Dashboard->MakeCheckBox("save_con[s_status]", $_Config['s_status'])
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['sum'],
			$this->_Lang['sum_s_desc'],
			"<input name=\"save_con[s_sum]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['s_sum'] ."\">"
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['bonus'],
			$this->_Lang['bonus_s_desc'],
			"<input name=\"save_con[s_bonus_sum]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['s_bonus_sum'] ."\"> "
				. $this->Dashboard->API->Declension( $_Config['s_bonus_sum'] )
				. " / <input name=\"save_con[s_bonus_percent]\" class=\"edit bk\" style=\"width: 50px\" type=\"text\" value=\"" . $_Config['s_bonus_percent'] ."\" /> %"
		);

		$tabs[] = array(
				'id' => 'tab2',
				'title' => $this->_Lang['tab2'],
				'content' => $this->Dashboard->ThemeParserStr()
		);

		# Tab 3
		#
		$this->Dashboard->ThemeAddStr(
			$this->_Lang['on'],
			$this->_Lang['on_desc'],
			$this->Dashboard->MakeCheckBox("save_con[t_status]", $_Config['t_status'])
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['bonus'],
			$this->_Lang['bonus_t_desc'],
			"<input name=\"save_con[t_bonus_sum]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['t_bonus_sum'] ."\"> "
				. $this->Dashboard->API->Declension( $_Config['t_bonus_sum'] )
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['alert_pm'],
			$this->_Lang['alert_pm_desc']  . ( $this->Dashboard->config['mail_balance_pm'] ? '' : $this->_Lang['mail_off'] ),
			$this->Dashboard->MakeCheckBox("save_con[bonus3_alert_pm]", $_Config['bonus3_alert_pm'])
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['alert_main'],
			$this->_Lang['alert_main_desc']  . ( $this->Dashboard->config['mail_balance_pm'] ? '' : $this->_Lang['mail_off'] ),
			$this->Dashboard->MakeCheckBox("save_con[bonus3_alert_main]", $_Config['bonus3_alert_main'])
		);

		$tabs[] = array(
				'id' => 'tab3',
				'title' => $this->_Lang['tab3'],
				'content' => $this->Dashboard->ThemeParserStr()
		);

		# Tab 4
		#
		$this->Dashboard->ThemeAddStr(
			$this->_Lang['on'],
			$this->_Lang['on_desc'],
			$this->Dashboard->MakeCheckBox("save_con[active_status]", $_Config['active_status'])
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['active_from'],
			$this->_Lang['active_from_desc'],
			"<select name=\"active_from[]\" class=\"edit bk\" style=\"width: 50%\" multiple>" . $this->Dashboard->GetGroups( explode(",", $_Config['active_from']), 5 ) . "</select>"
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['active_sum'],
			$this->_Lang['active_sum_desc'],
			"<input name=\"save_con[active_min]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['active_min'] ."\"> "
				. $this->Dashboard->API->Declension( $_Config['active_min'] )
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['active_bills'],
			$this->_Lang['active_bills_desc'],
			"<input name=\"save_con[active_count]\" class=\"edit bk\" type=\"text\" value=\"" . $_Config['active_count'] ."\">"
		);

		$this->Dashboard->ThemeAddStr(
			$this->_Lang['active_to'],
			$this->_Lang['active_to_desc'],
			"<select name=\"save_con[active_to]\" class=\"edit bk\" style=\"width: 50%\">" . $this->Dashboard->GetGroups( $_Config['active_to'], array(1, 5) ) . "</select>"
		);

		$tabs[] = array(
				'id' => 'tab4',
				'title' => $this->_Lang['tab4'],
				'content' => $this->Dashboard->ThemeParserStr()
		);

		$Content = $this->Dashboard->PanelPlugin('plugins/bonuses', 'icon-cogs', $_Config['status'] );
		$Content .= $this->Dashboard->PanelTabs( $tabs, $this->Dashboard->ThemePadded( $this->Dashboard->MakeButton( "save", $this->Dashboard->lang['save'], "green" ) ) );
		$Content .= $this->Dashboard->ThemeEchoFoother();

		return $Content;
	}
}
?>
