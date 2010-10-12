
/*####################################################### Klasse RPCClient ###################################################*/



/*
function getRPC(){
  rpcclient = getRPCClient();  
  return  rpcclient.getService();
}
*/

function RPCClient(){
  var jsonrpc_ = new rpc.ServiceProxy("classes/php/atrans3_rpc_func.php", {asynchronous:false});
  
  this.getService = function(){
    return jsonrpc_;
  }

  this.update = function(){	
    control = getControl();	
	clear("prot");
    res = jsonrpc_.rpc_update(control.getProjectID(),control.subversion);
	println("prot","S>C: rpc_update res:"+res["max_subversion"]);		
	
	maxsubversion  = res["max_subversion"];
	
	if (maxsubversion == -1){
	  return;
	}
	
	//create new ib: ib_id  
	create_id = res["create_id"];
	if (create_id != null){
	  for (var i = 0; i < create_id.length; i++){	 	  
	    ib = control.addTextBox();
	    ib.isCreated = true;
	    ib.id = create_id[i]
	    ib.setCaption("ID:"+create_id[i]);	  
	  }
	}
	
	update_pos = res["update_pos"];
	if (update_pos != null){
	  for (var i = 0; i < update_pos.length; i++){	 	  
	    this.update_pos(update_pos[i]);
	  }
	}
	
	update_content = res["update_content"];
	if (update_content != null){
      for (var i = 0; i < update_content.length; i++){	 	  
	    this.update_content(update_content[i]);
	  }
	}
	
	remove_ids = res["remove_ids"];
	if (remove_ids != null){
      for (var i = 0; i < remove_ids.length; i++){	 	  
	    this.remove_id(remove_ids[i]);
	  }	
	}
	
	control.subversion = maxsubversion;	
  }    
  
  //new ib pos:ib_id,x,y,width,height
  this.update_pos = function(pos_data){
    ib_id = pos_data["id"];	
    x = pos_data["x"];	
	y = pos_data["y"];	
	width = pos_data["w"];	
	height = pos_data["h"];	

    //println("prot","S>C:[2] new ib pos: ib_id("+ib_id+"),x("+x+"),y("+y+"),width("+width+"),height("+height+")");	
	
	ib = control.getIBByID(ib_id);
    if (ib != null){		  
	  ib.div_element.style.left = x;
      ib.div_element.style.top = y;
      ib.div_element.style.width = width;
      ib.div_element.childNodes[0].childNodes[1].childNodes[0].childNodes[0].style.height = (height-30)+"px";
      ib.refreshArrowPos();
	  ib.setPosUpToDate(true);      
	}	   
  }
  
  //new ib content:ib_id,content
  this.update_content = function(content_data){ 
    ib_id = content_data["id"];	
    content = content_data["content"];	
	
	//println("prot","S>C:[3] new ib content: ib_id("+ib_id+"),content("+content+")");	
	
	ib = control.getIBByID(ib_id);
    if (ib != null){
	  ib.textbox.value = content;
	  ib.setTextUpToDate(true);
	}    
  }
  
  //remove ib:ib_id
  this.remove_id = function(ib_id){   	
	//println("prot","S>C:[4] remove ib:ib_id: ib_id("+ib_id+")");		
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
  }
}



  

/*

function RPCClient(){
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
*/


