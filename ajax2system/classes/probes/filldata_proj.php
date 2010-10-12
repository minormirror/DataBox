<?php 

include_once("../db.const.php");
// Definition der Benutzer 
$benutzer[0]["proj_bezeichnung"] ="adminProjekt"; 
$benutzer[0]["proj_beschreibung"] = "hallo., hier ein kleiner test mit mir admin"; 

$benutzer[1]["proj_bezeichnung"] = "test 3"; 
$benutzer[1]["proj_beschreibung"] = "abcflkksjflkwjflskegjwepogjseogjwglojw"; 

$benutzer[2]["proj_bezeichnung"] = "Heinz Strunks Projekt"; 
$benutzer[2]["proj_beschreibung"] = "pansen ist super und dazu muss man stehen"; 

// Sie können an dieser Stelle beliebig viele Benutzer anlegen. 
// Achten Sie dabei nur auf die Fortführung der Nummer. 

// Aufbau der Datenbankverbindung 
$connectionid  = mysql_connect($host, $user , $password);
if (!mysql_select_db ($db, $connectionid)) 
{ 
  die ("Keine Verbindung zur Datenbank"); 
} 

// Zuerst alle Datensätze löschen um keine Dopplungen zu bekommen. 
mysql_query ("DELETE FROM ib_projectlist"); 

// Daten eintragen 
while (list ($key, $value) = each ($benutzer)) 
{ 
  // SQL-Anweisung erstellen 
  $sql = "INSERT INTO ".
    "ib_projectlist (proj_bezeichnung, proj_beschreibung) ".
  "VALUES ('".$value["proj_bezeichnung"]."', '".$value["proj_beschreibung"]."')"; 
  mysql_query ($sql); 

  if (mysql_affected_rows ($connectionid) > 0) 
  { 
    echo "Benutzer erfolgreich angelegt.<br>\n"; 
  } 
  else 
  { 
   echo "Fehler beim Anlegen der Benutzer.<br>\n"; 
  } 
}  