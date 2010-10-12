/*####################################################### Klasse Control ###################################################*/

function Control(parent_element_id){

  //**********************  Attribute **************************
  //************************************************************
  this.maxX;
  this.minX;
  this.maxY;
  this.minY;  
  
  this.currElement;
  this.currOffsetX;
  this.currOffsetY;
  this.currElementOffsetX;
  this.currElementOffsetY;
  this.currState;
  this.parent_element_id ;  //'cont'
  this.infoBoxList;
  this.mapNavigator;
  this.ibDummy;
  this.subversion;
  this.lastEvent;  
  
  this.projectID = 4;
  
 
  //**********************  Methoden ***************************
  //************************************************************ 
  
  this.getProjectID = function(){
    return this.projectID;
  }

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


  this.startArrow = function (ib,ev){
    var newarrow = new Arrow(this,this.lastEvent);
	newarrow.setEndPos(ev.clientX+5,ev.clientY+5);
	newarrow.startIb = ib;
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
    return newib;
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
  }

  this.resize_infobox = function(ev){
    var new_width = (window.pageXOffset+ev.clientX)-this.currOffsetX;
    if (new_width < 160){
      new_width = 160;
    }
    this.currElement.style.width = new_width;
    var new_height = (window.pageYOffset+ev.clientY)-this.currOffsetY;
    if (new_height < 120){
      new_height = 120;
    }
    this.currElement.childNodes[0].childNodes[1].childNodes[0].childNodes[0].style.height = (new_height-30)+"px";
  }


  this.fly_arrow = function(ev){    
    this.currElement.setEndPos(window.pageXOffset+ev.clientX+5,window.pageYOffset+ev.clientY+5);
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

  this.getIBByID = function(id){
    for (var i=0;i<this.infoBoxList.length;i++){
	  if (this.infoBoxList[i].id == id){
	    return this.infoBoxList[i];
	  }
	}
	return null;
  }
  
  
  this.setState = function (newstate){
    //println("info","new state:"+newstate);		
    //setState(newstate);
    this.currState = newstate;
  }
  
  
  this.getLastEvent = function(){
    return this.lastEvent;
  }
  

  //**********************  Konstruktor ************************
  //************************************************************  
  
  this.currState = "NO_ACTION";
  this.parent_element_id = parent_element_id;  //'cont'
  this.infoBoxList = new Array();
  this.ibDummy = new IBDummyElement();
  this.subversion = 0;
 // this.suppress_drag = false;
  
  document.getElementById(this.parent_element_id).appendChild(this.ibDummy.div_element);
  //init_timeline();//--------------------------------------------------------------------------
  //this.mapNavigator = new MapNavigator();  
  
  //*******************  event-listener-Methoden ***************
  //************************************************************  
  
  //both bound in index.php
  
  this.onmousemove = function (ev){     
    if (this.currState == "DRAG_INFOBOX"){
      this.drag_infobox(ev);
    }else if (this.currState == "RESIZE_INFOBOX"){
      this.resize_infobox(ev);
    }else if (this.currState == "FLY_ARROW"){
      this.fly_arrow(ev);
    }
	return true;
  }

  this.onmouseup = function (ev){      
    println("info","doc move");
    if (this.currState == "DRAG_INFOBOX") {
      this.getInfoBoxByDIV(this.currElement).refreshArrows();
      this.ibDummy.hide();
      this.setState("NO_ACTION");
    }else if (this.currState == "RESIZE_INFOBOX"){
      this.getInfoBoxByDIV(this.currElement).refreshArrows();
      this.ibDummy.hide();
      this.setState("NO_ACTION");
    }else if(this.currState == "FLY_ARROW"){
      this.deleteArrow(this.currElement);
      this.setState("NO_ACTION");
    }	
	//this.suppress_drag = false;
	//println("info","control onmouseupsuppress_drag:"+this.suppress_drag);	    
	return true;
  }

}


