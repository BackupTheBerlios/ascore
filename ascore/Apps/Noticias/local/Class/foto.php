<?php

function resizeImgW($imgname,$width)
{

 $img_src = ImageCreateFromjpeg ($imgname);

 $true_width = imagesx($img_src);
 $true_height = imagesy($img_src);

    $width;
    $height = ($width/$true_width)*$true_height;

 $img_des =  ImageCreateTruecolor($width,$height);
 imagecopyresampled($img_des, $img_src, 0, 0, 0, 0, $width, $height, $true_width, $true_height);
 return $img_des;
}

function resizeImgH($imgname,$height)
{

 $img_src = ImageCreateFromjpeg ($imgname);

 $true_width = imagesx($img_src);
 $true_height = imagesy($img_src);

    $width = ($height/$true_height)*$true_width;

 $img_des =  ImageCreateTruecolor($width,$height);
 imagecopyresampled($img_des, $img_src, 0, 0, 0, 0, $width, $height, $true_width, $true_height);
 return $img_des;
}
function imgSave($img,$dest) {

return imagejpeg($img,$dest,CALIDAD_JPG);

}

function jpegThumb($filename) {
		
	global $SYS;
	$thumb=$this->resizeImgW($filename,$SYS["thumbsize"]);
        if ($this->imgSave($thumb,ini_get("session.save_path")."/".basename($filename)))
		return ini_get("session.save_path")."/".basename($filename);
	else
		return false;


}


function createThumb($filename)
{
	
	if (mime_content_type($filename)=="image/jpeg")
		return $this->jpegThumb($filename);
	else	{
		debug(mime_content_type($filename),"white");
		return false;
	}

}


function save()
{
	$t=newObject("fileh");
	$t->familia_id=$this->familia_fileh_ID;
	$t->CaptureFile='foto';
	$this->id_foto=$t->save();
	
	$tfname=$this->createThumb($t->localname());
	$tt=newObject("fileh");
	$tt->familia_id=$this->familia_fileh_ID;
	$this->id_thumb=$tt->save($tfname);
		
	
	$par=typecast($this,"Ente");
	return $par->save();
}


?>