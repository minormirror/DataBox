/*####################################################### Ajax ###################################################*/
var req;
function loadXMLDoc(url) {
	req = false;
    // branch for native XMLHttpRequest object
    if(window.XMLHttpRequest && !(window.ActiveXObject)) {
    	try {
			req = new XMLHttpRequest();
        } catch(e) {
			req = false;
        }
    // branch for IE/Windows ActiveX version
    } else if(window.ActiveXObject) {
       	try {
        	req = new ActiveXObject("Msxml2.XMLHTTP");
      	} catch(e) {
        	try {
          		req = new ActiveXObject("Microsoft.XMLHTTP");
        	} catch(e) {
          		req = false;
        	}
		}
    }
	if(req) {
		req.onreadystatechange = processReqChange;
		req.open("GET", url, true);
		req.send("");
	}
}

function processReqChange(tt){
  /*if (req){    
      setInfo(req.responseText);    
  }
  */
}

/*####################################################### Arrow ###################################################*/

function Arrow(bc){  
  this.bc = bc;  
  this.hLine = true;
  this.endIb = null;
  this.endDir=-1;
  this.startIb = null;
  this.selectedIb = null;      
  
  var startX=0;
  var startY=0;
  var endX=0;
  var endY=0;  
  
  var img_size = 20;
  this.stroke = 2;  
 
  this.endEl = document.createElement("div");     
  this.endEl.style.backgroundColor ="#909090";
  this.endEl.style.width = "10px";
  this.endEl.style.height = "10px";  
  this.endEl.style.position="absolute";    
  document.getElementById(this.bc.parent_element_id).appendChild(this.endEl);     

  this.startEl = document.createElement("div");     
  this.startEl.style.backgroundColor ="#909090";
  this.startEl.style.width = "10px";
  this.startEl.style.height = "10px";  
  this.startEl.style.position="absolute";    
  document.getElementById(this.bc.parent_element_id).appendChild(this.startEl);  
  
  this.startImg = document.createElement("img");       
  this.startImg.style.width = "20px";
  this.startImg.style.height = "20px";  
  this.startImg.style.position="absolute";   
  document.getElementById(this.bc.parent_element_id).appendChild(this.startImg);  
  
  this.middleEl = document.createElement("div");     
  this.middleEl.style.backgroundColor ="#909090";
  this.middleEl.style.width = "10px";
  this.middleEl.style.height = "10px";  
  this.middleEl.style.position="absolute";      
  document.getElementById(this.bc.parent_element_id).appendChild(this.middleEl);   
  

  var centerImgDivWidth = 48;
  var centerImgDivHeight = 48;
  this.centerImgDiv = document.createElement("img");       
  this.centerImgDiv.style.width = "48px";
  this.centerImgDiv.style.height = "48px";  
  this.centerImgDiv.style.position="absolute";   
  this.centerImgDiv.src = "resources/buttons/ausrufezeichen_symbol.png";      
  this.middleEl.appendChild(this.centerImgDiv);  
  this.bc.setFocus(this.centerImgDiv);

  
  
  this.deleteArrow = function(){
    document.getElementById(this.bc.parent_element_id).removeChild(this.endEl);	
	document.getElementById(this.bc.parent_element_id).removeChild(this.startEl);	
	document.getElementById(this.bc.parent_element_id).removeChild(this.middleEl);
	document.getElementById(this.bc.parent_element_id).removeChild(this.startImg);	
	
	
	if (this.endIb != null){	
	  this.endIb.arrowList = arrayRemove(this.endIb.arrowList,this);		  	  
	}
	
	if (this.startIb != null){	
	  this.startIb.arrowList = arrayRemove(this.startIb.arrowList,this);		  
	}	
  }
  
  this.getMaxZ = function(){
    return this.middleEl.style.zIndex;  
  }
  
  this.setArrowFocus = function(){
    this.bc.setFocus(this.endEl);
	this.bc.setFocus(this.startEl);
    this.bc.setFocus(this.middleEl);    
	this.bc.setFocus(this.startImg);	
  }
  
  this.setPos = function(ib,x,y){
    if (this.endIb == ib){
	  this.setStartPos(x,y);
	}else if (this.startIb == ib){
	  this.setEndPos(x,y);
	}
  }  

  
  this.setSelectedIb = function(ib){
	this.selectedIb = ib;	  	
  }
  
  
  //depends on setSelectedIb
  this.getOpposite = function(){
    if (this.endIb == this.selectedIb){	
	  return this.startIb;
	}else if (this.startIb == this.selectedIb){	
	  return this.endIb;
	}	 
	return null;
  }
  
  //depends on setSelectedIb
  this.getSite = function(){
    if (this.endIb == this.selectedIb){	  
	  return this.endDir;	  
	}else if (this.startIb == this.selectedIb){	  
	  if (this.endDir == -1){
	    return -1;
	  }else{
	    return (this.endDir+2)%4;
	  }
	}else{	 
	  return -1;
	}	
  }
  
  this.setStartPos = function (x,y){ 
    this.endX = x;
	this.endY = y;
    this.refresh();
  }
  
  this.setEndPos = function (x,y){
    this.startX = x;
	this.startY = y;
	this.refresh();
  }  
  
  function dist(p1,p2){
    return Math.sqrt((p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]));
  }
  
  this.refresh = function (){ 
    if (this.endIb != null) {
	  var start_corner = this.endIb.getPos();	  
	  var s_left = start_corner[0][0];
	  var s_top = start_corner[0][1];	  
	  var s_right = start_corner[1][0];
	  var s_bottom = start_corner[1][1];	  
	  
	  var e_left;
	  var e_top;	  
	  var e_right;
	  var e_bottom;
	  
	  if (this.startIb != null){
	    var end_corner = this.startIb.getPos();
	    e_left = end_corner[0][0];
	    e_top = end_corner[0][1];	  
	    e_right = end_corner[1][0];
	    e_bottom = end_corner[1][1];
	  }else{
	    e_left =   this.startX;
	    e_top =    this.startY;	  
	    e_right =  this.startX;
	    e_bottom = this.startY;
	  }
	  
	  var side = -1; //0= top 1=right 2=bottom 3=left
	  
	  if ((s_right <= e_left) && (e_bottom >= s_top) && (s_bottom >= e_top)){ //right
	    side = 1;
	  }else if ((s_left >= e_right) && (e_bottom >= s_top) && (s_bottom >= e_top)){ //left
	    side = 3;
	  }else if ((s_top >= e_bottom) && (s_left <= e_right) && (s_right >= e_left)){ //top
	    side = 0;
	  }else if ((s_bottom <= e_top) && (s_left <= e_right) && (s_right >= e_left)){ //bottom
	    side = 2;
	  }else if ((s_top >= e_bottom) && (s_right <= e_left)){ // topright
	    if ((s_top-e_bottom) > (e_left-s_right)){
		   side = 0;
		}else{
		   side = 1;
		}	    
	  }else if ((s_bottom <= e_top) && (s_right <= e_left)){ // bottomright
	    if ((e_top-s_bottom) > (e_left-s_right)){
		  side = 2;
		}else{
		  side = 1;
		}	    
	  }else if ((s_bottom <= e_top) && (s_left >= e_right)){ // bottomleft
	    if ((e_top-s_bottom) > (s_left-e_right)){
		  side = 2;
		}else{
		  side = 3;
		}	    
	  }else if ((s_top >= e_bottom) && (s_left >= e_right)){ // topleft
	    if ((s_top-e_bottom) > (s_left-e_right)){
		  side = 0;
		}else{
		  side = 3;
		}	    
	  }
	  
	  this.endDir = side;
	
	  }
	this.refreshPos();
  }
	
	
  this.refreshPos = function (){ 
	
    if (this.endDir == -1){		

   //display none!! einfügen
   
	} else if (this.endDir == 3){		
	    var width = this.endX-this.startX;
		
		this.endEl.style.left = this.startX+width/2;
		this.endEl.style.top = this.endY;
		this.endEl.style.width  = width/2;
		this.endEl.style.height = this.stroke;		

		
		if (this.startIb != null){
		  this.startImg.style.left = this.startX;
		  this.startImg.style.top = this.startY-(img_size/2);			  
		  this.startImg.src = "resources/arrow3.png";    
		}
		
		var minY = 0;
		var height = 0;
		
		if (this.endY < this.startY){
		  height = this.startY - this.endY;
		  minY = this.endY;
		}else{
		  height = this.endY - this.startY;
		  minY = this.startY;
		}		
		
		this.middleEl.style.left = this.startX+width/2;
		this.middleEl.style.top = minY;
		this.middleEl.style.width  = this.stroke;
		this.middleEl.style.height =  height;
		
		this.startEl.style.left = this.startX;
		this.startEl.style.top = this.startY;
		this.startEl.style.width  = width/2;
		this.startEl.style.height = this.stroke;	
		
		this.centerImgDiv.style.left = -centerImgDivWidth/2;
		this.centerImgDiv.style.top = height/2-centerImgDivHeight/2;
		
			
	  }else if (this.endDir == 1){		    
	    //right
	    var width = this.startX-this.endX;
	
		this.endEl.style.left = this.endX;
		this.endEl.style.top = this.endY;
		this.endEl.style.width  = width/2;
		this.endEl.style.height = this.stroke;				

		
		var height = 0;
		
		if (this.endY < this.startY){
		  height = this.startY - this.endY;		 
		}else{
		  height = this.endY - this.startY;		 
		}		
		
		this.middleEl.style.left =this.endX+width/2;
		this.middleEl.style.top = Math.min(this.endY,this.startY);//minY;
		this.middleEl.style.width  = this.stroke;
		this.middleEl.style.height =  height;
		
		
		this.startEl.style.left = this.endX+width/2;
		this.startEl.style.top = this.startY;
		this.startEl.style.width  = width/2;
		this.startEl.style.height = this.stroke;	
		
		
	    if (this.startIb != null){
		  this.startImg.style.left = this.startX-img_size;
		  this.startImg.style.top = this.startY-(img_size/2);				 
		  this.startImg.src = "resources/arrow1.png";    
		}					
		
		this.centerImgDiv.style.left = -centerImgDivWidth/2;
		this.centerImgDiv.style.top = height/2-centerImgDivHeight/2;
		
	}else if (this.endDir == 0){	    	    
	    //up
	    var height = this.endY-this.startY;
		
		this.endEl.style.left = this.endX;
		this.endEl.style.top = this.startY + height/2;
		this.endEl.style.width  = this.stroke;
		this.endEl.style.height = height/2;
		
		var minX = 0;
		var width = 0;
		
		if (this.endX < this.startX){
		  width = this.startX - this.endX;
		  minX = this.endX;
		}else{
		  width = this.endX - this.startX;
		  minX = this.startX;
		}		
		
		this.middleEl.style.left = minX;
		this.middleEl.style.top = this.startY + height/2;
		this.middleEl.style.width  = width;
		this.middleEl.style.height =  this.stroke;
		
		this.startEl.style.left = this.startX;
		this.startEl.style.top = this.startY;
		this.startEl.style.width  = this.stroke;
		this.startEl.style.height = height/2;
		
		if (this.startIb != null){
		  this.startImg.style.left = this.startX-(img_size/2);
		  this.startImg.style.top = this.startY;	 
		  this.startImg.src = "resources/arrow0.png";    
		}
		
		this.centerImgDiv.style.left = width/2-centerImgDivWidth/2;
		this.centerImgDiv.style.top =  -centerImgDivHeight/2;

	  }else if (this.endDir == 2){	  
	    //down
	    var height = this.startY-this.endY;
		
		this.endEl.style.left = this.endX;
		this.endEl.style.top = this.endY;
		this.endEl.style.width  = this.stroke;
		this.endEl.style.height = height/2;	
		
		var minX = 0;
		var width = 0;
		
		if (this.endX < this.startX){
		  width = this.startX - this.endX;
		  minX = this.endX;
		}else{
		  width = this.endX - this.startX;
		  minX = this.startX;
		}		
		
		this.middleEl.style.left = minX;
		this.middleEl.style.top = this.endY + height/2;
		this.middleEl.style.width  = width;
		this.middleEl.style.height =  this.stroke;
		
		this.startEl.style.left = this.startX;
		this.startEl.style.top = this.endY + height/2;
		this.startEl.style.width  = this.stroke;
		this.startEl.style.height = height/2;
		
		if (this.startIb != null){
		  this.startImg.style.left = this.startX-(img_size/2);
		  this.startImg.style.top = this.startY-img_size;		 
		  this.startImg.src = "resources/arrow2.png";    
		}
		
		this.centerImgDiv.style.left = width/2-centerImgDivWidth/2;
		this.centerImgDiv.style.top =  -centerImgDivHeight/2;
		
	  }	  
  }
}






