<html>
<head>
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>passwort zuschicken</title>
<link href="front_stylesheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header_line_0"></div><span class="header_ol"><a href="projekte.php">projekte</a></span>
<span class="header_or1"><a href="login.php">login</a></span>
<span class="header_or_M">|</span>
<span class="header_or2"><a href="userneu.php">registrieren</a></span>
<br><br><br><div class="header_line_1"></div>

<br><span class="error_font">
<?php 
if (isset ($_REQUEST["fehler"])) { 
	$err_num = $_REQUEST["fehler"];
	if  ($err_num == 2) {?>
		die email adresse existiert bei uns nicht
	<?php }
	else {
		header ("Location: login.php?fehler=3");
	}
} ?> 
</span>

<br><br><div class="anmeld_form">
<form action="passwort_zuschicken_.php" name="send_pass">
<table class="font_light_grey"><tbody>
<tr><td>
<h5 class="font_grey">passwort vergessen ?</h5>
</td></tr>
<tr><td></td></tr>
<td style="padding-top:10px;padding-bottom:0px;">email</td></tr>
<tr><td><input size="30" maxlength="35" name="email" type="text"></td></tr>
<tr><td><br></td></tr>
<tr><td class="anmeld_button">
<span><a href="javascript:document.getElementsByName('send_pass')[0].submit()"><b>passwort zuschicken</b></a></span>
</td></tr>

</tbody></table></form></div>
</body></html>
