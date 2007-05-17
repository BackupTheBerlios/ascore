toc<?php
set_include_dir(dirname(__FILE__)."/../../Cursos/-");
require_once("../Cuestionarios/Cuestionarios.php");
HTML('Informe_fpo/headerPDF_fpo');
echo "<blockquote class=\"gris\">";
//$id_curso=(isset($id_curso))?$id_curso:1;
if(empty($print_mode)){
$wRes=new AvSelect();
$u=newObject("alumno_curso");
$u->curso=$wRes->avSelectPrint("id_curso","Informes","curso","nom_cur",$u->id_curso);
$u->id_curso=isset($_POST["id_curso"])?$_POST["id_curso"]:1;
$id_curso=isset($id_curso)?$id_curso:$u->id_curso;
$u->id_informe=isset($_POST["ID"])?$_POST["ID"]:$ID;
plantHTML($u,"Informe_fpo/cond_cursoPDF_fpo");
}

if($id_curso>1)
{
	//Bloque de informaci�n de los alumnos del curso
	$u=newObject("alumno_curso");
	$v=newObject("solicitud");
	$egb="unimed='No' and fp1='No' and fpsup='No' and egb='Si' AND id_curso=$id_curso";
	$tit_sup="fpsup='Si'AND unimed='No' AND id_curso=$id_curso";
	$diplomados="unimed='Si' AND id_curso=$id_curso";
	$fpi="fp1='Si' AND unimed='No' AND id_curso=$id_curso";
	$u->no_alumnos=$u->CountAlumnos("id_sol","id_curso=$id_curso");
	if($u->no_alumnos==0)
		$u->no_alumnos=1;
	$u->mediaedad=$v->MediaAlumnos("edad_sol","id_curso=$id_curso");
	$u->egb=(($v->CountAlumnos("egb",$egb))*100)/$u->no_alumnos;
	$u->tit_sup=(($v->CountAlumnos("fpsup",$tit_sup))*100)/$u->no_alumnos;
	$u->diplomados=(($v->CountAlumnos("unimed",$diplomados))*100)/$u->no_alumnos;
	$u->fpi=(($v->CountAlumnos("fp1",$fpi))*100)/$u->no_alumnos;
	$u->curso=$u->get_ext("curso",$id_curso,"nom_cur");
	if($u->no_alumnos==1){
		$u->no_alumnos="Este curso no tiene ningun alumno asignado";
		plantHTML($u,'Informe_fpo/informePDF_fpo');
		$u->no_alumnos=1;
	}else{
		plantHTML($u,'Informe_fpo/informePDF_fpo');
	}
	//Bloque de informaci�n de los docentes que imparten clase en el curso
	$e=newObject("curso_experto");
	$m=newObject("modulo");
	
	$c=newObject("cuestionario29");
	$c69=newObject("cuestionario69");
	$e->searchResults=$e->selectUnique("id_curso=$id_curso",$offset,$sort);
	$d=array(
		"nom_experto"=>"xref#experto|id_experto|nombre",
		"ape_experto"=>"xref#experto|id_experto|apellidos");
	$e->num_cuest=0;
	$e->val_global=0;
	
	$e->val_curso=$c69->MediaModulo("val_global","id_curso=$id_curso")*10;
	$e->num_cuest=$c69->CountDatos("ID","id_curso=$id_curso");
	$u->no_modulos=$m->CountDatos("ID","id_cur=$id_curso and estado='Adjudicado'");
	//----------------------------------------------------------------
	//  echo "Numero de cuestionarios:".$e->num_cuest." --- Numero de alumnos:".$u->no_alumnos." --- Numero de modulos:".$u->no_modulos;
	//----------------------------------------------------------------
	
	$e->tasaresp=($e->num_cuest*100)/($u->no_alumnos*$u->no_modulos);
	$e->barom=$c69->Barometro($e->val_curso);
	//echo "n� cuestionarios=".$e->num_cuest." no_alumnos=".$u->no_alumnos;
	listList($e,$d,'Informe_fpo/expertosPDF_fpo');
	
	
	
	
	//Bloque de valoraci�n de los m�dulos 
	
	$vd=newObject("val_docente69");
	
	$m=newObject("modulo");
	$m->searchResults=$m->select("id_cur=$id_curso",$offset,$sort);
	//echo "contenido=".$vm->SumDatos("ID","id_curso=$id_curso ");
	HTML("Informe_fpo/intro_modulosPDF_fpo");
	foreach ($m->searchResults as $i)
	{
		$vm=newObject("val_modulo69");
		$vm->no_cuest=$vm->CountDatos("ID","id_curso=$id_curso and id_modulo={$i->ID}");
		$i->no_cuest=$c69->CountDatos("ID","id_curso=$id_curso and id_modulo={$i->ID}");
		$i->val_modulo=($c69->SumDatos("val_global","id_curso=$id_curso AND id_modulo={$i->ID}")*10)/$i->no_cuest;
		$i->obj=$vm->MediaModulo("objetivos","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->estr=$vm->MediaModulo("estructura","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->util=$vm->MediaModulo("utilidad","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->fomento=$vm->MediaModulo("fomento","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->resp=$vm->MediaModulo("respuesta","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->doc=$vm->MediaModulo("documentacion","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->adecuado=($vm->CountDatos("ID","duracion='Adecuado' AND id_curso=$id_curso and id_modulo={$i->ID}")*100)/$i->no_cuest;
		$i->corto=($vm->CountDatos("ID","duracion='Corto' AND id_curso=$id_curso and id_modulo={$i->ID}")*100)/$i->no_cuest;
		$i->largo=($vm->CountDatos("ID","duracion='Largo' AND id_curso=$id_curso and id_modulo={$i->ID}")*100)/$i->no_cuest;
		$i->cood=$vm->MediaModulo("coordinacion","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->lugar=$vm->MediaModulo("lugar_imp","id_curso=$id_curso and id_modulo={$i->ID}")*10;
		$i->contenido=(($i->obj+$i->estr+$i->util)/3);
		$i->metod=(($i->fomento+$i->resp+$i->doc)/3);
		$i->org=(($i->cood+$i->lugar)/2);
		$i->barom=$c69->Barometro($i->val_modulo);
		plantHTML($i,'Informe_fpo/modulosPDF_fpo');
	
	}
	
	
	
	//Bloque de valoracion de los docentes
	HTML('Informe_fpo/intro_expertosPDF_fpo');
	$vd=newObject("val_docente69");
	$vd->searchResults=$vd->selectUnique("id_curso=$id_curso");
	foreach($vd->searchResults as $i)
	{
		$i["nom_experto"]=$vd->get_ext("experto",$i["id_experto"],"nombre");
		$i["ape_experto"]=$vd->get_ext("experto",$i["id_experto"],"apellidos");
		$i["med_conocimiento"]=$vd->MediaExperto("conocimiento","id_curso=$id_curso AND id_experto={$i['id_experto']}")*10;
		$i["med_exposicion"]=$vd->MediaExperto("exposicion","id_curso=$id_curso AND id_experto={$i['id_experto']}")*10;
		$i["med_transmision"]=$vd->MediaExperto("trans_con","id_curso=$id_curso AND id_experto={$i['id_experto']}")*10;
		$i["med_integracion"]=$vd->MediaExperto("int_grupo","id_curso=$id_curso AND id_experto={$i['id_experto']}")*10;
		$i["med_val_global"]=($i["med_exposicion"]+$i["med_transmision"]+$i["med_integracion"])/3;
		$i["barom"]=$c69->Barometro($i["med_val_global"]);
		
		plantHTML($i,'Informe_fpo/val_expertosPDF_fpo');
	}
	//listList($vd,$d,'Informe_fpo/val_expertos');
	
}
echo "</blockquote>";
HTML('Informe_fpo/footerPDF_fpo');
?>
