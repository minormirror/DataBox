/*####################################################### Klasse Ajax ###################################################*/

function Ajax(){
  var req;
  var timeoutcnt = 0;
  var wait_for_response = false;
  var send_qeue = new Array();
  var xmlHttp = null;
  
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
          xmlHttp.open('POST', 'classes//php//atrans.php', true);
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
            response(resp);
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
    for(var i=0;i<msg.length;i++){
      newms += code(msg[i]);
	  if (i != msg.length-1){
	    newms += "#";
	  }
    }	
    newms += "|";
    send_qeue.push(newms);
    this.sendQueu();
  } 


  function response(res){
    cmd = parseInt(res[0]);
    switch(cmd){
      case 1: //act
	    control = getControl();
	    control.subversion = res[1];
	    for(var i=0;i<parseInt(res[2]);i++){
          var ibid =   res[3+i*7+4];
		  var removed = res[3+i*7+1+4];
		  var content = res[3+i*7+2+4];
		  var x =      res[3+i*7+3+4];
		  var y =      res[3+i*7+4+4];
		  var width =  res[3+i*7+5+4];
		  var height = res[3+i*7+6+4];
		
		  if (removed != 1){
	        ib = control.getIBByID(ibid);
		    if (ib == null){
  		      ib = control.addTextBox();
		    }
	        ib.id = ibid;
		    ib.isDBObject = true;
		    ib.dbstring = content;
		    ib.textbox.value = content;
		    ib.setAct(true);
		    ib.div_element.style.left = x;
		    ib.div_element.style.top = y;
		    ib.div_element.style.width = width;
		    ib.div_element.childNodes[0].childNodes[1].childNodes[0].childNodes[0].style.height = (height-30)+"px";
		    ib.refreshArrowPos();
		  }else{	
            //delete ib	 
		    ib = control.getIBByID(ibid);
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
		
        control.minX = res[3];	  
	    control.maxX = res[4];
        control.minY = res[5];  
        control.maxY = res[6];    
     
        if (parseInt(res[2]) > 0){
          control.mapNavigator.refresh_map();
        }
	  
	    setInfo("resp:"+res);		
      case 2: //create ib
	    control = getControl();
	    ib = control.getIBByID(res[1]);
	    if (ib != null){
	      ib.id = res[2];
		  ib.isDBObject = true;
		  ib.dbstring = res[4];
		  ib.setAct(ib.textbox.value == ib.dbstring);
		  control.subversion = res[3];
        }
	    break;
	  case 3: //new id subversion and update text
	    control = getControl();
	    ib = control.getIBByID(res[1]);
	    if (ib != null){
         // control.subversion = res[2];
		  ib.dbstring = res[3];
		  ib.setAct(ib.textbox.value == ib.dbstring);
        }
	    break;
	  case 4: //do nothing
	    break;
	  default:
	    setInfo("resp:"+res);
    }
  }
}


 //Thread
 function refreshData(){
    ajax = getAjax();
    if (ajax.getSendQeueSize() == 0){
      control = getControl();	  
      msg = new Array();
	  msg.push("1");
	  msg.push(""+control.subversion);
      ajax.send(msg);
    }else{
      ajax.sendQueu();
    }
    setTimeout('refreshData()',800);
  }