/*####################################################### InfoBox ###################################################*/

function sortArray0(a,b){  
  var oia = a.getOpposite();
  var oib = b.getOpposite();  
  if ((oia != null) && (oib != null)){    
	return oia.getCenterPos()[0] - oib.getCenterPos()[0];
  }else{
	return -1;
  } 	  
}

function sortArray1(a,b){  
  var oia = a.getOpposite();
  var oib = b.getOpposite();  
  if ((oia != null) && (oib != null)){    
	return oia.getCenterPos()[1] - oib.getCenterPos()[1];
  }else{
	return -1;
  } 	  
}

function sortArray2(a,b){  
  var oia = a.getOpposite();
  var oib = b.getOpposite();  
  if ((oia != null) && (oib != null)){    
	return oib.getCenterPos()[0]-oia.getCenterPos()[0];
  }else{
	return -1;
  } 	  
}

function sortArray3(a,b){  
  var oia = a.getOpposite();
  var oib = b.getOpposite();  
  if ((oia != null) && (oib != null)){    
	return oib.getCenterPos()[1] - oia.getCenterPos()[1];
  }else{
	return -1;
  } 	  
}


function InfoBox(bc){ 
  this.bc = bc;   
  this.arrowList = new Array(); 
  
  this.div_element = document.createElement("div");      
  var tab = document.createElement("table"); 
  tab.width = "100%";
  tab.height = "100%";
  tab.cellSpacing="0px";
  tab.cellPadding ="0px";  
  
  this.tr1 = document.createElement("tr");
  this.tr1.style.backgroundColor ="#79d5e0";
  
  this.tr1onmousedown = function (ev){ return this.bc.eventSwitch("INFO_BOX_HEAD_MOUSEDOWN",this,ev);}  
  this.tr1.onmousedown = this.tr1onmousedown.bindAsEventListener(this);    

  var td1 = document.createElement("td");  
  
  var img1 = document.createElement("img"); 
  img1.src = "resources/arrow.png";   
  
  this.img1onclick = function (ev){  return this.bc.eventSwitch("INFO_BOX_ARROW_BTN_MOUSECLICK",this,ev); }   
  img1.onclick = this.img1onclick.bindAsEventListener(this); 
 
  td1.appendChild(img1); 
  
  this.tr1.appendChild(td1);  
  tab.appendChild(this.tr1);  
  
  var tr2 = document.createElement("tr");  
  var td2 = document.createElement("td");
  this.textbox = document.createElement("textarea");    
  this.textbox.style.width="100%";
  this.textbox.style.height="120px";
  this.textbox.style.border="solid 1px #aaaaaa;";
  this.textbox.style.fontSize = "0.8em";
  this.textbox.style.fontFamily = "Verdana, Arial, sans-serif";
  this.textbox.style.backgroundColor ="#fbf9eb";
  td2.appendChild(this.textbox);
  tr2.appendChild(td2);
  tab.appendChild(tr2); 

  var tr3 = document.createElement("tr");   
  var td3 = document.createElement("td");
  td3.style.textAlign="right";  
  
  var img = document.createElement("img"); 
  img.src = "resources/resize.png";  
  
  this.headImgMouseDownHandler = function (ev){ return this.bc.eventSwitch("INFO_BOX_RESIZE_BTN_MOUSEDOWN",this,ev);}      
  img.onmousedown = this.headImgMouseDownHandler.bindAsEventListener(this);
 
  td3.appendChild(img);
  
  tr3.appendChild(td3);  
  tab.appendChild(tr3);  
  
  this.div_element.appendChild(tab);
  
  this.div_element.style.border="solid 1px #000000;";
  this.div_element.style.position="absolute";
  this.div_element.style.width = "160px";  
  this.div_element.style.backgroundColor = "#e7e5d7";

  
  this.isNewArrowAllowed = function(arrow){
    return (arrow.endIb != this);    
  } 
  
  this.setCursor = function(cursor){
    var cursor = "default";
    if (this.bc.currState == "FLY_ARROW"){
	  if (this.isNewArrowAllowed(this.bc.currElement)){
	    cursor = "pointer";	
	  }else{
	    cursor = "not-allowed";	
	  }	  
	}
	
    this.div_element.style.cursor =cursor;
   	this.tr1.style.cursor =cursor;
	if (cursor == "default"){
	  cursor ="text";
	}
	this.textbox.style.cursor =cursor;
  }
  
  this.div_element_onmousemove = function(ev){ 
    //loadXMLDoc("test.php");  
    this.setCursor();		
  }    
  this.div_element.onmousemove = this.div_element_onmousemove.bindAsEventListener(this);    
  
  
  this.setzeText = function(message){     
    this.textbox.value = message;	
  }  
  
  
  this.div_element_onmouseover = function(ev){            
    this.div_element.style.backgroundColor = "#fbf9e9";
	this.tr1.style.backgroundColor ="#b0f7ff";
	this.textbox.style.backgroundColor ="#ffffff";
	
	this.setCursor();	
  }    
  this.div_element.onmouseover = this.div_element_onmouseover.bindAsEventListener(this);  
  
  this.div_element_onmouseout = function(ev){
    this.div_element.style.backgroundColor = "#e7e5d7";        
	this.tr1.style.backgroundColor ="#79d5e0";
	this.textbox.style.backgroundColor ="#fbf9eb";
	
  }    
  this.div_element.onmouseout = this.div_element_onmouseout.bindAsEventListener(this);
  
  
  
  this.div_element_onmouseup = function(ev){ 
    var res = this.bc.eventSwitch("INFO_BOX_MOUSEUP",this,ev);
	this.setCursor();
	return res;  
  }    
  this.div_element.onmouseup = this.div_element_onmouseup.bindAsEventListener(this);  
  
  this.div_element_onmousedown = function(ev){ return this.bc.eventSwitch("INFO_BOX_MOUSEDOWN",this,ev);}    
  this.div_element.onmousedown = this.div_element_onmousedown.bindAsEventListener(this);
  
  
  /*- functions -*/ 
  
  this.getPos = function(){    //Reihenfolge linksoben - rechtsunten - center
	return new Array(	new Array(this.div_element.offsetLeft,this.div_element.offsetTop),						
						new Array(this.div_element.offsetLeft+this.div_element.offsetWidth,this.div_element.offsetTop+this.div_element.offsetHeight),						
						new Array(this.div_element.offsetLeft+this.div_element.offsetWidth/2,this.div_element.offsetTop+this.div_element.offsetHeight/2)
	);
  }
  
   this.getCenterPos = function(){    //Reihenfolge linksoben - rechtsunten - center
	 return new Array(this.div_element.offsetLeft+this.div_element.offsetWidth/2,this.div_element.offsetTop+this.div_element.offsetHeight/2);
  }
  
  this.resizeInfoBox = function(ev){
    var currTarget = ev.target;
    this.bc.currElement = this.div_element;
    this.bc.currElementOffsetX = ev.clientX-this.div_element.offsetLeft;
    this.bc.currElementOffsetY = ev.clientY-this.div_element.offsetTop;
    this.bc.currOffsetX = this.div_element.offsetLeft;
    this.bc.currOffsetY = this.div_element.offsetTop;
  }
  
  this.refreshArrows = function (){    
    this.refreshArrowPos();
	for(var i=0;i<this.arrowList.length;i++){	  
	  var oib = this.arrowList[i].getOpposite();
	  if(oib != null){
	    oib.refreshArrowPos();	  
      }	  	  
	}
  }
  
  this.test = function(){
  }
  
  
  this.refreshArrowPos = function(){    
    //unterscheidung bei Berechnung der pfeil start/endposition
	// 1: der Pfeil geht direkt von IB zu IB => berechnung nach algouml
	// 2: der Pfeil der Pfeil läuft von IB zu Arrow-Node => 
	
	
	for(var i=0;i<this.arrowList.length;i++){	  
	  this.arrowList[i].setPos(this,unpx(this.div_element.style.left)+(this.div_element.offsetWidth/2),unpx(this.div_element.style.top)+(this.div_element.offsetHeight/2));	  	  	  
	}
	
	var site_0=new Array();
	var site_1=new Array();
	var site_2=new Array();
	var site_3=new Array();
	var nosite=new Array();
	for(var i=0;i<this.arrowList.length;i++){	  
	  this.arrowList[i].setSelectedIb(this);
	  var site = this.arrowList[i].getSite();  
	  
	  if (site==0){
	    site_0.push(this.arrowList[i]);
	  }else if (site==1){
	    site_1.push(this.arrowList[i]);
	  }else if (site==2){
	    site_2.push(this.arrowList[i]);
	  }else if (site==3){
	    site_3.push(this.arrowList[i]);
	  }else{
	    nosite.push(this.arrowList[i]);
	  }
	}
	
	var pos = this.getPos();	
	  
	var step = 20;
	
	
	if (site_0.length >0){	
	  site_0.sort(sortArray0);		
	  var hl = ((site_0.length-1)*step)/2;	
	  for(var i=0;i<site_0.length;i++){
	    site_0[i].setPos(this,pos[2][0]-hl+i*step,pos[0][1]);	  
	  }
	
	}
	
	if (site_1.length >0){	
	  site_1.sort(sortArray1);		
	  var hl = ((site_1.length-1)*step)/2;	
	  for(var i=0;i<site_1.length;i++){
	    site_1[i].setPos(this,pos[1][0],pos[2][1]-hl+i*step);	  
	  }	
	}
	
	if (site_2.length >0){	
	  site_2.sort(sortArray2);		
	  var hl = ((site_2.length-1)*step)/2;	
	  for(var i=0;i<site_2.length;i++){
	    site_2[i].setPos(this,pos[2][0]+hl-i*step,pos[1][1]);	  
	  }	
	}
	
	if (site_3.length >0){	
	  site_3.sort(sortArray3);		
	  var hl = ((site_3.length-1)*step)/2;	
	  for(var i=0;i<site_3.length;i++){
	    site_3[i].setPos(this,pos[0][0],pos[2][1]+hl-i*step);	  
	  }	
	}
	
	
	
	
	
  }
  
  this.setText = function(txt){
    this.content.value = txt;  
  }   
  
  this.startArrow = function(ev){
    this.bc.currElement.startIb = this;
	this.arrowList.push(this.bc.currElement);
	this.refreshArrows();	  
  }  
  
  this.endDrag = function(ev){
    this.bc.currElement =  this.div_element;
	
    this.bc.currElementOffsetX = ev.clientX-this.div_element.offsetLeft;
    this.bc.currElementOffsetY = ev.clientY-this.div_element.offsetTop;	
	
	this.bc.setFocus(this.div_element);
  }
}



