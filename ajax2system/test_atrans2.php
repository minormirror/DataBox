<html>
<head>
  <script src="classes/js/class.Ajax2.js" type="text/javascript"></script>
</head>
<body> 

<script type="text/javascript">

function trim(s) {
  while (s.substring(0,1) == ' ') {
    s = s.substring(1,s.length);
  }
  while (s.substring(s.length-1,s.length) == ' ') {
    s = s.substring(0,s.length-1);
  }
  return s;
}

function send(){
  aj = getAjax();
  req = Array();
  
  size = 0;
  for(i=0;i<12;i++){
    if (trim(document.getElementById("v"+i).value) != ""){
	  size++;
	}
  }
  //setInfo("k"+size);
  document.getElementById("size").value = size;
  size = document.getElementById("size").value;
  for(i=0;i<size;i++){
    req.push(document.getElementById("v"+i).value);
  } 
  
  aj.send(req);
}

function response(res){
  for(i=0;i<29;i++){    
    document.getElementById("r"+i).value ="";	
  }  
  document.getElementById("rsize").value = res.length;
  for(i=0;i<res.length;i++){
    if (i<29){
      document.getElementById("r"+i).value =res[i];
	}
  }  
}

</script>
 	
<div id="infobox" style ="width:500px; background-color:#fffaac; border:solid 1px #000000;">.</div>

<table><tr><td valign="top">
request:<br>
<input type="text" id="size" size="40"/> size<br>
<input type="text" id="v0" size="40"/> cmd <br>
<input type="text" id="v1" size="40"/> proj_id <br>
<input type="text" id="v2" size="40"/> 2 <br>
<input type="text" id="v3" size="40"/> 3 <br>
<input type="text" id="v4" size="40"/> 4 <br>
<input type="text" id="v5" size="40"/> 5 <br>
<input type="text" id="v6" size="40"/> 6 <br>
<input type="text" id="v7" size="40"/> 7 <br>
<input type="text" id="v8" size="40"/> 8 <br>
<input type="text" id="v9" size="40"/> 9 <br>
<input type="text" id="v10" size="40"/> 10 <br>
<input type="text" id="v11" size="40"/> 11 <br>
<input type="text" id="v12" size="40"/> 12 <br>
<input type="button" onClick="send();" value="send">


</td><td valign="top">

response:<br>
<input type="text" id="rsize" size="100"/> size<br>
<input type="text" id="r0" size="100"/> 0 <br>
<input type="text" id="r1" size="100"/> 1 <br>
<input type="text" id="r2" size="100"/> 2 <br>
<input type="text" id="r3" size="100"/> 3 <br>
<input type="text" id="r4" size="100"/> 4 <br>
<input type="text" id="r5" size="100"/> 5 <br>
<input type="text" id="r6" size="100"/> 6 <br>
<input type="text" id="r7" size="100"/> 7 <br>
<input type="text" id="r8" size="100"/> 8 <br>
<input type="text" id="r9" size="100"/> 9 <br>
<input type="text" id="r10" size="100"/> 10 <br>
<input type="text" id="r11" size="100"/> 11 <br>
<input type="text" id="r12" size="100"/> 12 <br>
<input type="text" id="r13" size="100"/> 13 <br>
<input type="text" id="r14" size="100"/> 14 <br>
<input type="text" id="r15" size="100"/> 15 <br>
<input type="text" id="r16" size="100"/> 16 <br>
<input type="text" id="r17" size="100"/> 17 <br>
<input type="text" id="r18" size="100"/> 18 <br>
<input type="text" id="r19" size="100"/> 19 <br>
<input type="text" id="r20" size="100"/> 20 <br>
<input type="text" id="r21" size="100"/> 21 <br>
<input type="text" id="r22" size="100"/> 22 <br>
<input type="text" id="r23" size="100"/> 23 <br>
<input type="text" id="r24" size="100"/> 24 <br>
<input type="text" id="r25" size="100"/> 25 <br>
<input type="text" id="r26" size="100"/> 26 <br>
<input type="text" id="r27" size="100"/> 27 <br>
<input type="text" id="r28" size="100"/> 28 <br>
<input type="text" id="r29" size="100"/> 29 <br>
</td>
</tr>
</table>
</body>
</html>
