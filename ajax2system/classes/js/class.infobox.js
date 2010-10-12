/*################################################## Klasse InfoBox ###################################################*/

function InfoBox(bc_){

  //**********************  Attribute **************************
  //************************************************************
  
  this.bc = null;                  //Referenz auf Control
  this.arrowList = new Array();   //Liste mit Arrows die an die InfoBox angeschlossen sind

  this.id = -1;                     //eindeutige Id für den aktuellen Zustand der Infobox: eine eindeutige Referenz für x,y,widht,height,content dieser IB
  this.project_id = 0;             //Projekt-Id 
  this.version = 0;                //Versions-Nr
  this.subversion = 0;             //Subversions-Nr
  
  this.isCreated = false;
  this.posIsUpToDate = false;
  this.textIsUpToDate = false;

  this.textbox = null;
  this.captionText = null;

  //O.G. attribute muessen noch privatisiert werden---------------------------------------------------------------------------------------------------------
  
  var tr1 = null;
  this.div_element = null;
  this.suppress_drag = false;
  

  //**********************  Methoden ***************************
  //************************************************************
  
  
  this.isNewArrowAllowed = function(arrow){
    return (arrow.startIb != this);
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

    this.div_element.style.cursor = cursor;
    tr1.style.cursor =cursor;
	  if (cursor == "default"){
	    cursor ="text";
	  }
	  this.textbox.style.cursor =cursor;
  }

  
  this.setUpToDateImg = function(){    
	  if (this.posIsUpToDate && this.textIsUpToDate && this.isCreated){
	    imgUpToDate.src = "resources/icons/saved_ja.png";
  	}else{
	    imgUpToDate.src = "resources/icons/saved_nein.png";
	  }
  }
  
  this.setzeText = function(message){
    this.textbox.value = message;
  }
  
  this.setCaption = function(caption){
    this.captionText.innerHTML = caption;
  }


  this.startDrag = function(ev){
    this.bc.currElement =  this.div_element;

    this.bc.currElementOffsetX = ev.clientX-this.div_element.offsetLeft;
    this.bc.currElementOffsetY = ev.clientY-this.div_element.offsetTop;

	this.bc.setFocus(this.div_element);	
	this.setPosUpToDate(false);
  }
  
  this.setText = function(txt){
    this.content.value = txt;
  }  
  
  this.setPosUpToDate = function(value){
    this.posIsUpToDate = value;
	this.setUpToDateImg();
  }
  
  this.setTextUpToDate = function(value){
    this.textIsUpToDate = value;
	this.setUpToDateImg();
  }  

  this.endArrow = function(ev){
    this.bc.currElement.endIb = this;
	  this.arrowList.push(this.bc.currElement);
	 // this.bc.currElement.startIb.unActArrow = this.bc.currElement;
	  this.refreshArrows();
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
	  
	//comperator Funktionen zur Sortierung der Arrows; aufgerufen von der Methode refreshArrowPos
    //Parameter: a,b sind Arrows 
    function sortArrayX(a,b){
      //oia und oib sind die gegenüberliegenden (opposite) InfoBoxen des angeschlossenen Arrows
      var oia = a.getOpposite();
      var oib = b.getOpposite();
      if ((oia != null) && (oib != null)){
	    return oia.getCenterPos()[0] - oib.getCenterPos()[0]; //Vergleiche X-Werte 
      }else{
	    return -1;
      }
    }

    function sortArrayY(a,b){
      var oia = a.getOpposite();
      var oib = b.getOpposite();
      if ((oia != null) && (oib != null)){
	    return oia.getCenterPos()[1] - oib.getCenterPos()[1]; //Vergleiche Y-Werte 
      }else{
	    return -1;
      }
    }

	if (site_0.length >0){
	  site_0.sort(sortArrayX);
	  var hl = ((site_0.length-1)*step)/2;
	  for(var i=0;i<site_0.length;i++){
	    site_0[i].setPos(this,pos[2][0]-hl+i*step,pos[0][1]);
	  }
	}

  	if (site_1.length >0){
	  site_1.sort(sortArrayY);
	  var hl = ((site_1.length-1)*step)/2;
	  for(var i=0;i<site_1.length;i++){
	    site_1[i].setPos(this,pos[1][0],pos[2][1]-hl+i*step);
	  }
	}

	if (site_2.length >0){	   
	  site_2.sort(sortArrayX);
	  site_2.reverse();
	  var hl = ((site_2.length-1)*step)/2;
	  for(var i=0;i<site_2.length;i++){
	    site_2[i].setPos(this,pos[2][0]+hl-i*step,pos[1][1]);
  	  }
	}

	if (site_3.length >0){	    
	  site_3.sort(sortArrayY);
 	  site_3.reverse();
	  var hl = ((site_3.length-1)*step)/2;
	  for(var i=0;i<site_3.length;i++){
	    site_3[i].setPos(this,pos[0][0],pos[2][1]+hl-i*step);
	  }
	}
  }
  
  //Liefert einen Array(x,y) mit der Koordinate der Mitte der InfoBox
  this.getCenterPos = function(){    //Reihenfolge linksoben - rechtsunten - center
	  return new Array(this.div_element.offsetLeft+this.div_element.offsetWidth/2,this.div_element.offsetTop+this.div_element.offsetHeight/2);
  }

  this.resizeInfoBox = function(ev){
   // var currTarget = ev.target;
    this.bc.currElement = this.div_element;
    this.bc.currElementOffsetX = ev.clientX-this.div_element.offsetLeft;
  //  this.bc.currElementOffsetY = (window.pageYOffset + ev.clientY)-this.div_element.offsetTop;
    this.bc.currElementOffsetY = ev.clientY-this.div_element.offsetTop;
    this.bc.currOffsetX = this.div_element.offsetLeft;
    this.bc.currOffsetY = this.div_element.offsetTop;
	this.setPosUpToDate(false);
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
  
  this.getPos = function(){    //Reihenfolge linksoben - rechtsunten - center
	  return new Array(	new Array(this.div_element.offsetLeft,this.div_element.offsetTop),
						new Array(this.div_element.offsetLeft+this.div_element.offsetWidth,this.div_element.offsetTop+this.div_element.offsetHeight),
						new Array(this.div_element.offsetLeft+this.div_element.offsetWidth/2,this.div_element.offsetTop+this.div_element.offsetHeight/2)
	  );
  }
  
  
  //**********************  Konstruktor ************************
  //************************************************************  
  
  this.bc = bc_;
  
  this.id = randomId();
  this.div_element = document.createElement("div");
  
  var tab = document.createElement("table");
  tab.width = "100%";
  tab.height = "100%";
  tab.cellSpacing="0px";
  tab.cellPadding ="0px";

  tr1 = document.createElement("tr");
  tr1.style.backgroundColor ="#64798c"; // #79d5e0 #9da1c6
  
  var td1 = document.createElement("td");
  var td_1 = document.createElement("td");

  var imgUpToDate = document.createElement("img");
  imgUpToDate.src = "resources/icons/saved_nein.png";  
  
  td1.appendChild(imgUpToDate);

  /* Bestätigungs Button */
  var img3 = document.createElement("img");
  img3.src = "resources/icons/ausrufezeichen_button_ico.png";
  //img3.onmousedown = function (ev){ return false; }
  
  td1.appendChild(img3);

  /* Widerspruch Button */
  var img4 = document.createElement("img");
  img4.src = "resources/icons/blitz_button_ico.png";
  
  td1.appendChild(img4);

  /* Frage Button */
  var img5 = document.createElement("img");
  img5.src = "resources/icons/frage_button_ico.png";
  
  td1.appendChild(img5);
  
  this.captionText = document.createElement("span"); 
  this.captionText.style.color ="#ffffff";
  td1.appendChild(this.captionText);

    /* Loeschen Button */
  var img6 = document.createElement("img");
  img6.src = "resources/icons/loesch_button_ico.png";
  var td2 = document.createElement("td");
  
  var td_spalteX_ausrichtung = document.createAttribute("align");
  td_spalteX_ausrichtung.nodeValue = "right";
  td2.setAttributeNode(td_spalteX_ausrichtung);  

  td2.appendChild(img6);
  tr1.appendChild(td1);
  tr1.appendChild(td2);
  tab.appendChild(tr1);

  var tr2 = document.createElement("tr");
  var td2 = document.createElement("td");
  var spalten_verbinden = document.createAttribute("colspan");
  spalten_verbinden.nodeValue = "2";
  td2.setAttributeNode(spalten_verbinden);
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

  this.textboxonkeyup = function (ev){     
	this.setTextUpToDate(false);
  }
  this.textbox.onkeyup  = this.textboxonkeyup.bindAsEventListener(this);

  var tr3 = document.createElement("tr");
  var td3 = document.createElement("td");
  var spalten_verbinden3 = document.createAttribute("colspan");
  spalten_verbinden3.nodeValue = "2";
  td3.setAttributeNode(spalten_verbinden3);
  td3.style.textAlign="right";
  var img = document.createElement("img");
  img.src = "resources/icons/groesse.png";
  
  td3.appendChild(img);
  tr3.appendChild(td3);
  tab.appendChild(tr3);
  this.div_element.appendChild(tab);
  this.div_element.style.border="solid 1px #000000;";
  this.div_element.style.position="absolute";
  this.div_element.style.width = "160px";
  this.div_element.style.backgroundColor = "#e7e5d7";  


  //*******************  event-listener-Methoden ***************
  //************************************************************  

  this.div_element_onmousemove = function(ev){
    this.setCursor();
  }
  this.div_element.onmousemove = this.div_element_onmousemove.bindAsEventListener(this);
  
  
  this.div_element_onmouseover = function(ev){
    this.div_element.style.backgroundColor = "#fbf9e9";
	tr1.style.backgroundColor ="#85a1ba";
	this.textbox.style.backgroundColor ="#ffffff";
	this.setCursor();
	//setInfo('ID:'+this.id);
  }
  this.div_element.onmouseover = this.div_element_onmouseover.bindAsEventListener(this);


  this.div_element_onmouseout = function(ev){
    this.div_element.style.backgroundColor = "#e7e5d7";
	  tr1.style.backgroundColor ="#64798c"; //#79d5e0 9da1c6
	  this.textbox.style.backgroundColor ="#fbf9eb";
  }
  this.div_element.onmouseout = this.div_element_onmouseout.bindAsEventListener(this);

  
  this.div_element_onmouseup = function(ev){
	if(this.bc.currState == "FLY_ARROW"){
      if (this.isNewArrowAllowed(this.bc.currElement)){
        this.endArrow(ev);
        this.bc.focusInfoBoxes();
      }else{
        this.bc.deleteArrow(this.bc.currElement);
      }
      this.bc.setFocus(this.div_element);
      this.bc.setState("NO_ACTION");
	  this.setCursor();
      return false;
    }
	  
	this.setCursor();
	return true;
  }
  this.div_element.onmouseup = this.div_element_onmouseup.bindAsEventListener(this);


  this.div_element_onmousedown = function(ev){     
	this.bc.setFocus(this.div_element);
	return true;
  }
  this.div_element.onmousedown = this.div_element_onmousedown.bindAsEventListener(this);
  
  
  this.tr1onmousedown = function (ev){       
  println("info","tr clicjk");
    //if (this.bc.suppress_drag == false){
      if (this.bc.currState == "NO_ACTION"){
	    
        this.bc.setState("DRAG_INFOBOX");
	    this.startDrag(ev);
        this.bc.ibDummy.show(this.bc.currElement.offsetLeft,this.bc.currElement.offsetTop,this.bc.currElement.offsetWidth,this.bc.currElement.offsetHeight);
      }
	//}
	return true;
  }
  tr1.onmousedown = this.tr1onmousedown.bindAsEventListener(this);   
  
  
   this.tr1onmouseup = function (ev){       
  println("info","tr up");
    //if (this.bc.suppress_drag == false){
      
	//}
  }
  tr1.onmouseup = this.tr1onmouseup.bindAsEventListener(this);   
  
  
  this.imgUpToDateonclick = function (ev){ 
  println("info","img clicjk");
  //  this.bc.suppress_drag = true;
    if (this.bc.currState == "NO_ACTION"){
      //if (!this.isAct){ 
	  
	 control = getControl();	
	 if(!this.isCreated){       	  	   
       rpc_client = getRPCClient();   
	   res = rpc_client.getService().rpc_createIb(control.getProjectID(),this.id);
	   ib = control.getIBByID(res["rand_id"]);
       if (ib != null){	
	     ib.id = res["new_id"];	  	
	   }	   
	 }
	 
     if(!this.posIsUpToDate){        
       rpc_client = getRPCClient();
	   x = this.div_element.offsetLeft;
	   y = this.div_element.offsetTop;
       width = this.div_element.offsetWidth;
	   height = this.div_element.offsetHeight;		   
	   res = rpc_client.getService().rpc_updatePos(control.getProjectID(),this.id,x,y,width,height);		   
	 }
	 
	 if(!this.textIsUpToDate){ 
	   rpc_client = getRPCClient();	  	   	   
	   res = rpc_client.getService().rpc_updateText(control.getProjectID(),this.id,this.textbox.value);	
	 }
	  
	  
      /*  if (this.unActArrow != null){
          if (this.unActArrow.isDBObject){
		    msg = new Array();
            msg.push("5");//hier ende --- mit connect. läufts noch nich, soll so ähnlich laufen wie ibs, aus der superquery noch den remove=0 where rausnehmen und wenn con oder ib gelöscht wird eine botschaft an atrans schicken und der alle andere informieren
            msg.push(""+this.unActArrow.id);
            msg.push(""+this.unActArrow.startIb.id);
            msg.push(""+thisunActArrow.endIb.id);
			getAjax().send(msg);
          }else{
		    msg = new Array();
            msg.push("4");
            msg.push(""+this.unActArrow.id);
            msg.push(""+this.unActArrow.startIb.id);
            msg.push(""+this.unActArrow.endIb.id);
			getAjax().send(msg);
          }
        }else{
          if (this.isDBObject){
		    msg = new Array();
            msg.push("3");
            msg.push(""+this.id);
            msg.push(""+this.textbox.value);
            msg.push(""+this.div_element.offsetLeft);
            msg.push(""+this.div_element.offsetTop);
            msg.push(""+this.div_element.offsetWidth);
            msg.push(""+this.div_element.offsetHeight);
			getAjax().send(msg);
          }else{
		    msg = new Array();
            msg.push("2");			
            msg.push(""+this.id);
            msg.push(""+this.textbox.value);
            msg.push(""+this.div_element.offsetLeft);
            msg.push(""+this.div_element.offsetTop);
            msg.push(""+this.div_element.offsetWidth);
            msg.push(""+this.div_element.offsetHeight);
			getAjax().send(msg);
          }
        }        
		*/
     // }
    }
	println("info","click update img");	
    return true; 
  }
  imgUpToDate.onmousedown = this.imgUpToDateonclick.bindAsEventListener(this);
  
  this.imgUpToDateonup = function (ev){ 
  println("info","click up");	
  return true;
  }
  imgUpToDate.onmouseup = this.imgUpToDateonup.bindAsEventListener(this);
  
  
  
  this.startArrow = function (ev,b){    
   this.bc.lastEvent = b;
   if (this.bc.currState == "NO_ACTION"){
      this.bc.startArrow(this,ev);      
      this.bc.currElement.setArrowFocus();
      this.bc.setFocus(this.div_element);
      this.bc.setState("FLY_ARROW");
    }
    return false;
  }
  
  img3.onmousedown = this.startArrow.bindAsEventListener(this,"MARK");  
  img4.onmousedown = this.startArrow.bindAsEventListener(this,"CONT");    
  img5.onmousedown = this.startArrow.bindAsEventListener(this,"QUEST");  	  

  
  this.img6onclick = function (ev){ 
    if (this.bc.currState == "NO_ACTION"){
      check = confirm("Wollen Sie dieses Element("+this.id+") endgültig löschen ?");
      if (check){  
        msg = new Array();
        msg.push("6");
        msg.push(""+this.id);		  
        getAjax().send(msg);
      }
        //this.deleteTextBox(obj);		
      return false;
    }
	return true;
  }
  img6.onclick = this.img6onclick.bindAsEventListener(this);
  
  
  this.resizeImgMouseDownHandler = function (ev){   
    if (this.bc.currState == "NO_ACTION"){
      this.resizeInfoBox(ev);
      this.bc.setState("RESIZE_INFOBOX");
      this.bc.ibDummy.show(this.bc.currElement.offsetLeft,this.bc.currElement.offsetTop,this.bc.currElement.offsetWidth,this.bc.currElement.offsetHeight);
      return false;
    }
	  return true;  
  }
  img.onmousedown = this.resizeImgMouseDownHandler.bindAsEventListener(this);  
}

