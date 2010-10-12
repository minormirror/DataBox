<?php 
include_once("db.const.php");
session_start (); 
connectDB();
?> 

<html><head><meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>neues projekt</title>
<style type="text/css">
 div#Inhalt {
    margin: 0 13.5em 0 13.5em;
    padding: 0 1em;
    <!--/*border: 1px dashed silver;*/-->
    border: 1px dashed silver;
  }

</style>
<link href="front_stylesheet.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="header_line_0"></div><span class="header_ol"><a href="projekte.php">projekte</a></span>
<?php if ( isset ($_SESSION["user_name"])){?>
<span class="header_or2">
<a href="nutzerdaten.php"><?php echo $_SESSION["user_name"]; ?> </a>
</span>
<span class="header_or3">
<a href="ausloggen.php">ausloggen</a> 
</span>
<?php } else { ?>
<span class="header_or1"><a href="login.php">login</a></span>
<span class="header_or_M">|</span>
<span class="header_or2"><a href="userneu.php">registrieren</a></span>
<?php } ?>
<br><br><br><div class="header_line_1"></div>
<br><br>
<div id="Inhalt">
<table>
<tr><td>
<h5 class="font_grey">projekte</h5>
</td></tr>
<tr><td></td></tr>
<?php
$sqlab_proj  = "select proj_bezeichnung, proj_beschreibung from ib_projectlist";
$result = mysql_query($sqlab_proj) or die("Anfrage fehlgeschlagen: " . mysql_error());
while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {    ?>
<tr><td class="projekt_name"><? echo $line["proj_bezeichnung"]; ?></td></tr>
<tr><td class="projekt_inhalt">
<? echo $line["proj_beschreibung"];    ?>
</td>
</tr>
<? } ?>

<tr><td><br>
<h1 class="header_line_1" style="padding-bottom:1px;"></h1>
</td></tr>

<tr><td>
       <?php if ( isset ($_SESSION["user_name"])){?>
       	<p class="anmeld_button">
		<span><a href="neues_projekt.php"><b>neues projekt anlegen</b></a></span></p>

      <?php } ?>
</td></tr>

</table>
</div>
</body></html>
<?
mysql_close();
?>