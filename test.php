<?

if(!isset($_SERVER["tt"])){
$_SERVER["tt"] = 0;
}
$_SERVER["tt"] = $_SERVER["tt"] +1;
echo $_SERVER["tt"];
?>