<?php


set_include_dir(dirname(__FILE__)."/../../Cursos/-");
$s=newObject("solicitud");
$d=date("d");
$m=date("m");
$y=date("Y");


$year=(!empty($_POST["year"]))?$_POST["year"]:strftime("%Y");

if (!empty($_POST["id_unidad"]))  {
	$curso=newObject("curso");
	$cursos=$curso->listAll("ID",false,"id_unidad=$id_unidad");
	if ($cursos) {
		$qc=implode(",",$cursos);
		$precond=" AND id_cur IN ($qc) ";
		
	}
	else
		$precond=" AND id_cur=0 ";
	
	$unidad=newObject("unidad",$id_unidad);		
	}
	
if (!empty($_POST["id_curso"])) {
	$precond.=" AND id_cur=$id_curso ";	
	$cursillo=newObject("curso",$id_curso);
	$unidad=newObject("unidad",$cursillo->id_unidad);
	
}

if (!empty($year)) {
	$anioi=mktime(0,0,1,1,1,$year);
	$anios=mktime(0,0,1,1,1,$year+1);
	$curso=newObject("curso");
	$cursos=$curso->listAll("ID",false,"fecha_inicio<$anios AND fecha_inicio>$anioi");
	if ($cursos) {
		$qc=implode(",",$cursos);
		$precond.=" AND id_cur IN ($qc) ";
	}
	else
		$precond.=" AND id_cur=0 ";
	
}
//$s->searchResults=$s->select("adjudicada='Si'",$offset,$sort);

$q_secob="(egb='Si' OR eso='Si'OR bachillere='Si' OR certesc='Si' )";
$q_sec="(bup='Si' OR eso='Si'OR bachillers='Si' OR fp1='Si' OR fp2='Si' OR fpmed='Si' OR cou='Si' OR preu='Si')";
$q_uni="(unimed='Si' OR unisup='Si')";
$q_sinalf="sinalf='Si'";

$corte=array(
	"sin-alfabetizar"=>$q_sinalf,
	"ens-sec-obl"=>"($q_secob AND NOT ($q_sec) AND NOT ($q_uni))",
	"ens-sec"=>"($q_sec AND NOT ($q_uni))",
	"universitario"=>$q_uni);
$opcnivel=array(
	"sin-alfabetizar"=>"Sin estudios",
	"ens-sec-obl"=>"Secundarios Obligatorios",
	"ens-sec"=>"Secundarios",
	"universitario"=>"Universitarios",
	"tot"=>"Total"
	);

//ANTIGUEDAD EN EL PARO
$date6m=time()-(30*6*(60*60*24));
$date1a=$date6m*2;
$date2a=$date1a*2;

$qparado=array(
	"menos1"=>"fechaalt_sol<'$date1a' AND perfil_sol <> 'Trabajador en activo'",
	"1-2"=>"fechaalt_sol>'$date1a' AND fechaalt_sol<'$date2a' AND perfil_sol <> 'Trabajador en activo'",
	"2mas"=>"fechaalt_sol>'$date2a' AND perfil_sol <> 'Trabajador en activo'");
	
$parado=array(
	"menos1"=>"Menos 1 años",
	"1-2"=>"Entre 1 y 2 años",
	"2mas"=>"2 o mas años"
	);


//EDAD
$d=date("d");
$m=date("m");
$y=date("Y");
$datex25=text_to_int_ext("$d/$m/".($y-25));
$datex45=text_to_int_ext("$d/$m/".($y-45));

$qedad=array(
	"25"=>"fecha_nac>=$datex25",
	"25-45"=>"fecha_nac<$datex25 AND fecha_nac>=$datex45",
	"45"=>"fecha_nac<$datex45"
	);
	
//SITUACION LABORAL
$qslaboral=array(
	"ocupados"=>"perfil_sol='Trabajador en activo'",
	"parados"=>"(perfil_sol='Desempleado mayor de 25 años' OR perfil_sol='Desempleado entre 25 y 30 años' OR perfil_sol='Desempleado mayor de 30 años')",
	"otros"=>"perfil_sol='nada'"
	);
	
$slaboral=array(
	"ocupados"=>"Ocupados",
	"parados"=>"Parados",
	"otros"=>"Otros"
	);
	
//SEXO
$qsexo=array(
	"Hombre"=>"sexo_sol='Hombre'",
	"Mujer"=>"sexo_sol='Mujer'"
	);

/* Condiciones */

foreach ($perfil_sol as $t=>$qperfil) {
	foreach ($corte as $i=>$qcorte) {
		foreach ($sexo as $j=>$qsexo) {
			foreach ($edad as $k=>$qedad) {
				$query="$base AND $qperfil AND $qcorte AND $qedad AND $qsexo";
				$s->searchResults=$s->select($query,$offset,$sort);
				$RES[$t][$i][$j][$k]=$s->nRes+0;
				$RES["$t$i$j$k"]=$s->nRes+0;
				$ck+=$s->nRes+0;
			}
			$RES["$t$i{$j}total"]=$ck;
			$RES[$t][$i][$j]["total"]=$ck;
			$cj+=$ck;
			$ck=0;
		}
		$RES["$t{$i}total"]=$cj;
		$RES[$t][$i]["total"]=$cj;
		$ct+=$cj;
		$cj=0;
	}
	
	$RES["${t}total"]=$ct;
	$RES[$t]["total"]=$ct;
	$cv+=$ct;
	$ct=0;
	$i="TOTAL";
	foreach($sexo as $j=>$qsexo) {
		foreach ($edad as $k=>$qedad)  {
		$query="$base AND $qperfil AND $qedad AND $qsexo";
				$s->searchResults=$s->select($query,$offset,$sort);
				$RES[$t][$i][$j][$k]=$s->nRes+0;
				$RES["$t$i$j$k"]=$s->nRes+0;
				$ck+=$s->nRes+0;
			}
			$RES["$t$i{$j}total"]=$ck;
			$RES[$t][$i][$j]["total"]=$ck;
			$cj+=$ck;
			$ck=0;
		}
		
}	
	
$u=newObject("void");
$wRes=new avSelect();
$u->EXPEDIENTE=$unidad->no_exp;
$u->NCURSO=$cursillo->no_exp;
$u->YEAR=$year;

$u->select_unidad=$wRes->avSelectPrint("id_unidad","Cursos","unidad","descrip_uni",$u->id_unidad);
$u->select_curso=$wRes->avSelectPrint("id_curso","Cursos","curso","nom_cur",$u->select_curso);
plantHTML($u,'cond_ana_de_ben');
plantHTML($RES,'ana_de_ben');

/******/
?>