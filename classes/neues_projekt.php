<?php 
include ("benutzer_session.php"); 
?> 
<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type"><title>neues projekt</title><link href="front_stylesheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header_line_0"></div><span class="header_ol"><a href="projekte.php">projekte</a></span>
<span class="header_or2">
<a href="nutzerdaten.php"><?php echo $_SESSION["user_name"]; ?> </a>
</span>

<span class="header_or3">
<a href="ausloggen.php">ausloggen</a> 
</span>
<br>
<br><br><div class="header_line_1"></div>
<br><br>
<div class="anmeld_form">
<form action="neues_projekt_.php" name="new_project_form">
<table class="font_light_grey"><tbody>
<tr><td>
<h5 class="font_grey">neues projekt anlegen</h5>
</td></tr>
<tr><td></td></tr>
<tr>
<td style="padding-top:10px;padding-bottom:0px;">projektbezeichnung</td></tr>
<tr><td><input size="40" maxlength="40" name="proj_bez" type="text"></td></tr><tr>
<td style="padding-top:10px;padding-bottom:0px;">projektbeschreibung</td></tr>
<tr>
<td>
<textarea id="projektbeschreibung" name="projektbeschreibung" rows="6" cols="60" align="left">
dein probetext
</textarea>
</td>
</tr>
<tr><td><br></td></tr>
<tr><td class="anmeld_button" style="padding-top:10px;padding-bottom:0px;">
<span><a href="javascript:document.getElementsByName('new_project_form')[0].submit()"><b>projekt anlegen</b></a></span>
</td></tr>

</tbody></table></form></div>
</body></html>