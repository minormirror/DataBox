
function createConsole(id,caption,x,y){
  div = document.createElement("div");
  div.appendChild(document.createTextNode("[ "+caption+" ]")); 
  div.style.position="absolute";
  div.style.backgroundColor = "rgb(255,255, 255)";
  div.style.left = x;
  div.style.top = y;  
  document.body.appendChild(div); 

  text = document.createElement("textarea");
  text.id = "console_"+id;
  text.cols = "50";
  text.rows = "30";
  text.style.position="absolute";
  text.style.left = x;
  text.style.top = y+18;
  document.body.appendChild(text);    
}


function print(id,msg){
  document.getElementById("console_"+id).appendChild(document.createTextNode(msg));   
}

function println(id,msg){
  document.getElementById("console_"+id).appendChild(document.createTextNode(msg+"\n"));   
}

function clear(id){
  while(document.getElementById("console_"+id).hasChildNodes()){
    document.getElementById("console_"+id).removeChild(document.getElementById("console_"+id).firstChild);
  } 
}