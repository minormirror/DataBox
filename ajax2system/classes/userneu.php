<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>neuer benutzer</title><link href="front_stylesheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header_line_0"></div><span class="header_ol"><a href="projekte.php">projekte</a></span>
<span class="header_or1"><a href="login.php">login</a></span>
<span class="header_or_M">|</span>
<span class="header_or2"><a href="userneu.php">registrieren</a></span>
<br><br><br><div class="header_line_1"></div>

<br><span class="error_font">
<?php if (isset ($_REQUEST["fehler"])) { 
	$err_mesg = $_REQUEST["err_mesg"]; 
	echo ($err_mesg);
}
?>
</span>
<br><br><div class="anmeld_form">
<form action="userneu_.php" name="neuer_benutzer">
<table class="font_light_grey"><tbody>
<tr><td>
<h5 class="font_grey">neues benutzerkonto anlegen</h5>
</td></tr>
<tr><td></td></tr>
<tr>
<td style="padding-top:10px;padding-bottom:0px;">nickname</td></tr>
<tr><td><input size="30" maxlength="35" name="nickname" type="text"></td></tr><tr>
<td style="padding-top:10px;padding-bottom:0px;">email</td></tr>
<tr><td><input size="30" maxlength="35" name="email" type="text"></td></tr>
<tr><td style="padding-top:10px;padding-bottom:0px;">passwort</td></tr>
<tr><td class=""><input size="30" maxlength="35" name="passwort" type="password"></td></tr>
<tr><td style="padding-top:10px;padding-bottom:0px;">passwort wiederholen</td></tr>
<tr><td><input size="30" maxlength="35" name="passwort_wiederholen" type="password"></td></tr>
<tr><td><br></td></tr>
<tr>
<td class="anmeld_button" style="padding-top:10px;padding-bottom:0px;">
<span><a href="javascript:document.getElementsByName('neuer_benutzer')[0].submit()"><b>konto anlegen</b></a></span>
</td></tr>

</tbody></table></form></div>
</body></html>
