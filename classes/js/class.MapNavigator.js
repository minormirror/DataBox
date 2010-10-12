/*##################################################### Klasse MapNavigator ###################################################*/

function MapNavigator(){       

  //**********************  Attribute **************************
  //************************************************************  
  
  var mapDIV;
  var ausgabebereich;
  
  var old_div_x;
  var old_div_y;
  
  var mouse_start_pos_x;
  var mouse_start_pos_y;  
  var mouse_down = false;


  //**********************  Methoden ***************************
  //************************************************************ 
  
  
  this.refresh_map = function(){
 	  control = getControl();
 	  this.setSizePos(control.maxX,control.maxY);
    date = new Date().getTime();
    ausgabebereich.style.backgroundImage = "url(./classes/php/image.php?"+date+");";
  }

  //methode zum synchronisieren der MapNavigation setzt groesse und position des MapDiv
  this.setSizePos = function(xmax,ymax){ //xmax,ymax reprawesentieren die maximalwerte der aeusseren infoboxen (links oben rechts unten)
    var viewsizex = (window.innerWidth/xmax)*180;
    var viewsizey = (window.innerHeight/ymax)*130;
    var rel_x = ((1+window.pageXOffset)/xmax)*180;
    var rel_y = ((1+window.pageYOffset)/ymax)*130;
    mapDIV.style.width = viewsizex+"px";
    mapDIV.style.height = viewsizey+"px";
    mapDIV.style.left = rel_x+"px";
    mapDIV.style.top = rel_y+"px";    
  } 
  
  //**********************  Konstruktor ************************
  //************************************************************   
  
  /* erzeugen eines Div (DOM Element) dynamischer Groesse auf der Map */
  mapDIV = document.createElement("div");
  ausgabebereich = document.getElementById("mappings");                
  mapDIV.style.backgroundColor = "#afafaf"; /*oder 'transparent' */
  mapDIV.style.position = "relative";
  mapDIV.style.cursor = "pointer";
  mapDIV.style.border = "1px solid";
  mapDIV.style.opacity = "0.45";  
      /*                #beispiel {   ----------------------------aufbewahren falls browserprobleme
      filter:alpha(opacity=90); // Internet Explorer 
      -moz-opacity: 0.90; // Mozilla Browser 
      opacity: 0.90; // Opera 
      document.write('<link rel="stylesheet" type="text/css" href="linker1.css">');
      }*/
  mapDIV.style.display = "block";
  mapDIV.style.zIndex = "99";
  ausgabebereich.appendChild(mapDIV);  
  
  
  //*******************  event-listener-Methoden ***************
  //************************************************************  

  /*zum navigieren des browserfensters innerhalb der map
  * synchronisation zwischen der Map und dem wirklichen Anzeigebereich
  */
  this.windowscrollresize = function(){
    control = getControl();
 	  this.setSizePos(control.maxX,control.maxY);
  }
  window.onscroll = this.windowscrollresize.bindAsEventListener(this);
  window.onresize = this.windowscrollresize.bindAsEventListener(this);
      
  this.mousedown = function(ev){
    mouse_start_pos_x = ev.clientX;
    mouse_start_pos_y = ev.clientY;
    
    old_div_x = unpx(mapDIV.style.left);
    old_div_y = unpx(mapDIV.style.top);
    
    mouse_down = true;
  }  
  ausgabebereich.onmousedown = this.mousedown.bindAsEventListener(this);     

  this.mousemove = function(ev){
    if (mouse_down){
      diff_x = ev.clientX - mouse_start_pos_x;
      diff_y = ev.clientY - mouse_start_pos_y;
      
      max_width = unpx(mapDIV.style.width);
      max_height = unpx(mapDIV.style.height);
      
      diff_x = Math.min(diff_x,180 - (max_width +old_div_x));
      diff_x = Math.max(diff_x,-old_div_x);
      
      diff_y = Math.min(diff_y,130 - (max_height +old_div_y));
      diff_y = Math.max(diff_y,-old_div_y);
      
      control = getControl();
      newx = control.maxX*((old_div_x + diff_x)/180);
      newy = control.maxY*((old_div_y + diff_y)/130);
        
      window.scrollTo(newx,newy);
      mapDIV.style.left = (old_div_x + diff_x) +"px";
      mapDIV.style.top = (old_div_y + diff_y) +"px";      
    }
  }
  ausgabebereich.onmousemove  = this.mousemove.bindAsEventListener(this);     
  
  this.mouseup = function(ev){
    mouse_down = false;
  }  
  ausgabebereich.onmouseup = this.mouseup.bindAsEventListener(this);     
 
}

