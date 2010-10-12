<?

/* Protokol Definition:
 *  
 *  a # b # c # d # e # ...|
 *
 *  Eine Nachricht, sowohl Frage als auch Antwort, ist unterteilt in Unterabschnitte (a,b,..).
 *  Die einzelnen Unterabschnitte sind mit dem # Zeichen unterteilt. 
 *  Die Nachricht wird mit dem Zeichen | beendet. 
 *  Innerhalb der Unterabschnitte sind die #,?,& und | Zeichen mit ESC-Sequenzen kodiert. 
 *
 *  general: 
 *  a = commandnr
 *
 *  Antworten:
 *   a: 1  //vgl curr subversion
 *   b: curr subversion
 *   c: ib count
 *   d: ib 1 ib_id 
 *   e: ib 1 removed
 *   f: ib 1 content
 *   g: ib 1 x
 *   h: ib 1 y
 *   i: ib 1 width   	 
 *   j: ib 1 height
 *   k: ib 2 ...
 *
 *  a: 2  //create ib
 *   b: tmp ib id
 *   c: text
 *   response:
 *     a: 2
 *     b: tmp ib id
 *     c: new db id
 *     d: new subversion
 *     e: saved content
 *     f: x
 *     g: y
 *     h: width
 *     i: height
 *
 *  a: 3  //new id subversion
 *   b: ib id
 *   c: text
 *   response:
 *     a: 3  
 *     b: ib id  
 *     c: new subversion 
 *     d: saved content
 
 *  a: 4  //create con  inhalt anpassen !!!!!!!!!!!!!!!!!!!!!!!!!!!
 *   b: tmp ib id
 *   c: text
 *   response:
 *     a: 2
 *     b: tmp ib id
 *     c: new db id
 *     d: new subversion
 *     e: saved content
 *     f: x
 *     g: y
 *     h: width
 *     i: height
 *
 *  a: 5  //new id subversion (con)
 *   b: ib id
 *   c: text
 *   response:
 *     a: 3  
 *     b: ib id  
 *     c: new subversion 
 *     d: saved content 
 *
 *  a: 6  //remove ib 
 *   b: ib id
 *   response:
 *     a: 4  
 *
 */

include_once("../db.const.php");
include_once("boxcontainer.php");

session_start();
/*
class Box{
  var x;
  var y;
  var width;
  var height;
};
*/
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

