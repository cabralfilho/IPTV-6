<?php	if( !defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );
/*
=====================================================
 PayPal - Payment system for DLE-Billing
-----------------------------------------------------
 ion1302@mail.ru
-----------------------------------------------------
 https://japing.pw/
 -----------------------------------------------------
 Copyright © 2017, Japing
=====================================================
*/

Class Payment 
{
	//var $paypal_url = "https://www.sandbox.paypal.com/cgi-bin/webscr"; // FOR TEST
	var $paypal_url = "https://www.paypal.com/cgi-bin/webscr";

	function Settings( $config ) {

		$Currency = array('','USD','EUR','RUB','AUD','CAD','PLN','GBP','TRY','SGD');

		$Option = array();
		foreach($Currency as $Curr){
			$Option[] = "<option value=\"$Curr\"" . ( $config['currency_code'] == $Curr ? "selected" : "" ) .">$Curr</option>";
		}
		$Options = implode("", $Option);

		$Form = array();

		$Form[] = array(
			"Идентификатор магазина:",
			"Ваш <b>Email</b> или <b>Merchant account ID</b> в системе PayPal.",
			"<input name=\"save_con[merchant_account]\" class=\"edit bk\" type=\"text\" value=\"" . $config['merchant_account'] ."\">"
		);
		$Form[] = array(
			"Код валюты:",
			"<a href=\"https://developer.paypal.com/docs/classic/api/currency_codes/\" target=\"_blank\">В какой валюте совершить платеж.</a>",
			"<select name=\"save_con[currency_code]\" class=\"uniform\">" . $Options . "</select>"
		);
	
		return $Form;
	}
	
	function Form( $id, $config, $invoice, $currency, $desc = '' ) {
	
		if( !$desc ) $desc = 'Пополнение баланса пользователем '.$invoice['invoice_user_name'].' на сумму '.$invoice['invoice_get'].' '.$currency;

		return '
			<form method="post" id="paysys_form" action="'.$this->paypal_url.'">

				<input type="hidden" name="cmd" value="_xclick">
				<input type="hidden" name="business" value="'.$config['merchant_account'].'">
				<input type="hidden" name="item_number" value="'.$id.'">
				<input type="hidden" name="amount" value="'.$invoice['invoice_pay'].'">
				<input type="hidden" name="currency_code" value="'.$config['currency_code'].'"> 
				<input type="hidden" name="item_name" value="'.$desc.'">
				<input type="hidden" name="no_shipping" value="1">
				<input type="hidden" name="charset" value="'.$this->config_dle['charset'].'"> 
				<input type="hidden" name="rm" value="1">
				<input type="hidden" name="return" value="'.$this->config_dle['http_home_url'].$this->config['page'].'.html/pay/ok">
				<input type="hidden" name="cancel_return" value="'.$this->config_dle['http_home_url'].$this->config['page'].'.html/pay/bad">

				<input type="submit" class="btn" value="Оплатить">

			</form>';

	}

	function check_id( $DATA ) {

		return $DATA["item_number"];

	}

	function check_payer_requisites( $DATA ) {

		return 'Email: ' . $DATA["payer_email"].' / Статус: ' . $DATA["payer_status"].' / Страна: ' . $DATA["residence_country"].' / Зачислено: '.($DATA["mc_gross"]-$DATA["mc_fee"]).' (комиссия: '.$DATA["mc_fee"].') '.$DATA["mc_currency"];

	}

	function check_ok( $DATA ) {

		return 200;

	}

	function check_out( $DATA, $CONFIG, $INVOICE ) {

		if( $DATA['receiver_email'] != $CONFIG['merchant_account'] AND $DATA['receiver_id'] != $CONFIG['merchant_account'] )
			return "Error: MERCHANT_ACCOUNT";

		if( $DATA['payment_status'] != "Completed" )
			return "Error: PAYMENT_STATUS";

		if( $DATA['mc_gross'] != $INVOICE['invoice_pay'] )
			return "Error: PAYMENT_AMOUNT";

		if( $DATA['mc_currency'] != $CONFIG['currency_code'] )
			return "Error: CURRENCY_CODE";

		if( $DATA['txn_type'] != "web_accept" )
			return "Error: TXN_TYPE";
      /*
		$validatedata = "cmd=_notify-validate";  
		foreach ($DATA as $key => $value) $validatedata .= "&".$key."=".urlencode($value); 

		$curl = curl_init( $this->paypal_url );
		curl_setopt($curl, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1); 		
		curl_setopt($curl, CURLOPT_POST, 1);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $validatedata);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
		curl_setopt($curl, CURLOPT_FORBID_REUSE, 1);
		curl_setopt($curl, CURLOPT_HTTPHEADER, array('Connection: Close'));
 		$response = curl_exec ($curl); 
		curl_close ($curl);
		
		 
    
		if ($DATA["payer_status"] != "VERIFIED") {
			return "Error: NOT_VALID";
		}
		 */
		return 200;

	}
 
}

$Paysys = new Payment;
$Paysys->config_dle = $this->DevTools->dle;
$Paysys->config = $this->DevTools->config;

?>