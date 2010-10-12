<?

include_once("../db.const.php");
include_once("boxcontainer.php");

session_start();



/*


Die ib_change-Tabelle
==================================================================

Die zentrale Tabelle dieses Kommunikationsystems ist ib_change. Dabei bezieht sich das change nicht auf eine einzele
InfoBox (ib) sondern ist allgemein gemeint. Alle Änderungen innerhalb des DataBox Systems haben in dieser Tabelle einen 
Eintrag. Zur Unterscheidung der Änderungen entsprechend der einzelnen Projekte ist jeder Zeile die entsprechende ProjektId
zugeordnet: SELECT * FROM ib_change WHERE projekt_id = 2 liefert alle Änderungen des Projektes mit der ID 2.

Die Änderungen eines Projektes sind anhand ihrer subversions-Nummer chronologisch geordnet. Dabei gilt: je kleiner die 
subversions-Nummer ist, desto früher wurde die zugehörige Änderung durchgeführt. Weil es wenig Sinn macht (performance)
die einem Projekt-zugeordneten Inhalte dieser Tabelle bei jedem zugriff vollstäntig zu lesen soll nur Bereichsweise
(von subvsionsnr ... bis subversionsnr ...)  hierauf zugegriffen werden. Dabei soll ein Client nur die Änderungen der 
Tabelle benötigen und lesen, welche größer (als aus der Sicht des Client, mit einer veralteten Verion, in der zukunft liegen) 
sind als die Version bei welcher sich der Client -zum Zeitpunkt des Abrufes- befindet.

Die Änderung selbst ist anhand von den Feldern element_id und change_fct (change function) festgelegt.
Dabei ist die Bedeutung der element_id abhängig von der zugeordneten change_fct bzw. die change_fct-Nr legt fest wie die 
element_id zu interpretieren ist. 


Festlegung der Änderungsfunktionen (change_fct):

change_fct: 1 - Erstelle neue Info Box
------------------------------------------------------------------
element_id: InfoBox ID.
Einfluss auf andere Tabellen: nein
Bescheibung: Einführung einer neuen Infobox ID


change_fct: 2 - Position zu einer Infobox hinzufügen
------------------------------------------------------------------
element_id: InfoBox ID.
Einfluss auf andere Tabellen: ib_ib_pos
Bescheibung: zu der InfoBox mit der in 'element_id' stehenden id wird eine neue Positionsangabe hinzugefügt.
Die entsprechende Positionsangabe befindet sich in der Tabelle ib_ib_pos und ist identifiziert mit 
der gleichen projekt_id und gleichen subversions wie in der dieser Tabellenzeile enthalten sind. 


change_fct: 3 - Inhalt zu einer Infobox hinzufügen
------------------------------------------------------------------
element_id: InfoBox ID.
Einfluss auf andere Tabellen: ib_ib_content
Bescheibung: zu der InfoBox mit der in 'element_id' stehenden id wird eine neuer TextInhalt hinzugefügt.
Der entsprechende TextInhalt befindet sich in der Tabelle ib_ib_content und ist identifiziert mit 
der gleichen projekt_id und gleichen subversions wie in der dieser Tabellenzeile enthalten sind. 


change_fct: 4 - lösche InfoBox
------------------------------------------------------------------
element_id: InfoBox ID.
Einfluss auf andere Tabellen: nein
Bescheibung: die InfoBox mit der in 'element_id' stehenden id wird gelöscht. 




Das atrans2-Protokoll
==================================================================

Anfragen und Antworten bestehen jeweils aus einer Reihe von Blöcken
Zur Umwandlung des Datenstromes in das und aus dem Blockformat werden die Funktionen response und request verwendet.
Dabei gilt:

Anfrage (request):   Datenstrom -> request() -> Array aus Blöcken -> Verarbeitung innerhalb von atrans
Antwort (response):  Verarbeitung innerhalb von atrans -> Array aus Blöcken -> response() -> Datenstrom


Bei allen eingehenden Anfragen ist gemeinsam:

1. Block: atrans_funktions_nr (nicht zu verwechseln mit change_fct aus ib_change-Tabelle)
2. Block: project_id
...

Bei allen ausgehenden Antworden ist gemeinsam:
1. Block: atrans_funktions_nr oder fehlernummer (= -1)
2. Block: wenn (1. Block == -1) dann Fehlerbezeichnung ansonsten project_id
...


Festlegung der atrans-Funktionen:

atrans_funktions_nr: 0 - Testfunktion
------------------------------------------------------------------
Anfrage: - 
Antwort:
3. Block: 232 //statischer Wert


atrans_funktions_nr: 1 - Liefer alle Änderungen ab subversion
------------------------------------------------------------------
Anfrage: 
3. Block: minimale subversion // ab der alle Änderungen ausgegeben werden sollen 

Antwort:
3. Block: maximale subversion 
Liste der Änderungen

Format einer Änderung:
  (die Nummer innerhalb der Änderung)
  1. Block: change_fct (siehe oben)
  2. - x. Block: Inhalt der jeweiligen Änderung (siehe unten) 
  
  Einzelne Änderungen:  
  
  1. Block: 1 //change_fct, Erstelle neue Info Box
  2. Block: ib_id
  
  1. Block: 2 //change_fct, Position zu einer Infobox hinzufügen
  2. Block: ib_id
  3. Block: x
  4. Block: y
  5. Block: width
  6. Block: height
  
  1. Block: 3 //change_fct, Inhalt zu einer Infobox hinzufügen
  2. Block: ib_id
  3. Block: content
  
  1. Block: 4 //change_fct, lösche InfoBox
  2. Block: ib_id
  
atrans_funktions_nr: 2 - Neue Ib anlegen
------------------------------------------------------------------
Anfrage: 
3. Block: random element_id
Antwort: 
3. Block: random element_id
4. Block: neue element_id


atrans_funktions_nr: 3 - Neuen Ib pos anlegen
------------------------------------------------------------------
Anfrage:
3. Block: element_id
4. Block: x
5. Block: y
6. Block: width
7. Block: height
Antwort: -

  
atrans_funktions_nr: 4 - Neuen Ib content anlegen
------------------------------------------------------------------
Anfrage:
3. Block: element_id
4. Block: content
Antwort: -
	
*/


