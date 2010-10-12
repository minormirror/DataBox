<?
$error_list = "";
$host = "localhost";
$user = "web64";
$password = "web1n641";
$db = "usr_web64_1";

function connectDB(){
  $host = "localhost";
  $user = "web64";
  $password = "web1n641";
  $db = "usr_web64_1";
  $connectionid = mysql_connect($host, $user , $password)  or die("\n Keine Verbindung möglich: " . mysql_error());
  if (!mysql_select_db ($db, $connectionid)) { 
    die ("\n Auswahl der Datenbank fehlgeschlagenk"); 
  } 
}
?>
