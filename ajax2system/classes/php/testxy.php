<?
include_once("boxcontainer.php");

echo "<br>";
echo "<br>";
$minmax = getBoxMinMax();
echo "x min : ".$minmax[0];
echo " | x max : ".$minmax[1];
echo "<br>";
echo "y min : ".$minmax[2];
echo " | y max : ".$minmax[3];
echo "<br>";
echo "<br>";
echo "<br>";

/*for ($i=0;$i<getBoxSize();$i++){
  $box = getBoxAt($i);
  echo "id : ".$box[0];
  echo "<br>";  
  echo " x:".$box[1];
  echo "<br>";  
  echo " y:".$box[2];
  echo "<br>";  
  echo " width:".$box[3];
  echo "<br>";
  echo " height:".$box[4]; 
  echo "<br>";
  echo "<br>";
  echo "<br>";
}*/


	fillRects();

  function fillRects(){   
    $startX = 145;
    $startY = 90;    
    $width = 179;    
    $height = 129;
    echo "<br>" ;
    echo "nun die werte" ;
    echo "<br>" ;
    $minmax = getBoxMinMax();
    $rel_width = $minmax[1]-$minmax[0];            
    echo "rel_width : ".$rel_width;
    echo "<br>" ;
    $rel_height = $minmax[3]-$minmax[2];
    echo "rel_height : ".$rel_height;
    echo "<br>" ;
    echo "<br>------------------------------------------------------------------" ;
    echo "<br>" ;
    /*
    $box = getBoxAt(0);
    echo "id : ".$box[0];
    echo "<br>" ;
    echo "box1 : ".$box[1];
    echo "<br>" ;
    $rel_x1 = ($box[1]/$rel_width)*$width;
    echo "rel_x1  : ".$rel_x1;
    echo "<br>" ;*/
    for ($c=0;$c < getBoxSize();$c++){
        echo "<br>" ;
        echo "-----------------------------------" ;
        echo "<br>" ;
        $box = getBoxAt($c);
        echo "id : ".$box[0];
        echo "<br>" ;        
        $rel_x1 = ($box[1]/$rel_width)*$width;
        $rel_x1 = floor($rel_x1);
        $rel_y1 = ($box[2]/$rel_height)*$height;
        $rel_y1 = floor($rel_y1);
        $rel_x2 = $rel_x1+(($box[3]/$rel_width)*$width);
        $rel_x2 = floor($rel_x2);
        $rel_y2 = $rel_y1+(($box[4]/$rel_height)*$height);      
        $rel_y2 = floor($rel_y2);              
        echo "rel_x1  : ".$rel_x1;
        echo "<br>" ;
        echo "rel_y1  : ".$rel_y1;
        echo "<br>" ;
        echo "rel_x2  : ".$rel_x2;
        echo "<br>" ;
        echo "rel_y2  : ".$rel_y2;
        echo "<br>" ;
        echo "<br>" ;
        //imagerectangle($im, $rel_x1, $rel_y1, $rel_x2, $rel_y2, $col);
    }
  }
?>