/*####################################################### Control ###################################################*/

function Control(parent_element_id){    
  
  this.currElement;
  this.currOffsetX;
  this.currOffsetY;
  this.currElementOffsetX;
  this.currElementOffsetY;  
  this.parent_element_id = parent_element_id;
  this.infoBoxList = new Array();  
  
  this.setFocus = function(div_element){     
    function focusSort(a,b){  
      var za = a.style.zIndex;
	  var zb = b.style.zIndex;
	  
      if (za == ""){ za = "0"; }
      if (zb == ""){ zb = "0"; }   
      return za - zb;
    }   
  
    var sub = new Array();	
	var parent = document.getElementById(this.parent_element_id);
	for(var i=0;i<parent.childNodes.length;i++){
	  sub.push(parent.childNodes[i]);
	}
	
	sub.sort(focusSort);
	
	for(var i=0;i<sub.length;i++){
	  if (sub[i] == div_element){
	    sub[i].style.zIndex = sub.length+1;
	  }else{
	    sub[i].style.zIndex = i;
	  }
	}
  }  

  this.endArrow = function (ib,ev){
    var newarrow = new Arrow(this);
	newarrow.setEndPos(ev.clientX+5,ev.clientY+5);
	newarrow.endIb = ib;		
	ib.arrowList.push(newarrow);
	ib.refreshArrows();
	this.currElement = newarrow;	    	
  }
  
  this.deleteArrow = function(arrow){
    arrow.deleteArrow();
	
  }

  this.addTextBox = function (){
    var newib = new InfoBox(this);  
	this.infoBoxList.push(newib);
    document.getElementById(this.parent_element_id).appendChild(newib.div_element);    
	this.setState("NO_ACTION");	     
  } 
  
  this.getInfoBoxByDIV = function (div){
    var cont = document.getElementById(this.parent_element_id);
	var c = 0;
	for (var i=0;i<this.infoBoxList.length;i++){	  
	  if (this.infoBoxList[i].div_element == div){
	    return this.infoBoxList[i];
	  }	
	}	
  }
  
  
  this.drag_infobox = function(ev){
    this.currElement.style.left = ev.clientX-this.currElementOffsetX;
    this.currElement.style.top = ev.clientY-this.currElementOffsetY;
	this.getInfoBoxByDIV(this.currElement).refreshArrows();
  }
  
  
  this.resize_infobox = function(ev){  
    var new_width = ev.clientX-this.currOffsetX;
    if (new_width < 160){
      new_width = 160;
    }	
    this.currElement.style.width = new_width;
    var new_height = ev.clientY-this.currOffsetY;
    if (new_height < 120){
      new_height = 120;
    }	
    this.currElement.childNodes[0].childNodes[1].childNodes[0].childNodes[0].style.height = (new_height-30)+"px";    
    this.getInfoBoxByDIV(this.currElement).refreshArrows();  	  
  } 
	 
	 
  this.fly_arrow = function(ev){
    this.currElement.setEndPos(ev.clientX+5,ev.clientY+5);		
  }
  
  this.focusInfoBoxes = function(){
    var max = 0;	
	var parent = document.getElementById(this.parent_element_id);
	for(var i=0;i<parent.childNodes.length;i++){
	  max = Math.max(max,parent.childNodes[i].style.zIndex);
	}	
	for(var i=0;i<this.infoBoxList.length;i++){
	  this.infoBoxList[i].div_element.style.zIndex += max;	  
	}	
  } 
  
  
  this.onmousemove = function (ev){ return this.eventSwitch("BOARD_MOUSEMOVE",this,ev); }

  this.onmouseup = function (ev){ return this.eventSwitch("BOARD_MOUSEUP",this,ev); }      
  

  this.currState = "NO_ACTION";
  
  this.setState = function (newstate){
    setState(newstate);
    this.currState = newstate;
  }
  
  this.eventSwitch = function(event,obj,ev){ 
    setEvent(event);     
	
    if (event == "INFO_BOX_HEAD_MOUSEDOWN"){	
      if (this.currState == "NO_ACTION"){  
        this.setState("DRAG_INFOBOX");	      
	    obj.endDrag(ev);	 
	  }	
		 	
	}else if (event == "INFO_BOX_ARROW_BTN_MOUSECLICK"){
	  if (this.currState == "NO_ACTION"){
	    obj.bc.endArrow(obj,ev);	  
		this.currElement.setArrowFocus();
		this.setFocus(obj.div_element);
	    this.setState("FLY_ARROW");
	    return false;  
	  }	  
	}else if (event == "INFO_BOX_RESIZE_BTN_MOUSEDOWN"){
	  if (this.currState == "NO_ACTION"){
	    obj.resizeInfoBox(ev);
        this.setState("RESIZE_INFOBOX");	
		return false;
	  }		
	}else if (event == "INFO_BOX_MOUSEUP"){
	  if(this.currState == "FLY_ARROW"){	  	  	  	 
	    if (obj.isNewArrowAllowed(this.currElement)){
		  obj.startArrow(ev);		  		  
		  this.focusInfoBoxes();		  		 
		}else{
		  this.deleteArrow(this.currElement);
		}		
		this.setFocus(obj.div_element);		  
		this.setState("NO_ACTION");		
		return false;
	  }
	}else if (event == "INFO_BOX_MOUSEDOWN"){
	  this.setFocus(obj.div_element);		  
	}else if (event == "BOARD_MOUSEUP"){
	  if (this.currState == "DRAG_INFOBOX") {	  
        this.setState("NO_ACTION");
      }else if (this.currState == "RESIZE_INFOBOX"){
	    this.setState("NO_ACTION");	
	  }else if(this.currState == "FLY_ARROW"){	  	  	  	 
	    this.deleteArrow(this.currElement);
	    this.setState("NO_ACTION");	
	  }
	  
	}else if (event == "BOARD_MOUSEMOVE"){	  
	  if (this.currState == "DRAG_INFOBOX"){		
		obj.drag_infobox(ev);
	  }else if (this.currState == "RESIZE_INFOBOX"){    
	    obj.resize_infobox(ev);
	  }else if (this.currState == "FLY_ARROW"){ 
	    obj.fly_arrow(ev);
      }	  
	}
	
	return true;  
  }
 
  
}




/*####################################################### functions ###################################################*/

function unpx(str){
  if (str.substring(str.length-2) == "px"){
    str = str.substring(0,str.length-2);
  }  
  return Math.round(str); 
}

function arrayRemove(a,element){
  var na = new Array();
  for(var i=0;i<a.length;i++){	
    if (a[i] != element){
	  na.push(a[i]);
	}
  }
  return na;
}

function setState(info){
 document.getElementById("statebox").firstChild.nodeValue  = "STATE:["+info+"]";
}

function setEvent(info){
 document.getElementById("eventbox").firstChild.nodeValue  = "EVENT:["+info+"]";
}


function setInfo(info){
 document.getElementById("infobox").firstChild.nodeValue  = "MSG:["+info+"]";
}


Function.prototype.bindAsEventListener = function (object) {
	var method = this;
	var wrapper = function (event) {
		return method.call(object, event || window.event);
	};
	return wrapper;
};


