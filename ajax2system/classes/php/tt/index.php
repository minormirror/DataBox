<html><head><title>DataBox</title>



<script src="jojs/rpc.js" type="text/javascript"></script>


<script type="text/javascript">

var service = new rpc.ServiceProxy("/data_box/ajax2system/classes/php/tt/server.php", {asynchronous:false});

document.open();
document.write("hello"+service.getTemp());
document.close();

try {
   var sum = service.getTemp(13);
   alert("The sum is: " + sum);
}
catch(e){
   alert("Unable to add numbers because: " + e);
}
</script>

