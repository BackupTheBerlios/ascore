<?php
require_once("./../Cuestionarios/Cuestionarios.php");
//set_include_dir(dirname(__FILE__)."../../Cuestionarios/-");
HTML('Informe_des/headerPDF');
echo "<blockquote class=\"gris\">";
$id_curso=(isset($id_curso))?$id_curso:1;

//Bloque de información de los alumnos locales
$u=newObject("alumno_curso");
$v=newObject("solicitud");
$egb="unimed='No' and fp1='No' and fpsup='No' and egb='Si'";
$tit_sup="fpsup='Si'AND unimed='No'";
$diplomados="unimed='Si'";
$fpi="fp1='Si' AND unimed='No'";
$u->no_alumnos=$u->countAlumnos("id_sol");
$u->mediaedad=$v->MediaAlumnos("edad_sol");
$u->egb=(($v->CountAlumnos("egb",$egb))*100)/$u->no_alumnos;
$u->tit_sup=(($v->CountAlumnos("fpsup",$tit_sup))*100)/$u->no_alumnos;
$u->diplomados=(($v->CountAlumnos("unimed",$diplomados))*100)/$u->no_alumnos;
$u->fpi=(($v->CountAlumnos("fp1",$fpi))*100)/$u->no_alumnos;
plantHTML($u,'Informe_des/informePDF');



//Bloque de informacion de expertos locales y la valoracion global de los cursos
$e=newObject("experto");
$c69=newObject("cuestionario69");
$e->searchResults=$e->selectAll($offset,$sort);
$e->num_cuest=$e->countDatos("ID");
$e->val_curso=($c69->MediaModulo("val_global")*10);
$e->tasaresp=(($e->num_cuest*100)/$u->no_alumnos);
$e->barom=$c69->Barometro($e->val_curso);

listList($e,array(),'Informe_des/expertosPDF');


//Bloque de las valoraciones de los modulos
$m=newObject("modulo");
$sort="nom_modulo ASC";
$m->searchResults=$m->selectAll($offset,$sort);
$vm=newObject("val_modulo69");
foreach($m->searchResults as $i)
{
$vm->no_cuest=$vm->CountDatos("ID","id_modulo={$i->ID}");
if ($vm->no_cuest==0)
	$vm->no_cuest=1;
$i->no_cuest=$c69->CountDatos("ID","id_modulo={$i->ID}");
$i->obj=$vm->MediaModulo("objetivos","id_modulo={$i->ID}")*10;
$i->estr=$vm->MediaModulo("estructura","id_modulo={$i->ID}")*10;
$i->util=$vm->MediaModulo("utilidad","id_modulo={$i->ID}")*10;
$i->fomento=$vm->MediaModulo("fomento","id_modulo={$i->ID}")*10;
$i->resp=$vm->MediaModulo("respuesta","id_modulo={$i->ID}")*10;
$i->doc=$vm->MediaModulo("documentacion","id_modulo={$i->ID}")*10;
$i->adecuado=($vm->CountDatos("ID","duracion='Adecuado' AND id_modulo={$i->ID}")*100)/$vm->no_cuest;
$i->corto=($vm->CountDatos("ID","duracion='Corto' AND id_modulo={$i->ID}")*100)/$vm->no_cuest;
$i->largo=($vm->CountDatos("ID","duracion='Largo' AND id_modulo={$i->ID}")*100)/$vm->no_cuest;
$i->cood=$vm->MediaModulo("coordinacion","id_modulo={$i->ID}")*10;
$i->lugar=$vm->MediaModulo("lugar_imp","id_modulo={$i->ID}")*10;

$i->contenido=(($i->obj+$i->estr+$i->util)/3);
$i->metod=(($i->fomento+$i->resp+$i->doc)/3);
$i->org=(($i->cood+$i->lugar)/2);

$i->val_modulo=$c69->MediaModulo("val_global","id_modulo={$i->ID}")*10;
$i->barom=$c69->barometro($i->val_modulo);
plantHTML($i,'Informe_des/modulosPDF');
}


//Bloque de las valoraciones de los docentes
HTML('Informe_des/intro_expertosPDF');
$vd=newObject("val_docente69");
foreach($e->searchResults as $i)
{
	
	$i->med_conocimiento=$vd->MediaExperto("conocimiento","id_experto={$i->ID}")*10;
	$i->med_exposicion=$vd->MediaExperto("exposicion","id_experto={$i->ID}")*10;
	$i->med_transmision=$vd->MediaExperto("trans_con","id_experto={$i->ID}")*10;
	$i->med_integracion=$vd->MediaExperto("int_grupo","id_experto={$i->ID}")*10;
	$i->med_val_global=($i->med_exposicion+$i->med_transmision +$i->med_integracion)/3;
	$i->barom=$c69->Barometro($i->med_val_global);
	
	plantHTML($i,'Informe_des/val_expertosPDF');
}

echo "</blockquote>";
HTML('Informe_des/footerPDF');

?>