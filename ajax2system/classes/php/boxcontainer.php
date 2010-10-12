<?
/* diese Klasse stellt Funktionen zur Uebergabe der Boxinformationen einer Infobox bereit
* sowie weitere Informationen aus der Datenbank und schreibt diese in Sessionvariablen
*/
session_start();
function getSessionArray($st){
  if (!isset($_SESSION[$st])){
    $_SESSION[$st] = array();    
  }
  return $_SESSION[$st];
}

function getBoxSize(){
  return sizeof(getSessionArray("box_list_id"));
}

function getBoxAt($idx){  
  $id_array = getSessionArray("box_list_id");
  $x_array = getSessionArray("box_list_x");
  $y_array = getSessionArray("box_list_y");
  $width_array = getSessionArray("box_list_width");
  $height_array = getSessionArray("box_list_height");
  $res = array();
  array_push($res,$id_array[$idx]);
  array_push($res,$x_array[$idx]);
  array_push($res,$y_array[$idx]);
  array_push($res,$width_array[$idx]);
  array_push($res,$height_array[$idx]);  
  return $res;
}

function getBoxMinMax(){
  return $_SESSION["box_maxmin"];
}

function updateMinMax(){
  $x_array = getSessionArray("box_list_x");
  $y_array = getSessionArray("box_list_y");
  $width_array = getSessionArray("box_list_width");
  $height_array = getSessionArray("box_list_height");
  
  
  $xmin = 0;
  $ymin = 0;
  $xmax = 10;
  $ymax = 10;
  
  if (sizeof($x_array) != 0){  
    $xmin = $x_array[0];    
	$ymin = $y_array[0];    
    $xmax = $x_array[0]+$width_array[0];    
    $ymax = $y_array[0]+$height_array[0];    
    for ($i=1;$i<sizeof($x_array);$i++){
	  $xmin = min($xmin,$x_array[$i]); 
	  $ymin = min($ymin,$y_array[$i]);    
      $xmax = max($xmax,$x_array[$i]+$width_array[$i]);    
      $ymax = max($ymax,$y_array[$i]+$height_array[$i]);    
    }
  }   
  $_SESSION["box_maxmin"] = array($xmin,$xmax,$ymin,$ymax);  
}

function updateBox($id,$x,$y,$width,$height){
  $id_array = getSessionArray("box_list_id");
  $x_array = getSessionArray("box_list_x");
  $y_array = getSessionArray("box_list_y");
  $width_array = getSessionArray("box_list_width");
  $height_array = getSessionArray("box_list_height");   
  $idx = -1;
  for($i=0;$i<sizeof($id_array);$i++){
    if ($id_array[$i] ==$id){
  	  $idx = $i;
  	  break;
  	}
  }  
  
  if ($idx == -1){
    array_push($id_array,$id);
  	array_push($x_array,$x);
  	array_push($y_array,$y);
  	array_push($width_array,$width);
  	array_push($height_array,$height);
  }else{     
  	$x_array[$idx] = $x;
  	$y_array[$idx] = $y;
  	$width_array[$idx] = $width;
  	$height_array[$idx] = $height;
  }    
  $_SESSION["box_list_id"] = $id_array;
  $_SESSION["box_list_x"] = $x_array;
  $_SESSION["box_list_y"] = $y_array;
  $_SESSION["box_list_width"] = $width_array;
  $_SESSION["box_list_height"] = $height_array; 
  updateMinMax();
}

function removeIdx($idx,$a){
  $ar = array();
  for ($i=0;$i<sizeof($a);$i++){
    if ($i != $idx){
	    array_push($ar,$a[$i]);
	  }
  }
  return $ar;
}

function remove($id){
  $id_array = getSessionArray("box_list_id"); 
  $idx = -1;
  for($i=0;$i<sizeof($id_array);$i++){
    if ($id_array[$i] ==$id){
	    $idx = $i;
	    break;
	  }
  }  
  
  if ($idx != -1){
    $_SESSION["box_list_id"] = removeIdx($idx,$id_array);
    $_SESSION["box_list_x"] = removeIdx($idx,getSessionArray("box_list_x"));
    $_SESSION["box_list_y"] = removeIdx($idx,getSessionArray("box_list_y"));
    $_SESSION["box_list_width"] = removeIdx($idx,getSessionArray("box_list_width"));
    $_SESSION["box_list_height"] = removeIdx($idx,getSessionArray("box_list_height"));  
  }
  updateMinMax();
}
?>
