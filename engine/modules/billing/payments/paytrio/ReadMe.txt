///////////////////////////////////////
//     				     //
//     >>>PAY-TRIO.COM<<<            //
//     Автор скрипта: PHPSID         //
//            - - -          	     //
//     Email: phpsid@bk.ru 	     //
//	   Skype: phpsid 	     //
//            - - -    		     //
//	   Email2: support@strah.tv  //
//     Skype2: support@strah.tv      //
//                                   //
///////////////////////////////////////

Установить ( если не установлен ): https://dle-billing.ru
Залить содержимое папки upload в корень сайта с заменой.
Перейти в админку DLE=>Баланс пользователя=>Платежные системы=>PAY-TRIO и настроить, но сперва:

Зарегистрироваться https://my.pay-trio.com/ru/register/
Создать магазин https://my.pay-trio.com/ru/shops/create/
Настроить магазин;

URL уведомлений: http://site.com/billing.html/pay/handler/payment/paytrio/key/ВАШ_КЛЮЧ/

Success URL: http://site.com/billing.html/pay/ok/

Failed URL: http://site.com/billing.html/pay/bad/

В настройках безопасности магазина сгенерировать ключ, скопировать, сохранить и указать в настройках интеграции DLE=>Баланс пользователя=>Платежные системы=>PAY-TRIO и там же ID магазина, и выбрать в какой валюте будете принимать оплату: RUB/USD/UAH/EUR.
