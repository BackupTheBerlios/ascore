<?php
set_include_dir(dirname(__FILE__)."/../../Cursos/-");


// Condiciones 
$base="adjudicada='Si'";

$s=newObject("solicitud");

$RES["solic"]=$s->nRes;
$sector=array(
	"agricultura"=>"sector='agr'",
	"industria"=>"sector='ind'",
	"construccion"=>"sector='con'",
	"servicios"=>"sector='ser'");


// BLOQUE EDAD 
$d=date("d");
$m=date("m");
$y=date("Y");
$datex25=text_to_int_ext("$d/$m/".($y-25));
$datex45=text_to_int_ext("$d/$m/".($y-45));

$edad=array(
	"25"=>"fecha_nac>=$datex25",
	"25-45"=>"fecha_nac<$datex25 AND fecha_nac>=$datex45",
	"45"=>"fecha_nac<$datex45"
	);

$sexo=array(
	"Hombre"=>"sexo_sol='Hombre'",
	"Mujer"=>"sexo_sol='Mujer'");	
	
foreach ($edad as $t=>$qedad) {
	foreach ($sexo as $i=>$qsexo) {
		$query="$base AND $qedad AND $qsexo";
		$s->searchResults=$s->select($query,$offset,$sort);
		$RES[$t][$i]=$s->nRes+0;
		$ct+=$RES[$t][$i];
		$RES["{$i}edadtotal"]+=$s->nRes+0;
		$RES["$t$i"]=$s->nRes+0;
		$ci+=$s->nRes+0;
	}
	
	$RES["{$t}total"]=$ct;
	$RES["edadttotal"]+=$ci;
	$ct=0;
	$ci=0;
}



// BLOQUE NIVEL DE ESTUDIOS 

$q_secob="(egb='Si' OR eso='Si'OR bachillere='Si' OR certesc='Si' )";
$q_sec="(bup='Si' OR eso='Si'OR bachillers='Si' OR fp1='Si' OR fp2='Si' OR fpmed='Si' OR cou='Si' OR preu='Si')";
$q_uni="(unimed='Si' OR unisup='Si')";
$q_sinalf="sinalf='Si'";

$corte=array(
	"sin-alfabetizar"=>$q_sinalf,
	"ens-sec-obl"=>"($q_secob AND NOT ($q_sec) AND NOT ($q_uni))",
	"ens-sec"=>"($q_sec AND NOT ($q_uni))",
	"universitario"=>$q_uni);


	
	
foreach ($corte as $t=>$qcorte) {
	foreach ($sexo as $i=>$qsexo) {
		$query="$base AND $qcorte AND $qsexo";
		$s->searchResults=$s->select($query,$offset,$sort);
		$RES[$t][$i]=$s->nRes+0;
		$ct+=$RES[$t][$i];
		$RES["{$i}estudiostotal"]+=$s->nRes+0;
		$RES["$t$i"]=$s->nRes+0;
		$ci+=$s->nRes+0;
	}
	
	$RES["{$t}total"]=$ct;
	$RES["estudiosttotal"]+=$ci;
	$ct=0;
	$ci=0;
}



//BLOQUE SITUACION LABORAL 

$slaboral=array(
	"ocupados"=>"perfil_sol='Trabajador en activo'",
	"parados"=>"(perfil_sol='Desempleado mayor de 25 años' OR perfil_sol='Desempleado entre 25 y 30 años' OR perfil_sol='Desempleado mayor de 30 años')",
	"otros"=>"perfil_sol='nada'");

foreach ($slaboral as $t=>$qslaboral) {
	foreach ($sexo as $i=>$qsexo) {
		$query="$base AND $qslaboral AND $qsexo";
		$s->searchResults=$s->select($query,$offset,$sort);
		$RES[$t][$i]=$s->nRes+0;
		$ct+=$RES[$t][$i];
		$RES["{$i}situaciontotal"]+=$s->nRes+0;
		$RES["$t$i"]=$s->nRes+0;
		$ci+=$s->nRes+0;
	}
	
	$RES["{$t}total"]=$ct;
	$RES["situacionttotal"]+=$ci;
	$ct=0;
	$ci=0;
}	

	

// BLOQUE ANTIGUEDAD EN EL PARO

$date6m=time()-(30*6*(60*60*24));
$date1a=$date6m*2;
$date2a=$date1a*2;

$parado=array(
	"menos1"=>"fechaalt_sol<'$date1a' AND perfil_sol <> 'Trabajador en activo'",
	"1-2"=>"fechaalt_sol>'$date1a' AND fechaalt_sol<'$date2a' AND perfil_sol <> 'Trabajador en activo'",
	"2mas"=>"fechaalt_sol>'$date2a' AND perfil_sol <> 'Trabajador en activo'");
	


foreach ($parado as $t=>$qparado) {
	foreach ($sexo as $i=>$qsexo) {
		$query="$base AND $qparado AND $qsexo";
		$s->searchResults=$s->select($query,$offset,$sort);
		$RES[$t][$i]=$s->nRes+0;
		$ct+=$RES[$t][$i];
		$RES["{$i}paradototal"]+=$s->nRes+0;
		$RES["$t$i"]=$s->nRes+0;
		$ci+=$s->nRes+0;
	}
	
	$RES["{$t}total"]=$ct;
	$RES["paradottotal"]+=$ci;
	$ct=0;
	$ci=0;
}	

plantHTML($RES,'ana_per_al');
HTML('footer');
?>