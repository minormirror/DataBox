<?
include_once("jophp/RPCServer.class.php4");

    

$server = RPCServer::getInstance(); 

function getTemp($zipCode){    
    return 34+$zipCode;
}


$server->addMethod("getTemp");
$server->processRequest(); //required in PHP4, otherwise called automatically by the destructor in PHP 5

?>

