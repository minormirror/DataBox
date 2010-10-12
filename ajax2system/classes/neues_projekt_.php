<?php 
include_once("db.const.php");
include ("benutzer_session.php"); 
//session_start();
$proj_bezeichnung = $_REQUEST["proj_bez"];
$proj_beschreibung = $_REQUEST["projektbeschreibung"];

$validdata = true;
$error = "\n keine fehler gefunden";

$proj_bezeichnung = strtolower($proj_bezeichnung);

/*verbindung aufbauen*/
if ($validdata){
connectDB();
/*gültige Daten eintragen*/
$sqlab_proj  = "INSERT INTO  ib_projectlist (proj_bezeichnung, proj_beschreibung) VALUES ('".mysql_real_escape_string($proj_bezeichnung)."','".mysql_real_escape_string($proj_beschreibung)."')";
mysql_query($sqlab_proj); 
header ("Location: projekte.php");
mysql_close();
}else{
   header("Location: userneu.php?fehler=1&err_mesg=".$error);
}
?>