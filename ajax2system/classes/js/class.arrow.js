/*#################################################### Klasse Arrow ###################################################*/

function Arrow(bc,type){

  //**********************  Attribute **************************
  //************************************************************
  
  
  this.bc;
  this.hLine;
  this.startIb;
  this.endDir;
  this.endIb;
  this.selectedIb;
  this.arrowType;
  this.isDBObject;
  this.id;

  var startX;
  var startY;
  var endX;
  var endY;

  var img_size;
  this.stroke;


  //**********************  Methoden ***************************
  //************************************************************


  this.deleteArrow = function(){
    document.getElementById(this.bc.parent_element_id).removeChild(this.endEl);
	document.getElementById(this.bc.parent_element_id).removeChild(this.startEl);
	document.getElementById(this.bc.parent_element_id).removeChild(this.middleEl);
	document.getElementById(this.bc.parent_element_id).removeChild(this.startImg);

	if (this.startIb != null){
	  this.startIb.arrowList = arrayRemove(this.startIb.arrowList,this);
	}

	if (this.endIb != null){
	  this.endIb.arrowList = arrayRemove(this.endIb.arrowList,this);
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
    if (this.startIb == ib){
	    this.setStartPos(x,y);
	  }else if (this.endIb == ib){
	    this.setEndPos(x,y);
	  }
  }


  this.setSelectedIb = function(ib){
	  this.selectedIb = ib;
  }


  //depends on setSelectedIb
  this.getOpposite = function(){
    if (this.startIb == this.selectedIb){
	  return this.endIb;
	}else if (this.endIb == this.selectedIb){
	  return this.startIb;
	}
	return null;
  }


  //depends on setSelectedIb
  this.getSite = function(){
    if (this.startIb == this.selectedIb){
	  return this.endDir;
	}else if (this.endIb == this.selectedIb){
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


  this.setType = function (type){
    this.arrowType = type;
    /*alert("event : "+ this.arrowType);*/
  }


  function dist(p1,p2){
    return Math.sqrt((p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]));
  }


  this.refresh = function (){
    if (this.startIb != null) {
	  var start_corner = this.startIb.getPos();
	  var s_left = start_corner[0][0];
	  var s_top = start_corner[0][1];
	  var s_right = start_corner[1][0];
	  var s_bottom = start_corner[1][1];

	  var e_left;
	  var e_top;
	  var e_right;
	  var e_bottom;

	  if (this.endIb != null){
	    var end_corner = this.endIb.getPos();
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
	  this.endEl.style.display = "none";
      this.middleEl.style.display = "none";
      this.startEl.style.display = "none";
      this.centerImgDiv.display = "none";
	  this.startImg.style.display = "none";
	} else if (this.endDir == 3){
	  this.endEl.style.display = "block";
      this.middleEl.style.display = "block";
      this.startEl.style.display = "block";
      this.centerImgDiv.display = "block";

	  var width = this.endX-this.startX;

      this.endEl.style.left = this.startX+width/2;
      this.endEl.style.top = this.endY;
      this.endEl.style.width  = width/2;
      this.endEl.style.height = this.stroke;

      if (this.endIb != null){
        this.startImg.style.left = this.startX;
        this.startImg.style.top = this.startY-(img_size/2);
        this.startImg.src = "resources/arrow3.png";
        this.startImg.style.display = "block";
      }else{
        this.startImg.style.display = "none";
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
      this.endEl.style.display = "block";
      this.middleEl.style.display = "block";
      this.startEl.style.display = "block";
      this.centerImgDiv.display = "block";
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

      if (this.endIb != null){
        this.startImg.style.left = this.startX-img_size;
        this.startImg.style.top = this.startY-(img_size/2);
        this.startImg.src = "resources/arrow1.png";
        this.startImg.style.display = "block";
      }else{
        this.startImg.style.display = "none";
      }

      this.centerImgDiv.style.left = -centerImgDivWidth/2;
      this.centerImgDiv.style.top = height/2-centerImgDivHeight/2;

    }else if (this.endDir == 0){
	    //up
      this.endEl.style.display = "block";
      this.middleEl.style.display = "block";
      this.startEl.style.display = "block";
      this.centerImgDiv.display = "block";
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

      if (this.endIb != null){
        this.startImg.style.left = this.startX-(img_size/2);
        this.startImg.style.top = this.startY;
        this.startImg.src = "resources/arrow0.png";
        this.startImg.style.display = "block";
      }else{
        this.startImg.style.display = "none";
      }

      this.centerImgDiv.style.left = width/2-centerImgDivWidth/2;
      this.centerImgDiv.style.top =  -centerImgDivHeight/2;

    }else if (this.endDir == 2){
      //down
      this.endEl.style.display = "block";
      this.middleEl.style.display = "block";
      this.startEl.style.display = "block";
      this.centerImgDiv.display = "block";
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

      if (this.endIb != null){
        this.startImg.style.left = this.startX-(img_size/2);
        this.startImg.style.top = this.startY-img_size;
        this.startImg.src = "resources/arrow2.png";
        this.startImg.style.display = "block";
      }else{
        this.startImg.style.display = "none";
      }

      this.centerImgDiv.style.left = width/2-centerImgDivWidth/2;
      this.centerImgDiv.style.top =  -centerImgDivHeight/2;

    }
  }

   
  //**********************  Konstruktor ************************
  //************************************************************  
  
  
  this.bc = bc;
  this.hLine = true;
  this.startIb = null;
  this.endDir=-1;
  this.endIb = null;
  this.selectedIb = null;
  this.arrowType = type;
  this.isDBObject = false;
  this.id = randomId();

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
 
  switch (this.arrowType) {
    case "MARK":
      this.centerImgDiv.src = "resources/buttons/ausrufezeichen_symbol.png";
      break;
    case "QUEST":
      this.centerImgDiv.src = "resources/buttons/frage_symbol.png";
      break;
    case "CONT":
      this.centerImgDiv.src = "resources/buttons/blitz_symbol.png";
      break;
    default:
      alert("das event war : " + this.arrowType);
      break;
  }
  
  this.middleEl.appendChild(this.centerImgDiv);
  this.bc.setFocus(this.centerImgDiv);
  
  //*******************  event-listener-Methoden ***************
  //************************************************************  
  
  this.killArrowConfirm = function(ev){ 
    check = confirm("Soll dieser Pfeil gelöscht werden ?");
    if (check){  
      //hier den ajax command
    }    
    return false;
  };  
  this.centerImgDiv.ondblclick = this.killArrowConfirm.bindAsEventListener(this);

}