function getChangeFunc1Content($element_id,$change_fct,$delete_ids){ //create Ids
  $r = array();
  for($i=0;$i<sizeof($element_id);$i++){
    if ($change_fct[$i] == 1 && !in_array($element_id[$i],$delete_ids)){
      array_push($r,"1");
      array_push($r,$element_id[$i]);
	}
  }
  return $r;
}


function getChangeFunc2Content($project_id,$f2hIds){ //Position zu einer Infobox hinzufügen
  $debug =false;
  $res = array(); 
  
  $wheres = array();  
  $subversions = array_keys($f2hIds);
  
  for($i=0;$i<sizeof($subversions);$i++){
    array_push($wheres,"subversion=".$subversions[$i]);
  }
 
  $query = "SELECT * FROM ib_ib_pos WHERE (".implode($wheres," OR ").") AND project_id = ".$project_id;
  $result = mysql_query($query);
  if (!$result){
    if ($debug){ 
	  array_push($res,"ERROR:"); 
	  array_push($res,$query); 
	  array_push($res,mysql_error());
	}else{
	  $error = -1021;	  
	}
  }       

  if ($debug){
	array_push($res,"DEBUG: SQL:"); 
	array_push($res,"DEBUG: ".$query); 		
  }	  
	 
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)){
    if ($debug){
	  array_push($res,"DEBUG: subversion:".$line["subversion"]. " id:".$f2hIds[$line["subversion"]]." x:".$line["x"]. " y:".$line["y"]. " w:".$line["width"]. " h:".$line["height"]);
	}	
	array_push($res,"2");
	array_push($res,$f2hIds[$line["subversion"]]); //element_id
    array_push($res,$line["x"]);
	array_push($res,$line["y"]);
	array_push($res,$line["width"]);
	array_push($res,$line["height"]);
  }
  
  return array($res,$error);    
}


