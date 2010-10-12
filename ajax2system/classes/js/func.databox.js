
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

Function.prototype.bindAsEventListener = function (object) {
	var method = this;
	var wrapper = function (event) {
		return method.call(object, event || window.event);
	};
	return wrapper;
};

var control;
function getControl(){
  if (control ==  null){
    control = new Control('cont');
	//setTimeout('updateThread()',500);
  }
  return control;
}

var rpcclient_ = null;
function getRPCClient(){
  if ( rpcclient_ == null){	 
	 rpcclient_ = new RPCClient();
	 
  }
  return  rpcclient_;
}

function updateThread(){
  rpcclient = getRPCClient();
  rpcclient.update();
  
  setTimeout('updateThread()',parseInt(document.getElementById("threadtime").value));
}

