<?php
set_include_dir(dirname(__FILE__)."/../../Cursos/-");
$a=newObject("agente");
$c=newObject("curso");
$RES["centros"]=$a->sumAge();
$horas=array(
	"<40"=>"horas < 40",
	"4090"=>"horas >40 AND horas < 90",
	"100350"=>"horas > 100 AND horas < 350",
	">350"=>"horas > 350");

foreach ($horas as $t=>$qhoras) {
			
	$RES["{$t}cc"]=$c->countCursos($qhoras);
	$RES["{$t}ca"]=$c->countAlumnos($qhoras);
	$RES["cctotal"]+=$RES["{$t}cc"];
	$RES["catotal"]+=$RES["{$t}ca"];
}

plantHTML($RES,'ana_dur_cur');
HTML('footer');
?>