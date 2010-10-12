<?php
  include_once("boxcontainer.php");
  
  $width = 180;    
  $height = 130; 

  function fillRects($im,$col){     
    $width = 180;    
    $height = 130; 
    //das menue darstellen //sollte eigentlich in das div des MapNavigator.js
    //draw_roundrectangle($im, 135, 5, 174, 30, 3 , $col, 1);
    //nun die divs    
    $minmax = getBoxMinMax();
    $rel_width = $minmax[1];
    $rel_height = $minmax[3];
    for ($i=0;$i<getBoxSize();$i++){
      $box = getBoxAt($i);
      $rel_x1 = ($box[1]/$rel_width)*$width;
      $rel_x1 = floor($rel_x1);
      $rel_y1 = ($box[2]/$rel_height)*$height;
      $rel_y1 = floor($rel_y1);
      $rel_x2 = $rel_x1+(($box[3]/$rel_width)*$width);
      $rel_x2 = floor($rel_x2);
      $rel_y2 = $rel_y1+(($box[4]/$rel_height)*$height);      
      $rel_y2 = floor($rel_y2);      
      //ImageString ($im, 2, $rel_x1, $rel_y1, $box[0], $col); // repraesentiert die div ids
      imagerectangle($im, $rel_x1, $rel_y1, $rel_x2, $rel_y2, $col);
    }
  }

  header ("Content-type: image/png");
  $im = @ImageCreate (180, 130)
        or die ("es ist leider keine instanz eines gd -streams moeglich");
  $background_color = ImageColorAllocate ($im, 250, 250, 250);
  $paint_color = ImageColorAllocate ($im, 47, 51, 114);
  $text_color = ImageColorAllocate ($im, 233, 14, 91);
  fillRects($im,$paint_color);
  /* im hintergrund könnte auch die projektinformation -oder der projektname stehen
  ImageString ($im, 5, 80, 60, "map", $text_color);
  */
  $filename = "resources/map/over32.png";
  ImagePNG($im);
  ImageDestroy($im);
?>
