<?php	if( ! defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );
/*
=====================================================
 QIWI Wallet - Payment system for DLE-Billing
-----------------------------------------------------
 ion1302@mail.ru
-----------------------------------------------------
 https://japing.pw/
 -----------------------------------------------------
 Copyright © 2018, Japing
=====================================================
*/

Class QIWIWALLET {

	function Settings( $config ) {
		$Form = array();

		$Form[] = array(
			"Номер кошелька:",
			"Номер кошелька, на который покупатель должен совершить платеж (с международным префиксом без +).",
			"<input name=\"save_con[wallet]\" class=\"form-control\" type=\"text\" value=\"" . $config['wallet'] ."\" style=\"width: 100%\">"
		);

		$Form[] = array(
			"Секретный ключ:",
			"Секретный ключ для проверки подписи.",
			"<input name=\"save_con[secret_key]\" class=\"form-control\" type=\"password\" value=\"" . $config['secret_key'] ."\" style=\"width: 100%\">"
		);

		return $Form;
	}

	function Form( $id, $config, $invoice, $currency, $desc ) {
		$exp = explode(".", $invoice['invoice_pay']);
		$amountInteger = $exp[0];
		$amountFraction = $exp[1];

		$desc = "qiwi #" . $id;

		return '
			<span style="font-size: 15px;color:red;">Обязательно проверьте чтоб данные совпадали на сайте QIWI</span>
			<table>
				<tr>
					<td style="padding-right: 40px;">Номер Кошелька получателя:</td>
					<td>+' . $config['wallet'] . '</td>
				</tr>
				<tr>
					<td>Сумма:</td>
					<td>' . $invoice['invoice_pay'] . '</td>
				</tr>
				<tr>
					<td>Валюта:</td>
					<td>Рубли</td>
				</tr>
				<tr>
					<td>Комментарий к переводу:</td>
					<td>' . $desc . '</td>
				</tr>
			</table>
			<br>
			<form method="get" id="paysys_form" target="_blank" accept-charset="utf-8" action="https://qiwi.com/payment/form.action">
				<input name="provider" value="99" type="hidden">
				<input name="amountInteger" value="' . $amountInteger . '" type="hidden">
				<input name="amountFraction" value="' . $amountFraction . '" type="hidden">
				<input name="extra[\'comment\']" value="' . $desc . '" type="hidden">
				<input name="extra[\'account\']" value="' . urlencode($config['wallet']) . '" type="hidden">
				<input name="currency" value="643" type="hidden">
				<input type="submit" class="btn" id="submitbutton" value="Оплатить">
			</form>';
	}

	function check_id( $data ) {
		$excomm = explode(" ", $data['payment']['comment']);
		$invid = end($excomm);
		$exinvid = $excomm = explode("#", $invid);
		$id = end($exinvid);

		return $id;
	}

	function check_payer_requisites( $data ) {
		return 'Wallet: ' . $data['payment']['account'];
	}

	function check_ok( $data ) {
		return 'OK';
	}

	function check_out( $data, $config, $invoice ) {

		if( ! $data['payment']['sum']['amount'] or $data['payment']['sum']['amount'] != $invoice['invoice_pay'] ) {
			return "Error: INCORRECT AMOUNT";
		}

		if( ! $data['payment']['personId'] or $data['payment']['personId'] != $config['wallet'] ) {
			return "Error: INCORRECT WALLET";
		}

		if( $data['test'] == 1 ) {
			return "TEST REQUEST";
		}
		
		if( $data['payment']['type'] != "IN" ) {
			return "Error: INCORRECT PAYMENT TYPE";
		}

		if( $data['payment']['status'] != "SUCCESS" ) {
			return "Error: INCORRECT PAYMENT STATUS";
		}

		if( $data['payment']['sum']['currency'] != "643" ) {
			return "Error: INCORRECT CURRENCY";
		}

		$string = $data['payment']['sum']['currency'] . "|" . $data['payment']['sum']['amount'] . "|" . $data['payment']['type'] . "|" . $data['payment']['account'] . "|" . $data['payment']['txnId'];
    	$sign = hash_hmac("sha256", $string, base64_decode($config['secret_key']));

		if (hash_equals($sign, $data['hash'])) {
			return 200;
		}

		return "Error: INCORRECT HASH";
	}
}

$Paysys = new QIWIWALLET;
if( $this->DevTools->get_method == "handler" ) {
	$DATA = json_decode(trim(file_get_contents("php://input")), true);
	$this->logging( 1, str_replace("\n", "<br>", print_r( $DATA, true )) );
}
?>