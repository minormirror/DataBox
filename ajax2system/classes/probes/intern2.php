<?php 
include ("checkuser.php"); 
?> 
<html> 
<head> 
  <title>Interne 2te Seite</title> 
</head> 
<body> 
<a href="logout.php">Ausloggen</a> 
<br>
Nachname: <?php echo $_SESSION["user_nachname"]; ?><br> 
  BenutzerId: <?php echo $_SESSION["user_id"]; ?><br> 
  Nickname: <?php echo $_SESSION["user_nickname"]; ?><br> 
  Nachname: <?php echo $_SESSION["user_nachname"]; ?><br> 
  Vorname: <?php echo $_SESSION["user_vorname"]; ?> 
  Vorname: <?php echo $_SESSION["user_vorname"]; ?> 
  <hr> 
  <br>
<a href="intern.php">interna1</a>   
</body> 
</html>