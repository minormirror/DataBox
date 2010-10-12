/*####################################################### Klasse IBDummyElement ###################################################*/

function IBDummyElement(){

  //**********************  Attribute **************************
  //************************************************************
  
  this.div_element;
  
  //**********************  Methoden ***************************
  //************************************************************

  this.show = function(x,y,width,height){
    this.div_element.style.display = "block";
	this.div_element.style.border = "1px solid";
	this.div_element.style.left = x;
	this.div_element.style.top = y;
	this.div_element.style.width = width+"px";
    this.div_element.style.height = height+"px";
  }

  this.hide = function(){
    this.div_element.style.display = "none";
  }


  //**********************  Konstruktor ************************
  //************************************************************    
 
  this.div_element = document.createElement("div");
  this.div_element.style.backgroundColor = "#fafafa";
  this.div_element.style.width = "10px";
  this.div_element.style.height = "10px";
  this.div_element.style.position="absolute";
  this.div_element.style.display = "none";
  
}

