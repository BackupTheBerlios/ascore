<?php

$dir=$SYS["DOCROOT"].$SYS["DATADEFPATH"];
$file=$dir.$class.".def";


if (isset($Grabar)) {

	$h=fopen($file,"w");
	fwrite($h,stripslashes($data));
	fclose($h);
	chmod($file,0775);

}

if (file_exists($file))
{
	$buffer=file($file);
	$dat=implode("",$buffer);
	$data=stripslashes($dat);
}
else {
echo '<h2 align="center">Nuevo fichero</h2><br><br>';
$data='
<?xml version="1.0" encoding="ISO-8859-15"?>
<cpd>
</cpd>
';
}
echo '<h3 align="center">'."$class".'</h3>';
?>

<form action="?name=Formacion&op=dev&command=edit_class" method="POST" enctype="multipart/form-data">
<div align="center"><textarea name="data" cols="80" rows="25">
<?php echo $data?>
</textarea>  </div>
<input type="hidden" name="class" value="<?php echo $class?>">
<div align="center"><br>
<input type="submit" name="Grabar" value="Grabar"></div>
</form>
<br>
 <div align="center">[ <a href="?">Volver</a>]</div>
