<script type="text/javascript">


version_sav = new Image();
version_sav.src = "resources/buttons/32/version_sav_button.png";
version_sav_click = new Image();
version_sav_click.src = "resources/buttons/32/version_sav_button_click.png";

version_zurueck = new Image();
version_zurueck.src = "resources/buttons/32/version_zurueck_button.png";
version_zurueck_click = new Image();
version_zurueck_click.src = "resources/buttons/32/version_zurueck_button_click.png";

version_vor = new Image();
version_vor.src = "resources/buttons/32/version_vor_button.png";
version_vor_click = new Image();
version_vor_click.src = "resources/buttons/32/version_vor_button_click.png";

neues_div = new Image();
neues_div.src = "resources/buttons/32/neues_div_button.png";
neues_div_click = new Image();
neues_div_click.src = "resources/buttons/32/neues_div_button_click.png";


function Bildwechsel (Bildnr, Bildobjekt) {
  window.document.images[Bildnr].src = Bildobjekt.src;
}
</script>

  <div id="menu" class="mendiv_pos" >  
  <table align = "center" class="tabl_box" cellpadding="0px" cellspacing="0px">
    <tr>
      <td class="top_lo"></td>
      <td class="top_o"></td>    
      <td class="top_re"></td>
    </tr>
    <tr>
      <td class="mid_l"></td>
      <td class="mid">      
        <table align = "center" class="in_tabl_box" cellpadding="0px" cellspacing="0px">
        	<tr>
        	  <!-- /* hier beginnen die Menue Komponenten innerhalb des rahmens */ -->
         	  <td onmousedown="Bildwechsel(0, neues_div_click)" onmouseup="Bildwechsel(0, neues_div)" onmouseout="Bildwechsel(0, neues_div)" onclick="box_container.addTextBox()" align="center" valign="middle">         	  
        	    <IMG src="resources/buttons/32/neues_div_button.png" title="neuer beitrag"></td>        	
        	    
        	    
  	        <td onmousedown="Bildwechsel(1, version_sav_click)" onmouseup="Bildwechsel(1, version_sav)" onmouseout="Bildwechsel(1, version_sav)" align="center" valign="middle">
    	        <IMG src="resources/buttons/32/version_sav_button.png" title="version speichern" ></td>
    	        
    	        
            <td onmousedown="Bildwechsel(2, version_zurueck_click)" onmouseup="Bildwechsel(2, version_zurueck)" onmouseout="Bildwechsel(2, version_zurueck)" align="center" valign="middle">
              <IMG src="resources/buttons/32/version_zurueck_button.png" title="letzte version"></td>
              
              
        	  <td onmousedown="Bildwechsel(3, version_vor_click)" onmouseup="Bildwechsel(3, version_vor)" onmouseout="Bildwechsel(3, version_vor)" align="center" valign="middle">
    	        <IMG src="resources/buttons/32/version_vor_button.png" title="naechste version"></td>
    	        
    	        <td class="empty_button" align="center" valign="middle"></td>
          </tr>
      	  <tr>
      	    <td colspan="5">      	      
      	      <form action="select.htm">
                  <select class="version_list" name="versions" size="1">
                    <option>Heino</option>
                    <option>Michael Jackson</option>
                    <option>Tom Waits</option>
                    <option>Nina Hagen</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>
                    <option>Marianne Rosenberg</option>                                        
                                                            
                  </select>
              </form>
      	    </td>
      	  </tr>          
      	  <tr>
        	  <td colspan="5">
         	    <div class="navcard" id="mappings">
         	    <!--/* hier befindet sich die Navigations Map */ -->
              </div>                  
        	  </td>
    	    </tr> 
        </table>    
      </td>
      <td class="mid_r"></td>
  </tr>
  <tr>
    <td class="bot_lo"></td>
    <td class="bot"></td>
    <td class="bot_re"></td>
  </tr>
</table>
</div>
