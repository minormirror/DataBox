<?php
include_once("db.const.php");

if (($_REQUEST["name_email"] != null) && ($_REQUEST["password"]!= null)){
$namemail = $_REQUEST["name_email"];
$passwort = $_REQUEST["password"];
} else {
header ("Location: login.php?fehler=1");
exit;
}
// Verbindung aufbauen
connectDB();
  // Session starten
  session_start ();

$sqlquery = "SELECT ".
    "name,passwd,email,enabled,confirmKey,date ".
  "FROM ".
    "ib_account ".
  "WHERE ".
    "((LCASE(name) like LCASE('".$namemail."')) OR (LCASE(email) like LCASE('".$namemail."'))) AND ".
    "((passwd like '".$passwort."') AND (enabled = 1))";

$results = mysql_query ($sqlquery);
if  (($results != null) && (mysql_num_rows ($results) > 0))
{
  // Benutzerdaten in ein Array auslesen.
  $data = mysql_fetch_array ($results);

  // Sessionvariablen erstellen und registrieren
  $_SESSION["user_name"] = $data["name"];
  $_SESSION["user_email"] = $data["email"];
  $_SESSION["user_enabled"] = $data["enabled"];
  $_SESSION["user_date"] = $data["date"];
  $_SESSION["browser_type"] = $REQUEST["browser_type"];

  $sqldat = "UPDATE ib_account SET date = CURRENT_TIMESTAMP() WHERE ".
			"((LCASE(name) like LCASE('".$namemail."')) OR (LCASE(email) like LCASE('".$namemail."'))) AND ".
			"((passwd like '".$passwort."') AND (enabled = 1))";

  mysql_query($sqldat) or die("\n Eintrag in Datenbank unterbrochen " . mysql_error());
  $_SESSION["user_date"] = $data["date"];
  header ("Location: projekte.php");
}
else
{
  header ("Location: login.php?fehler=1");
}
?>
