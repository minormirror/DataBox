<?
include_once("db.const.php");

/*print_r($_REQUEST);*/

$email = $_REQUEST["email"];
$name = $_REQUEST["nickname"];
$passwort = $_REQUEST["passwort"];
$passwort_wiederholen = $_REQUEST["passwort_wiederholen"];
$validdata = false;
$error = "\n keine fehler gefunden";

$email = strtolower($email);
$name = strtolower($name);

function generateCode($length=40) {
  $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRQSTUVWXYZ0123456789";
  $code = "";
  $clen = strlen($chars) - 1;  //a variable with the fixed length of chars correct for the fence post issue
  while (strlen($code) < $length) {
    $code .= $chars[mt_rand(0,$clen)];  //mt_rand's range is inclusive - this is why we need 0 to n-1
  }
  return $code;
}

$gencode = $email. "_" .generateCode();
$message = "Herzlich willkommen bei DataBox,\n \n wir haben folgende Daten von Ihnen erhalten \n\n Ihr Name : ".
$name."\n Ihre Email Adresse : ".$email."\n\n Zur Aktivierung Ihres Accounts benutzen Sie bitte folgenden Link :\n\n 
http://www.freie-projekte-netz.de/data_box/classes/validate.php?key=".$gencode;

$subject = 'Ihre Accountdaten aktivieren bei DataBox';
$headers = 'From: horst-jochen@gmx.net' . "\r\n" .    
    'X-Mailer: PHP/' . phpversion();
/*print("\n\n".$message);*/

mail($email, $subject, $message, $headers);


/*testen der gültigkeit von eingaben*/
if (($passwort_wiederholen != null) && ($passwort != null) && ($name != null) && ($email != null)){
	if (($passwort == $passwort_wiederholen)){
		/*ausdruck email auf regular expression prüfen*/
		if (eregi("^[a-z0-9]+([-_\.]?[a-z0-9])+@[a-z0-9|ü|ä|ö]+([-_\.]?[a-z0-9|ü|ä|ö])+\.[a-z]{2,4}", $email)) {
			$validdata = true;
		} 
		else {
			$error = "Falsche email Adresse oder die Adresse ist nicht gültig";
		} 
	} 
	else {
		$error = "Ihre Passwörter stimmen nicht überein";
	}
}
else {
	$error = "Ihre Angaben sind unvollständig";
}


/*verbindung aufbauen*/
if ($validdata){
connectDB();
/*gültige Daten eintragen*/
 mysql_query("INSERT INTO ib_account (name,email,passwd,confirmKey) 
	VALUES ('".mysql_real_escape_string($name)."','". mysql_real_escape_string($email)."','".mysql_real_escape_string($passwort)."','".mysql_real_escape_string($gencode)."')")
	or die("\n Eintrag in Datenbank unterbrochen " . mysql_error());

header("Location: login.php?acc_ok=0");

mysql_close();
}else{
   header("Location: userneu.php?fehler=1&err_mesg=".$error);
}
?>
