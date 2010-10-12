
/*####################################################### functions ###################################################*/

function unpx(str){
  if (str.substring(str.length-2) == "px"){
    str = str.substring(0,str.length-2);
  }
  return Math.round(str);
}


function randomId() {
	var chars = "0123456789";
	var rs = "1";
	for (var i=0; i<5; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		rs += chars.substring(rnum,rnum+1);
	}
	return parseInt(rs);
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
/*

Function.prototype.bindAsEventListener = function (object) {
	var method = this;
	var wrapper = function (event) {
		return method.call(object, event || window.event);
	};
	return wrapper;
};
*/

Function.prototype.bindAsEventListener = function (object,p1) {
	var method = this;
	var wrapper = function (event) {
		return method.call(object, event || window.event,p1);
	};
	return wrapper;
};

/*####################################################### functions ###################################################*/

var control;
function getControl(){
  if (control ==  null){
    control = new Control('cont');
	setTimeout('refreshData()',500);
  }
  return control;
}

var ajax_;
function getAjax(){
  if (ajax_ ==  null){
    ajax_ = new Ajax();	
  }
  return ajax_;
}


