<?php 
include ("benutzer_session.php"); 
?> 

<html>
<head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>DataBox Benutzer</title>
<link href="front_stylesheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header_line_0"></div><span class="header_ol"><a href="projekte.php">projekte</a></span>
<span class="header_or2"> <a href="userneu.php">neuen benutzer registrieren</a></span>
<span class="header_or3"> <a href="ausloggen.php">ausloggen</a></span>

<br><br><br><div class="header_line_1"></div>

<br><br>
<div class="anmeld_form"> 
	<p class="anmeld_button">
	nickname : <?php echo $_SESSION["user_name"]; ?><br> 
	benutzer email : <?php echo $_SESSION["user_email"]; ?><br> 
	logindatum : <?php echo $_SESSION["user_date"]; ?><br> 
	browser : <?php echo $_SESSION["browser_type"]; ?>
<br> 
</p>
</div>

</body></html>
