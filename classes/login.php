<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
    <title>login</title>
    <link href="front_stylesheet.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div class="header_line_0"></div>
    <span class="header_ol"><a href="projekte.php">projekte</a></span>
    <span class="header_or1"><a href="login.php">login</a></span>
    <span class="header_or_M">|</span>
    <span class="header_or2"><a href="userneu.php">registrieren</a></span>
    <br><br><br>
    <div class="header_line_1"></div>
    <br><br>
    <span class="error_font">

    <?php
      if (isset ($_REQUEST["remember"])) { 
        $rem_num = $_REQUEST["remember"]; 
        echo "Ihre Accountdaten wurden an Ihre Email Adresse geschickt";
      }else if (isset ($_REQUEST["acc_ok"])) {
        $acc_num = $_REQUEST["acc_ok"];
        if ($acc_num == 0){ 
          echo "Ihre Accountdaten wurden angelegt. Sehen Sie in Ihrem email Postfach nach um sich freizuschalten.";
          if ($acc_num == 1){ 
            echo "Ihr Account ist nun freigeschaltet. Hier können Sie sich einloggen.";
          }
        } else if (isset ($_REQUEST["fehler"])) {
          $err_num = $_REQUEST["fehler"];
          if ($err_num == 1) { 
            die("zugangsdaten waren ungültig");
          }
          if ($err_num == 2) { 
            echo "Zugriff verweigert. Bitte melden Sie sich an.";
          }
          if ($err_num == 3) { 
            echo "unbekannter fehler";
          }
        }
      }
    ?>
    </span><br>
    
    <div class="anmeld_form">
      <form action="login_.php" name="loginform">
        <table class="font_light_grey">
          <tbody>
            <tr>
            	<td>
            		<h5 class="font_grey">login</h5>
          		</td>
          	</tr>
            <tr>
              <td>
                <!-- Die Browsererkennung wird angestoßen und der Wert wird in ein unsichtbares Formular geschrieben
                --   der wert wird mit den anderen persönlichen Formulardaten an login_.php übergeben
                -->
                <input type="hidden" name="browser_type" value=""></input>
                <script src="./js/func.BrowserType.js" type="text/javascript"></script>
                <script>
                  var br_typ = "Browser was not detected";
                  br_typ = getBrowserType();
                  document.open();
                  document.loginform.browser_type.value = br_typ;
                  document.close();
                </script>
              </td>
            </tr>
            <tr><td style="padding-top: 10px; padding-bottom: 0px;">nickname oder email</td></tr>
            <tr><td><input size="30" maxlength="35" name="name_email" type="text"></td></tr>
            <tr><td style="padding-top: 10px; padding-bottom: 0px;">passwort</td></tr>
            <tr><td><input size="30" maxlength="35" name="password" type="password"></td></tr>
            <tr><td class="pw_erinnerung_button" style="padding-top: 5px;"><a href="passwort_zuschicken.php">passwort vergessen ?</a></td></tr>
            <tr><td><br></td></tr>
            <tr><td class="anmeld_button" style="padding-top: 10px; padding-bottom: 0px;">
            <span>
            <a href="javascript:document.getElementsByName('loginform')[0].submit()"><b>anmelden</b></a></span>
            </td></tr>
          </tbody>
        </table>
      </form>
    </div>
  </body>
</html>
