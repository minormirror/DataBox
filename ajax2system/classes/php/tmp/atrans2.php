<?
/*
1.) converts the request-datastream into arrays
2.) executes the handle_request from atrans2_rpc_func
3.) converts the response of handle_request into response-datastream
*/

include_once("../db.const.php");
include_once("boxcontainer.php");
include_once("atrans2_rpc_func.php");

session_start();


function code($st){
  $news = "";
  for ($i=0;$i<strlen($st);$i++){
    if ($st[$i] == "+"){	
	    $news .= "+0";
    }else if ($st[$i] == "#"){
	    $news .= "+1";
	  }else if ($st[$i] == "|"){
	    $news .= "+2";
	  }else if ($st[$i] == "?"){	
	    $news .= "+3";
	  }else if ($st[$i] == "&"){	
	    $news .= "+4";
	  }else{
	    $news .= $st[$i];
	  }
  }
  return $news;
}

function encode($st){
  $news = "";
  for ($i=0;$i<strlen($st);$i++){
    if ($st[$i] == "+"){	
	    $i++;
	    if ($st[$i] == "0"){	
	      $news .= "+";
      }else if ($st[$i] == "1"){
	      $news .= "#";
	    }else if ($st[$i] == "2"){
	      $news .= "|";
	    }else if ($st[$i] == "3"){	
	      $news .= "?";
	    }else if ($st[$i] == "4"){	
	      $news .= "&";
	    }
	  }else{
	    $news .= $st[$i];
	  }
  }
  return $news;
}

function response($a){
  $ra = array();
  for($i=0;$i<sizeof($a);$i++){
    array_push($ra,code($a[$i]));
  }
  $msg = implode("#",$ra);
  return $msg."|";
}

function convert_request($i){
  if ($i[strlen($i)-1] != "|"){
    return array();
  }
  $i=substr($i,0,strlen($i)-1);
  $a = explode("#",$i);
  $o = array();
  for($i=0;$i<sizeof($a);$i++){
    array_push($o,encode($a[$i]));
  }
  return $o;
}

//readout request
$fd = fopen('php://input','r');
$pd = "";
while(!feof($fd)) {
  $pd .= fread($fd,1024);  
}
fclose($fd);

$req = convert_request($pd); 
$res = array();
$error = 0;

if (!mysql_connect($host, $user , $password)){
  $error = -1;
}   
if (!mysql_select_db($db)){
  $error = -2;   
}
if (sizeof($req) == 0){  
  $error = -3;      
}
if ($error == 0){  
  array_push($res,(string)((int)$req[0]));	//return command nr.
  array_push($res,(string)((int)$req[1]));	//return project_id
  $ret = handle_request($res,$req);
  $res = $ret[0];
  $error = $ret[1];  
}

if ($error != 0){
  $res = array();
  array_push($res,"-1");	
  array_push($res,(string)$error);	
}
echo response($res);
mysql_close();


?>