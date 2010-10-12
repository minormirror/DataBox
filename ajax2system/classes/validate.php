<?php
include_once("db.const.php");

if ($_REQUEST["key"] != null) {
	$key = $_REQUEST["key"];
	connectDB();
	$sqlquery = "SELECT ". 
		"name,passwd,email,enabled,confirmKey,date ". 
		"FROM ". 
		"ib_account ". 
		"WHERE ". 
		"(confirmKey = '".$key."')";
	$results = mysql_query ($sqlquery); 
	if  (mysql_num_rows ($results) > 0) { 
	// Benutzerdaten in ein Array auslesen. 
	$data = mysql_fetch_array ($results); 
	
	$name = $data["name"];
	$email = $data["email"];
	$pass = $data["passwd"];
	$key_ref["key_ref"] = $data["confirmKey"]; 
	$enabled = 1;
	$date = getDate();
	
	mysql_query("update ib_account set enabled = '$enabled', date = '$date' WHERE (confirmKey = '".$key."')")
	or die("\n Eintrag in Datenbank unterbrochen " . mysql_error());
	
	$message = "Herzlich willkommen bei DataBox,\n \n wir haben folgende Daten von Ihnen erhalten \n\n Ihr Name : ".
	$name."\n Ihre Email Adresse : ".$email." \n Ihr Passwort lautet : ".$pass."\n\n Ihr Account wurde freigeschaltet. Sie können sich nun unter \n
	http://www.freie-projekte-netz.de/data_box/index.php \n bei uns einloggen \n\n mfg Ihr DataBox Projektteam";

	$subject = 'Ihr Account bei DataBox ist nun aktiv';
	$headers = 'From: horst-jochen@gmx.net' . "\r\n" .    
	'X-Mailer: PHP/' . phpversion();
	mail($email, $subject, $message, $headers);
	
	mysql_close();
	header ("Location: login.php");
	
	}else{header ("Location: login.php?acc_ok=1");}
} else {
header ("Location: login.php?fehler=3");
exit;
}
?>
