<html><head><title>DataBox</title>



<script src="classes/js/rpc-client-js/rpc.js" type="text/javascript"></script>
<script src="classes/js/class.rpcclient.js" type="text/javascript"></script>

<script src="classes/js/class.ibdummyelement.js" type="text/javascript"></script>
<!-- <script src="classes/js/class.mapnavigator.js" type="text/javascript"></script>  -->
<script src="classes/js/class.arrow.js" type="text/javascript"></script> 
<script src="classes/js/class.control.js" type="text/javascript"></script> 
<script src="classes/js/class.infobox.js" type="text/javascript"></script>
<script src="classes/js/func.console.js" type="text/javascript"></script>
<script src="classes/js/func.databox.js" type="text/javascript"></script>
<script src="classes/js/func.timelinescroll.js" type="text/javascript"></script>

<script type="text/javascript">
//debug function
function rpcSend(){    
  //control = getControl();	  
  rpcclient = getRPCClient();
  rpcclient.update();
}


var Unselectable = {

    enable : function(e) {
        var e = e ? e : window.event;
        if (e.button != 1) {
            if (e.target) {
                var targer = e.target;
            } else if (e.srcElement) {
                var targer = e.srcElement;
            }

            var targetTag = targer.tagName.toLowerCase();
            if ((targetTag != "input") && (targetTag != "textarea")) {
                return false;
            }
        }
    },

    disable : function () {
        return true;
    }
}

//var box_container;
function init(){    
  if (typeof(document.onselectstart) != "undefined") {
    document.onselectstart = Unselectable.enable;
  } else {
    document.onmousedown = Unselectable.enable;
    document.onmouseup = Unselectable.disable;
  }  
  box_container = getControl();  
  document.onmousemove = box_container.onmousemove.bindAsEventListener(box_container);
  document.onmouseup = box_container.onmouseup.bindAsEventListener(box_container);
}


</script>

<link href="classes/table_stylesheet.css" rel="stylesheet" type="text/css">
<link rel="addr icon" href="resources/favico.ico"/>

</head>
<body onload="init()" style="background-color:#f8faff">  
  <div id="" style ="width:500px;"><input type="checkbox" id="updater"> Update Thread Active;   time (ms) <input type="text" id="threadtime" value="1000"> <input type="button" onClick="rpcSend();" value="run ajax"></div>    
  <? // include_once("nav_menue.php"); ?>
  <? //include_once("version_timeline.php"); ?>
  
<div id="cont" ></div>

</body>


</html>

<script type="text/javascript">

createConsole("prot","protokoll",10,30);
createConsole("info","info",440,30);


</script>