function request($i){
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
$req = request($pd);
$res = array();

$error = "0";
if (!mysql_connect($host, $user , $password)){
  $error = "-1";
}   
if (!mysql_select_db($db)){
  $error = "-2";   
}
if (sizeof($req) == 0){  
  $error = "-3";      
}
if ($error != "0"){
  array_push($res,"".$error);	
}else{
  $cmd = $req[0];  
  switch($cmd){  
    case 0:
      array_push($res,"2112");	
      break;  
    case 1:	 	  	 
	    $query = "SELECT * FROM ib_ib WHERE subversion = ANY (SELECT MAX(subversion) FROM ib_ib GROUP BY ib_id) AND subversion > ".((int)$req[1]);
	    $result = mysql_query($query);
	    if (!$result){
        $error = "-1003:".mysql_error();
        break;
      }
      array_push($res,"1"); //Array Index 0
      array_push($res," ");	//Array Index 1 
      array_push($res," "); //Array Index 2	  
      array_push($res," "); //Array Index 3   hier kommen die min max werte rein! aber nur von unten (nach updateBox) , vgl. $cnt und $subversion
      array_push($res," ");	//Array Index 4
      array_push($res," "); //Array Index 5
      array_push($res," "); //Array Index 6
      
      $subversion = (int)$req[1];
      $cnt = 0;	  
      while ($line = mysql_fetch_array($result, MYSQL_ASSOC)){
        $cnt++;
        $subversion = max($subversion,$line["subversion"]);				
        array_push($res,$line["ib_id"]);
        array_push($res,$line["removed"]);
        array_push($res,$line["content"]);
        array_push($res,$line["x"]);
        array_push($res,$line["y"]);
        array_push($res,$line["width"]);
        array_push($res,$line["height"]); 
        if ($line["removed"] == 1){
          remove($line["ib_id"]);
        }else{ 
          updateBox($line["ib_id"],$line["x"],$line["y"],$line["width"],$line["height"]); 
        }
      }  
      $res[1] = "".$subversion;
      $res[2] = "".$cnt; 	 
      $minmax = getBoxMinMax();
      $res[3] = "".$minmax[0]; 	 
      $res[4] = "".$minmax[1]; 	 
      $res[5] = "".$minmax[2]; 	 
      $res[6] = "".$minmax[3]; 	       	 
      break;
    case 2:	  
      if (!mysql_query("LOCK TABLES ib_ib READ")){
        $error = "-2001";
        break;
      }
      if (!mysql_query("LOCK TABLES ib_ib WRITE")){
        $error = "-2002";
        break;
      }

      $result = mysql_query("SELECT Max(subversion),Max(ib_id) FROM ib_ib WHERE project_id=0 AND version=1");
      if (!$result){
        $error = "-2003";
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);
      $newibid = $line["Max(ib_id)"]+1;
      $newsubversion = $line["Max(subversion)"]+1;     
      $result=mysql_query("INSERT INTO ib_ib (project_id, version, subversion, ib_id, removed, content ,x,y,width,height) VALUES". 
                        "('0', '1', '".$newsubversion."', '".$newibid ."', '0','".$req[2]."','".$req[3]."','".$req[4]."','".$req[5]."','".$req[6]."');");

      if (!$result){
        $error = "-2004";
        break;
      }
      if (!mysql_query("UNLOCK TABLES")){
        $error = "-2014";
        break;
      }
      //response:
      array_push($res,"2");
      array_push($res,$req[1]);
      array_push($res,"".$newibid);
      array_push($res,"".$newsubversion);
      array_push($res,"".$req[2]);
      break;
    case 3:	  
      if (!mysql_query("LOCK TABLES ib_ib READ")){
        $error = "-3001";
        break;
      }
      if (!mysql_query("LOCK TABLES ib_ib WRITE")){
        $error = "-3002";
        break;
      }

      $result = mysql_query("SELECT Max(subversion) FROM ib_ib WHERE project_id=0 AND version=1");
      if (!$result){
        $error = "-3003";
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);	  
      $newsubversion = $line["Max(subversion)"]+1;     
      $result=mysql_query("INSERT INTO ib_ib (project_id, version, subversion, ib_id, removed, content,x,y,width,height ) VALUES".
                          " ('0', '1', '".$newsubversion."', '".$req[1] ."', '0','".$req[2]."','".$req[3]."','".$req[4]."','".$req[5]."','".$req[6]."');");
      updateBox($req[1],$req[3],$req[4],$req[5],$req[6]); 
      if (!$result){
        $error = "-3004";
        break;
      }
      if (!mysql_query("UNLOCK TABLES")){
        $error = "-3014";
        break;
      }
      //response:
      array_push($res,"3");
      array_push($res,$req[1]);	  
      array_push($res,"".$newsubversion);
      array_push($res,"".$req[2]);
      break;
      case 6:	  
      if (!mysql_query("LOCK TABLES ib_ib READ")){
        $error = "-6001";
        break;
      }
      if (!mysql_query("LOCK TABLES ib_ib WRITE")){
        $error = "-6002";
        break;
      }

      $result = mysql_query("SELECT Max(subversion) FROM ib_ib WHERE project_id=0 AND version=1");
      if (!$result){
        $error = "-6003";
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);	  
      $newsubversion = $line["Max(subversion)"]+1;     
      $result=mysql_query("INSERT INTO ib_ib (project_id, version, subversion, ib_id, removed) VALUES".
                          " ('0', '1', '".$newsubversion."', '".$req[1] ."', '1');");
	    if (!$result){
	      $error = "-6004";
		    break;
	    }
	    if (!mysql_query("UNLOCK TABLES")){
	      $error = "-6014";
		    break;
	    }
	    //response:
      array_push($res,"4");
      break;
    default:
      array_push($res,"-4");	
  }
}

if ($error != 0){
  $res = array();
  array_push($res,$error);	
}

echo response($res);
mysql_close();

/*

$reqa = explode("#", $req);
$cmd = (int)$reqa[0];
if ($cmd == 1){
  $query = "SELECT * FROM ib_projectpage WHERE id=1";
  $result = mysql_query($query) or die("Anfrage fehlgeschlagen: " . mysql_error());
  $line = mysql_fetch_array($result, MYSQL_ASSOC);
//  response_msg($line["changeid"]);
  mysql_free_result($result);
}
mysql_close();
*/

?>
