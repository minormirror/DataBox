<?php 
include ("checkuser.php"); 
?> 
<html> 
<head> 
  <title>Interne Seite</title> 
</head> 
<body> 
  BenutzerId: <?php echo $_SESSION["user_id"]; ?><br> 
  Nickname: <?php echo $_SESSION["user_nickname"]; ?><br> 
  Nachname: <?php echo $_SESSION["user_nachname"]; ?><br> 
  Vorname: <?php echo $_SESSION["user_vorname"]; ?> 
  <hr> 
  <a href="intern2.php">interna2</a> 
  <br>
  <br>
  <a href="logout.php">Ausloggen</a> 
</body> 
</html>