function getChangeFunc3Content($project_id,$f3hIds){ //Inhalt zu einer Infobox hinzufügen
  $debug =false;
  $res = array(); 
  
  $wheres = array();  
  $subversions = array_keys($f3hIds);
  
  for($i=0;$i<sizeof($subversions);$i++){
    array_push($wheres,"subversion=".$subversions[$i]);
  }
 
  $query = "SELECT * FROM ib_ib_content WHERE (".implode($wheres," OR ").") AND project_id = ".$project_id;
  $result = mysql_query($query);
  if (!$result){
    if ($debug){ 
	  array_push($res,"ERROR:"); 
	  array_push($res,$query); 
	  array_push($res,mysql_error());
	}else{
	  $error = -1031;	  
	}
  }       

  if ($debug){
	array_push($res,"DEBUG: SQL:"); 
	array_push($res,"DEBUG: ".$query); 		
  }	  
	 
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)){
    if ($debug){
	  array_push($res,"DEBUG: subversion:".$line["subversion"]. " id:".$f2hIds[$line["subversion"]]." content:".$line["content"]);
	}	
	array_push($res,"3");
	array_push($res,$f3hIds[$line["subversion"]]); //element_id
    array_push($res,$line["content"]);	
  }
  
  return array($res,$error);    
}

function getChangeFunc4Content($element_id,$change_fct,$delete_ids){ //create Ids
  $r = array();
  
  $create_ids = getIdsOfChangeFct($element_id,$change_fct,1);
  
  for($i=0;$i<sizeof($delete_ids);$i++){
    if (!in_array($delete_ids[$i],$create_ids)){
      array_push($r,"4");
      array_push($r,$delete_ids[$i]);
	}
  }
  return $r;
}



