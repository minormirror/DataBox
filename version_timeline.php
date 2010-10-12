<script type="text/javascript">

vers_norm = new Image();
vers_norm.src = "resources/buttons/24/kreis_line_24.png";
vers_akt_click = new Image();
vers_akt_click.src = "resources/buttons/24/kreis_line_aktiv_24.png";
vers_over = new Image();
vers_over.src = "resources/buttons/24/kreis_line_over_24.png";

sub_standard = new Image();
sub_standard.src = "resources/buttons/24/sub_standard.png";
sub_over = new Image();
sub_over.src = "resources/buttons/24/sub_over.png";
sub_aktiv = new Image();
sub_aktiv.src = "resources/buttons/24/sub_aktiv.png";

dropdown = new Image();
dropdown.src = "resources/buttons/dropdown_18.png";
dropup = new Image();
dropup.src = "resources/buttons/dropup_18.png";

function Bildwechsel (Bildnr, Bildobjekt) {
  window.document.images[Bildnr].src = Bildobjekt.src;
}

var aktive=0;

function Clickwechsel (Bildnr, Bildobjekt) {
  if (aktive==0){
    window.document.images[Bildnr].src = Bildobjekt.src;

  }else
  {
    window.document.images[Bildnr].src = dropdown.src;
    setVersionActive();
  }
  if (aktive==0) {
    aktive=1;
  }
  else{
    aktive=0;
  }
}


function setVersionActive () {

}

</script>

  <div class="pos_version_div">  
    <a href="javascript:void(0)" class="dyn" onmousedown="Clickwechsel(4, dropup)" align="center" valign="middle">
      <img src="resources/buttons/dropdown_18.png" class="noframe"></img>
    </a>
  </div>
  
  <div style="height: 0px;" class="dyn">
    <table style="top: -353px;" border="0" cellspacing="0" cellpadding="0">
      <tbody><tr> 
                  <tr> 	  
                    <td align="center" valign="middle" colspan="6" height="30px"></td>
                  </tr> 	   
                  <tr>
                    <td align="center" valign="middle">      	  
                      <img src="resources/buttons/24/kreis_anf.png">
                    </td>
                 	  <td onmousedown="Bildwechsel(6, vers_akt_click)" onmouseup="Bildwechsel(6, vers_norm)" onmouseout="Bildwechsel(6, vers_norm)" onmouseover="Bildwechsel(6, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                   	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>

                 	  <td onmousedown="Bildwechsel(7, vers_akt_click)" onmouseup="Bildwechsel(7, vers_norm)" onmouseout="Bildwechsel(7, vers_norm)" onmouseover="Bildwechsel(7, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                   	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>
                 	  <td onmousedown="Bildwechsel(8, vers_akt_click)" onmouseup="Bildwechsel(8, vers_norm)" onmouseout="Bildwechsel(8, vers_norm)" onmouseover="Bildwechsel(8, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>
               	    
               	    <td align="center" valign="middle">      	  
                 	    <img src="resources/buttons/24/zwischenstueck.png">
                 	  </td>
                 	                 	    
                 	  <td onmousedown="Bildwechsel(10, vers_akt_click)" onmouseup="Bildwechsel(10, vers_norm)" onmouseout="Bildwechsel(10, vers_norm)" onmouseover="Bildwechsel(10, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>           
               	    
                 	  <td onmousedown="Bildwechsel(11, vers_akt_click)" onmouseup="Bildwechsel(11, vers_norm)" onmouseout="Bildwechsel(11, vers_norm)" onmouseover="Bildwechsel(11, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>
               	    
               	    <td align="center" valign="middle">      	  
                 	    <img src="resources/buttons/24/zwischenstueck.png">
                 	  </td>

               	    <td align="center" valign="middle">      	  
                 	    <img src="resources/buttons/24/zwischenstueck.png">
                 	  </td>
                 	  
               	    
               	    
                 	  <td onmousedown="Bildwechsel(14, vers_akt_click)" onmouseup="Bildwechsel(14, vers_norm)" onmouseout="Bildwechsel(14, vers_norm)" onmouseover="Bildwechsel(14, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>
                 	  <td onmousedown="Bildwechsel(15, vers_akt_click)" onmouseup="Bildwechsel(15, vers_norm)" onmouseout="Bildwechsel(15, vers_norm)" onmouseover="Bildwechsel(15, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>
               	    
                 	  <td onmousedown="Bildwechsel(16, sub_aktiv)" onmouseup="Bildwechsel(16, sub_standard)" onmouseout="Bildwechsel(16, sub_standard)" onmouseover="Bildwechsel(16, sub_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/sub_standard.png">
               	    </td>

                 	  <td onmousedown="Bildwechsel(17, sub_aktiv)" onmouseup="Bildwechsel(17, sub_standard)" onmouseout="Bildwechsel(17, sub_standard)" onmouseover="Bildwechsel(17, sub_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/sub_standard.png">
               	    </td>


                 	  <td onmousedown="Bildwechsel(18, sub_aktiv)" onmouseup="Bildwechsel(18, sub_standard)" onmouseout="Bildwechsel(18, sub_standard)" onmouseover="Bildwechsel(18, sub_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/sub_standard.png">
               	    </td>

                 	  <td onmousedown="Bildwechsel(19, vers_akt_click)" onmouseup="Bildwechsel(19, vers_norm)" onmouseout="Bildwechsel(19, vers_norm)" onmouseover="Bildwechsel(19, vers_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/kreis_line_24.png">
               	    </td>               	    

               	    <td align="center" valign="middle">      	  
                 	    <img src="resources/buttons/24/zwischenstueck.png">
                 	  </td>
                 	  
                 	  <td onmousedown="Bildwechsel(21, sub_aktiv)" onmouseup="Bildwechsel(21, sub_standard)" onmouseout="Bildwechsel(21, sub_standard)" onmouseover="Bildwechsel(21, sub_over)" onclick="setVersionActive()" align="center" valign="middle">         	  
                 	    <img src="resources/buttons/24/sub_standard.png">
               	    </td>
               	    
                    <td align="center" valign="middle">      	  
                 	    <img src="resources/buttons/24/kreis_end.png">
                 	  </td>              	                 	          
                </tr>
    </tbody></table>
</div>



