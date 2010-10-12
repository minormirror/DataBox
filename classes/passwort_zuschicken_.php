<?php
include_once("db.const.php");

	if ($_REQUEST["email"] != null ){
		$namemail = $_REQUEST["email"];
		$namemail = strtolower($namemail);

	} else {
	header ("Location: passwort_zuschicken.php?fehler=2");
	exit;
	}

	connectDB();
	
	$sqlquery = "SELECT ". 
	"name,passwd,email,enabled FROM ib_account WHERE ". 
	"((email like '".$namemail."') && (enabled = 1))"; /*&& (enabled == true)*/
	
	$results = mysql_query ($sqlquery);
	
	if  ((mysql_num_rows ($results) != null) && (mysql_num_rows ($results) > 0))
	{ 
	
	$acco_num = mysql_fetch_array($results, MYSQL_ASSOC);
	
	$message = "Herzlich willkommen bei DataBox,\n\nfolgende Daten von Ihnen sind  bei uns registriert : \n\nIhr Name : ".
	$acco_num["name"]."\nIhre Email Adresse : " .$acco_num["email"]. "\nIhr Passwort lautet : " .$acco_num["passwd"]. "
	\n\nUm sich erneut einzuloggen benutzen Sie bitte folgenden Link :\n\n 
	http://www.freie-projekte-netz.de/data_box/classes/login.php";

	$subject = 'Accountdaten Erinnerung bei DataBox';
	$headers = 'From: horst-jochen@gmx.net' . "\r\n" .    
	'X-Mailer: PHP/' . phpversion();
	mail($acco_num["email"], $subject, $message, $headers);
	header ("Location: login.php?remember=1");
	
        } else { 
		header ("Location: passwort_zuschicken.php?fehler=2");
	}

?>