function handle_request($res,$req){  
  $debug = false;
  
  $error = 0;    
  
  $command = (string)((int)$req[0]);
  $project_id = (string)((int)$req[1]);  

  switch($command){ //command nr
  
    // TestData 	   
    case 0:       
	  array_push($res,"232");	      
	  array_push($res,"Hello");	      
    break;	
	
	
	// get all ib-data bigger then ...	
	case 1: 
      if ($debug){	  	  			  
	    array_push($res,"time:".date ("H:i:s",filemtime("./atrans2.php")));	      
	  }
	  $subversion = (int)$req[2];	  
	  
	  $query = "SELECT * FROM ib_change WHERE subversion = ANY (SELECT MAX(subversion) FROM ib_change GROUP BY element_id,change_fct) AND project_id = ".$project_id." AND subversion > ".$subversion;	 	  
	  $result = mysql_query($query);
	  if (!$result){
        if ($debug){ 
		  array_push($res,"ERROR:"); 
		  array_push($res,$query); 
		  array_push($res,mysql_error());
		}else{
		  $error = -1001;
		  break;
		}
	  }           
	 
	  if ($debug){
	    array_push($res,"DEBUG: SQL:"); 
	    array_push($res,"DEBUG: ".$query); 		
	  }	  
	 
      $cnt = 0;
	  
      $subversion = array();
	  $element_id = array();	   
	  $change_fct = array();	  	 
	  $maxsubversion = -1;
	  
      while ($line = mysql_fetch_array($result, MYSQL_ASSOC)){
        $cnt++;
        $maxsubversion = max($maxsubversion,(int)$line["subversion"]);				
		
		if ($debug){
		  array_push($res,"DEBUG: subversion: ".$line["subversion"]. "          element_id:".$line["element_id"]. "           change_fct:".$line["change_fct"]); 
		}		
		
		array_push($subversion,$line["subversion"]);
		array_push($element_id,$line["element_id"]);
		array_push($change_fct,$line["change_fct"]);			
      }	  
	  
	  //add max subversion
	   if ($debug){ 
	    array_push($res,"DEBUG: max subversion");
      }
	  array_push($res,"".$maxsubversion);

	  //Elemente die erzeugt aber nicht gelöscht und gelöscht aber nicht erzeugt wurden (letztere um aus client zu löschen)
	  $delete_ids = getIdsOfChangeFct($element_id,$change_fct,4);	  
	  
	  $f2hIds = getSubvIdsOfChangeFct($subversion,$element_id,$change_fct,2,$delete_ids);
	  $f3hIds = getSubvIdsOfChangeFct($subversion,$element_id,$change_fct,3,$delete_ids);	  	  	
	  
	  //add f1 createIds:
	  if ($debug){ 
	    array_push($res,"DEBUG: change_func 1 - createIds");
      }
      $res = array_merge($res,getChangeFunc1Content($element_id,$change_fct,$delete_ids));
	  
	  //add f2 Position einer Infobox
	  if ($debug){ 
	    array_push($res,"DEBUG: change_func 2 - ib_pos");
      }
	  if (sizeof($f2hIds) != 0){
	    $ret = getChangeFunc2Content($project_id, $f2hIds);	  
        $res = array_merge($res,$ret[0]);	
	    if ($error == 0){
	      $error = $ret[1];
	    }
	  }
	  
	  //add f3 new content
	  if ($debug){ 
	    array_push($res,"DEBUG: change_func 3 - ib_content");
      }
	  if (sizeof($f3hIds) != 0){
	    $ret = getChangeFunc3Content($project_id, $f3hIds);	  
        $res = array_merge($res,$ret[0]);	
	    if ($error == 0){
	      $error = $ret[1];
	    }
	  }
	  
	  //add f4 delIds:
	  if ($debug){ 
	    array_push($res,"DEBUG: change_func 4 - deleteIds");
      }
      $res = array_merge($res,getChangeFunc4Content($element_id,$change_fct,$delete_ids));
	  
	  if ($debug){   
	    array_push($res,"-- ende im gelaende --");
	  }  	  
	  break; 	
	  
	// create new ib
	case 2: 	
      if (!mysql_query("LOCK TABLES ib_change WRITE")){
        $error = "-2002";
        break;
      }
	  
	  if ($debug){ 
	    array_push($res,"DEBUG: new ib");
      }	  
	  
	  $result = mysql_query("SELECT Max(subversion),Max(element_id) FROM ib_change WHERE project_id=".$project_id);
      if (!$result){
        $error = "-2003";
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);
      $newelement_id = $line["Max(element_id)"]+1;
      $newsubversion = $line["Max(subversion)"]+1; 
	  
	  if ($debug){ 
	    array_push($res,"DEBUG: newelement_id:".$newelement_id );
		array_push($res,"DEBUG: newsubversion:".$newsubversion );
      }
	  
	  $result=mysql_query("INSERT INTO ib_change (project_id, subversion, element_id, change_fct) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$newelement_id ."', '1');");



      $random_id = (string)((int)$req[1]);  
	  array_push($res,"".$random_id);
      array_push($res,"".$newelement_id);
	  
	  
      if (!$result){
        $error = "-2004";      
      }
	  
	  if (!mysql_query("UNLOCK TABLES")){
	    $error = "-2014";
		break;
	  }
	
	  break;	  
	
	  
	// create new ib pos
	case 3: 	
      if (!mysql_query("LOCK TABLES ib_change WRITE,ib_ib_pos WRITE;")){
        $error = "-4002";
        break;
      }	   
	  
	  if ($debug){ 
	    array_push($res,"DEBUG: new ib pos");
      }	  
	  
	  $result = mysql_query("SELECT Max(subversion) FROM ib_change WHERE project_id=".$project_id);
      if (!$result){
        $error = "-4003:".mysql_error();
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);      
      $newsubversion = $line["Max(subversion)"]+1; 
	  
	  if ($debug){ 	    
		array_push($res,"DEBUG: newsubversion:".$newsubversion );
      }
	  
	  $result=mysql_query("INSERT INTO ib_ib_pos (project_id, subversion, x,y,width,height) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$req[3] ."', '".$req[4] ."', '".$req[5] ."', '".$req[6] ."');");
						
	 if (!$result){
        $error = "-4004";      
      }
	  
	  $result=mysql_query("INSERT INTO ib_change (project_id, subversion, element_id, change_fct) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$req[2] ."', '2');");     
      if (!$result){
        $error = "-4005";      
      }
	  
	  if (!mysql_query("UNLOCK TABLES")){
	    $error = "-4014";
		break;
	  }
	
	  break;
	  
	// create new ib content
	case 4: 	
      if (!mysql_query("LOCK TABLES ib_change WRITE,ib_ib_content WRITE;")){
        $error = "-3002";
        break;
      }	   
	  
	  if ($debug){ 
	    array_push($res,"DEBUG: new ib content");
      }	  
	  
	  $result = mysql_query("SELECT Max(subversion) FROM ib_change WHERE project_id=".$project_id);
      if (!$result){
        $error = "-3003:".mysql_error();
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);      
      $newsubversion = $line["Max(subversion)"]+1; 
	  
	  if ($debug){ 	    
		array_push($res,"DEBUG: newsubversion:".$newsubversion );
      }
	  
	  $result=mysql_query("INSERT INTO ib_ib_content (project_id, subversion, content) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$req[3] ."');");
						
	 if (!$result){
        $error = "-3004";      
      }
	  
	  $result=mysql_query("INSERT INTO ib_change (project_id, subversion, element_id, change_fct) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$req[2] ."', '3');");
      
      if (!$result){
        $error = "-3005";      
      }
	  
	  if (!mysql_query("UNLOCK TABLES")){
	    $error = "-3014";
		break;
	  }	
	  break;
	  
	  
	  // delete ib_id
	case 5: 	
      if (!mysql_query("LOCK TABLES ib_change WRITE;")){
        $error = "-5002";
        break;
      }	   
	  
	  if ($debug){ 
	    array_push($res,"DEBUG: delete ib_id");
      }	  
	  
	  $result = mysql_query("SELECT Max(subversion) FROM ib_change WHERE project_id=".$project_id);
      if (!$result){
        $error = "-5003:".mysql_error();
        break;
      }
      $line = mysql_fetch_array($result, MYSQL_ASSOC);      
      $newsubversion = $line["Max(subversion)"]+1; 
	  
	  if ($debug){ 	    
		array_push($res,"DEBUG: newsubversion:".$newsubversion );
      }
	  
	  $result=mysql_query("INSERT INTO ib_change (project_id, subversion, element_id, change_fct) VALUES". 
                        "('".$project_id."', '".$newsubversion."', '".$req[2] ."', '4');");     
						
	  if (!$result){
        $error = "-5004";      
      }	  	  
	  
	  if (!mysql_query("UNLOCK TABLES")){
	    $error = "-5014";
		break;
	  }
	
	  break;
  }
  
  return array($res,$error);  
}


function getSubvIdsOfChangeFct($subversions,$element_ids,$func_ids,$search_func_id,$invalid_ids){
  $ret = array();
  $search_subversions = array();  
  $search_ids = array();  
  for($i=0;$i<sizeof($element_ids);$i++){  
    if ($func_ids[$i] == $search_func_id && !in_array($element_ids[$i],$invalid_ids)){
	  $ret[$subversions[$i]] = $element_ids[$i];    
	}	
  }  
  return $ret;
}

function getIdsOfChangeFct($element_ids,$func_ids,$func_id){
  $func_element_ids = array();
  for($i=0;$i<sizeof($element_ids);$i++){
    if ($func_ids[$i] == $func_id){
      array_push($func_element_ids,$element_ids[$i]);
	}
  }
  return $func_element_ids;
}


?>