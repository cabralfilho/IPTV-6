<?php	if( ! defined( 'BILLING_MODULE' ) ) die( "Hacking attempt!" );


///////////////////////////////////////
//     								 //
//     >>>PAY-TRIO.COM<<<            //
//     Автор скрипта: PHPSID 		 //
//            - - -          		 //
//     Email: phpsid@bk.ru 			 //
//	   Skype: phpsid 			     //
//            - - -    				 //
//	   Email2: support@strah.tv      //
//     Skype2: support@strah.tv      //
//                                   //
///////////////////////////////////////


Class Payment
{
	

	function Settings( $config )
	{
		$Form = array();

		$Form[] = array(
			"Идентификатор магазина:",
			"Ваш ID магазина в системе Pay-trio.com",
			"<input name=\"save_con[id]\" class=\"edit bk\" type=\"text\" style=\"width: 100%\" value=\"" . $config['id'] ."\">"
		);

		$Form[] = array(
			"Секретный ключ:",
			"Используется в настройках магазина.",
			"<input name=\"save_con[key]\" class=\"edit bk\" type=\"password\" style=\"width: 100%\" value=\"" . $config['key'] ."\">"
		);
     
	 
	    $Form[] = array(
			"Какая валюта:",
			"Выберите режим работы оплаты.",
			"<select name=\"save_con[cur]\" class=\"uniform\">
				<option value=\"643\" " . ( $config['cur'] == '643' ? "selected" : "" ) . ">RUB</option>
				<option value=\"840\" " . ( $config['cur'] == '840' ? "selected" : "" ) . ">USD</option>
				<option value=\"978\" " . ( $config['cur'] == '978' ? "selected" : "" ) . ">EUR</option>
				<option value=\"980\" " . ( $config['cur'] == '980' ? "selected" : "" ) . ">UAH</option>
			</select>"
		);
	 
	 
	 
		return $Form;
	}

	function Form( $id, $config, $invoice, $currency, $desc )
	{
	
		$sign_hash = md5($invoice['invoice_pay'].':'.$config['cur'].':'.$config['id'].':'.$id.$config['key']);

	
 			  
		return '
	<form name="Pay" id="paysys_form" method="post" action="https://tip.pay-trio.com/ru/" accept-charset="UTF-8"> 
	<input type="hidden" name="amount" value="' . $invoice['invoice_pay'] . '" /> 
	<input type="hidden" name="currency" value="'. $config['cur'] .'" /> 
	<input type="hidden" name="shop_id" value="' . $config['id'] . '" /> 
	<input type="hidden" name="sign" value="'. $sign_hash . '" /> 
	<input type="hidden" name="shop_invoice_id" value="' . $id . '" /> 
	<input type="hidden" name="description" value="' .$desc. ' ['.$_SERVER['HTTP_HOST'].']" /> 
	<input type="submit" value="К выбору способа оплаты>>">
	</form>';

	}

 

function check_payer_requisites( $data )
	{
	$CURR_ID = array('beeline_rub'=>'Билайн RUB','mts_rub'=>'МТС RUB','megafon_rub'=>'МегаФон RUB','tele2_rub'=>'Теле2 RUB','card_uah'=>'Visa/MasterCard UAH','card_rub'=>'Visa/MasterCard RUB','privat24_uah'=>'Приват24 UAH','terminal_rub'=>'Терминал (Россия)','alfaclick_rub'=>'АльфаКлик RUB','psbretail_rub'=>'ПромСвязьБанк RUB','perfectmoney_usd'=>'PrefectMoney USD','perfectmoney_eur'=>'PrefectMoney EUR','qiwi_usd'=>'Qiwi USD','qiwi_rub'=>'Qiwi RUB','qiwi_eur'=>'Qiwi EUR','yamoney_rub'=>'Яндекс.Деньги','payeer_usd'=>'Payeer USD','payeer_rub'=>'Payeer RUB','payeer_eur'=>'Payeer EUR');	
if($data["ps_data"]!='null') 
{ 
$returnValue = json_decode($data["ps_data"], true);
return  $returnValue["ps_payer_account"].' / '.$CURR_ID[$data["payway"]];
} 
else
{
return  $CURR_ID[$data["payway"]];
}
	}
 


  

	function check_id( $data )
	{
		return $data["shop_invoice_id"];
	}

	function check_ok( $data )
	{
		return 'OK'.$data["shop_invoice_id"];
	}

	function check_out( $data, $config, $invoice )
	{
		
	/*
     $my_crc =  md5($data['shop_amount'].':'.$config['cur'].':'.$config['id'].':'.$data["shop_invoice_id"].$config['key']);
		
		if ($my_crc != $data["sign"])
		{
			return "bad sign\n";
		}
*/
      if ($data["status"]!=3)
		{
			return "Payment failed\n";
		}

		return 200;
	}
} 

$Paysys = new Payment;
?>
