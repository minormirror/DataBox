/*####################################################### Klasse Timelinescroll ###################################################*/

  //**********************  Attribute **************************
  //************************************************************
  
  var Divs = new Array();
  var Toggles = new Array();
  
  //**********************  Methoden ***************************
  //************************************************************

function slide(num, flag){
  obj = Divs[num];
  window.clearTimeout(obj.motion);
  var step=32;
  uobj = obj.getElementsByTagName('TABLE')[0];
  oht = obj.style.height;
  oht = oht.substring(0, oht.indexOf('px'));
  oht = parseInt(oht);
  uht = uobj.offsetHeight;
  if(flag>0){
    step*=(1-oht/uht);
    step = Math.ceil(step);
    while ((step-1) > (uht-oht))
      step--;
    oht+=step;
    obj.style.height= oht + 'px';
    uobj.style.top = oht-uht;
    if(oht!=uht)
      obj.motion = window.setTimeout("slide("+ num +","+ flag +")", 83);
    else
      window.clearTimeout(obj.motion);
  } else {
    step*=(oht/uht);
    step = Math.ceil(step);
    while (step-1 > oht)
      step--;
    oht-=step;
    obj.style.height= oht + 'px';
    uobj.style.top = oht-uht;
    if(oht!=0){
      obj.motion = window.setTimeout("slide("+ num +","+ flag +")", 83);
    } else {
      window.clearTimeout(obj.motion);
    }
  }
}

function init_timeline () {
  var j = 0;
  for (i=0; i<document.getElementsByTagName('DIV').length; i++ ) {
    if(document.getElementsByTagName('DIV')[i].className=="dyn"){
      Divs[j] = document.getElementsByTagName('DIV')[i];
      Divs[j].motion=false;
      Divs[j].style.height="0px";
      Table = Divs[j].getElementsByTagName('TABLE')[0];
      //Table.style.top = -1*(Table.offsetHeight+Table.offsetTop) + 'px';
      j++;
    }
  }
  j = 0;
  for (i=0; i<document.getElementsByTagName('A').length; i++ ) {
    if(document.getElementsByTagName('A')[i].className=="dyn"){
      Toggles[j] = document.getElementsByTagName('A')[i];
      Toggles[j].flag = 1;
      Toggles[j].j=j;
      Toggles[j].onclick = function () {
                             slide(this.j, this.flag);
                             this.flag*=-1;
                           }
      j++;
    }
  }
}
