

/*####################################################### Klasse Ajax ###################################################*/

var ajax_ = null;
function getAjax(){
  if (ajax_ == null){
    ajax_ = new Ajax();	
  }
  return ajax_;
}

function Ajax(){
  var req;
  var timeoutcnt = 0;
  var wait_for_response = false;
  var send_qeue = new Array();
  var xmlHttp = null;  
  var debug = false;  
  
  this.getSendQeueSize = function(){
    return send_qeue.length;
  }
  
  // Mozilla, Opera, Safari sowie Internet Explorer 7
  if (typeof XMLHttpRequest != 'undefined') {
    xmlHttp = new XMLHttpRequest();
  }
  if (!xmlHttp) {
  // Internet Explorer 6 und älter
    try {
      xmlHttp  = new ActiveXObject("Msxml2.XMLHTTP");
    } catch(e) {
      try {
        xmlHttp  = new ActiveXObject("Microsoft.XMLHTTP");
      } catch(e) {
        xmlHttp  = null;
      }
    }
  }

  this.sendQueu = function (){  
    if (send_qeue.length == 0){
      return;
    }

    if (!wait_for_response && !(xmlHttp && xmlHttp.readyState==3)){
      timeoutcnt = 0;
      wait_for_response = true;

      if (xmlHttp)  {
        try{
          xmlHttp.open('POST', 'classes//php//atrans2.php', true);
        } catch(e) {
          alert("3"+e);
	    }

        xmlHttp.onreadystatechange = function () {
          if ((xmlHttp!= null)  && (xmlHttp.readyState == 4)){
            wait_for_response = false;
		    resp = new Array();
		    resptxt = xmlHttp.responseText;
		    if (resptxt[resptxt.length-1] == "|"){
              resptxt=resptxt.substr(0,resptxt.length-1);
              a = resptxt.split("#");
              for(k=0;k<a.length;k++){
			    resp.push(encode(a[k]));
              }
            }
			
			if (debug){
			  response(resp);
			}else{
			  getAjax().response(resp);
			}
			
         }
        };
        xmlHttp.send(send_qeue.shift());
      }
    }else{
      timeoutcnt++;
    }
  }  
 
 
  function code(st){
    news = "";
    for (i=0;i<st.length;i++){
      if (st[i] == "+"){
	    news += "+0";
      }else if (st[i] == "#"){
	    news += "+1";
	  }else if (st[i] == "|"){
	    news += "+2";
	  }else if (st[i] == "?"){
	    news += "+3";
	  }else if (st[i] == "&"){
	    news += "+4";
	  }else{
	    news += st[i];
	  }
    }
    return news;
  }
  
  function encode(st){
    news = "";
    for (i=0;i<st.length;i++){
      if (st[i] == "+"){
	    i++;
	    if (st[i] == "0"){
	      news += "+";
        }else if (st[i] == "1"){
	      news += "#";
	    }else if (st[i] == "2"){
	      news += "|";
	    }else if (st[i] == "3"){
	      news += "?";
	    }else if (st[i] == "4"){
	      news += "&";
	    }
	  }else{
	    news += st[i];
	  }
    }
    return news;
  }


  this.send = function(msg){  
    out = new Array();
    newms = "";
	clear("prot");
    for(var i=0;i<msg.length;i++){
	  println("prot","C>S: "+msg[i]);	
      newms += code(msg[i]);
	  if (i != msg.length-1){
	    newms += "#";
	  }
    }	
    newms += "|";
    send_qeue.push(newms);    
    this.sendQueu();
  } 
  
  
  
  this.response =  function(res){       
	
	var cmdid = res[0];
	var projectid = res[1];
	var maxsubversion = res[2];		
	
	println("prot","S>C: cmdid:"+cmdid);
	println("prot","S>C: projektid:"+projectid);		
	
	pos = 3;
	
	if (cmdid == 1){
	  println("prot","S>C: maxsubversion:"+maxsubversion);
	  if (maxsubversion == -1){
	    return;
	  }
	  while(pos != res.length){	 
	    change_fct = res[pos];
		println("prot","");	          
	    pos++;
	    switch(parseInt(change_fct)){
	      case 1:		 
		    pos = this.interpretChangeFunc1(pos,res);
		    break;
	      case 2:
		    pos = this.interpretChangeFunc2(pos,res);
		    break;
	      case 3:
		    pos = this.interpretChangeFunc3(pos,res);
		    break;
	      case 4:
  		    pos = this.interpretChangeFunc4(pos,res);
		    break;		
		  default:	
            printAjaxInfo("default:"+pos+" - "+res);  	
		  return;
	    }	  
	  }
	  control.subversion = parseInt(maxsubversion);
	}else if (cmdid == 2){ //create ib
	
	}
	
	
	
	
  }
  
  //create new ib: ib_id  
  this.interpretChangeFunc1 = function(pos,res){	    
    ib_id = res[pos];
	pos++;
	
	println("prot","S>C:[1] create new ib id:"+ib_id);	  
	
	control = getControl();
	ib = control.addTextBox();
	ib.isCreated = true;
	ib.id = ib_id;
	ib.setCaption("ID:"+ib_id);
	
    //printAjaxInfo("{new_ib_id:"+ ib_id+"}");  	
    return pos;
  }
  
  //new ib pos:ib_id,x,y,width,height
  this.interpretChangeFunc2 = function(pos,res){
    ib_id = res[pos];
	pos++;
    x = res[pos];
	pos++;
	y = res[pos];
	pos++;
	width = res[pos];
	pos++;
	height = res[pos];
	pos++;

    println("prot","S>C:[2] new ib pos: ib_id("+ib_id+"),x("+x+"),y("+y+"),width("+width+"),height("+height+")");	
	
	ib = control.getIBByID(ib_id);
    if (ib != null){		  
	  ib.div_element.style.left = x;
      ib.div_element.style.top = y;
      ib.div_element.style.width = width;
      ib.div_element.childNodes[0].childNodes[1].childNodes[0].childNodes[0].style.height = (height-30)+"px";
      ib.refreshArrowPos();
	  ib.setPosUpToDate(true);      
	}	
		
    return pos;
  }
  
  //new ib content:ib_id,content
  this.interpretChangeFunc3 = function(pos,res){ 
    ib_id = res[pos];
	pos++;
    content = res[pos];
	pos++;	
	
	println("prot","S>C:[3] new ib content: ib_id("+ib_id+"),content("+content+")");	
	
	ib = control.getIBByID(ib_id);
    if (ib != null){
	  ib.textbox.value = content;
	  ib.setTextUpToDate(true);
	}
	//printAjaxInfo("{new_ib_content: id"+ib_id+" content|"+ content+"}");  	
    return pos;
  }
  
  //remove ib:ib_id
  this.interpretChangeFunc4 = function(pos,res){
    ib_id = res[pos];
	pos++;
	
	println("prot","S>C:[4] remove ib:ib_id: ib_id("+ib_id+")");	
	
	ib = control.getIBByID(ib_id);
	if (ib != null){
  	  var newInfoBoxList = new Array();	
	  for (var i=0;i<control.infoBoxList.length;i++){
	    if (control.infoBoxList[i] != ib){
  	      newInfoBoxList.push(control.infoBoxList[i]);	
	    }
	  }	
	  control.infoBoxList = newInfoBoxList;
	  document.getElementById(control.parent_element_id).removeChild(ib.div_element);
    }		      
    return pos;
  }

  
}


 //Thread
 
 
function sendThread(){
  ajax = getAjax();
  if (ajax.getSendQeueSize() == 0){  
    if (document.getElementById("updater").checked){	
      control = getControl();	  
      msg = new Array();
	  msg.push("1"); //command
	  msg.push(""+control.getProjectID()); //project id
      msg.push(""+control.subversion);  
      ajax.send(msg);	
	}
	
  }else{
    ajax.sendQueu();
  }
  
  setTimeout('sendThread()',parseInt(document.getElementById("threadtime").value));
}



