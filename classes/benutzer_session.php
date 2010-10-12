<?php 
session_start ();
if (!isset ($_SESSION["user_name"])) 
{ 
  header ("Location: login.php?fehler=2"); 
  exit;
} 
?> 