<?php
ini_set("max_execution_time","500");
require_once("System.php");

$TrazaStatus=true;
require_once("Lib/lib_chart.php");
if (ini_get("output_buffering"))
	 ob_end_flush();

$a=newObject("void");
$a->deletes("1=1");
unset($a);

$M=1000;
$N=$M/25;
echo "<span style='margin-left:20px'>Test '$M Clases' ";
if (function_exists("memory_get_usage"))
	$graph=true;
else {
	function memory_get_usage() {return 1048576;}
}

$bm=getmicrotime();
$OBJECT_TIME=$bm;
for ($i=0;$i<=$M;$i+=$N) {
	
	for ($j=0;$j<$i;$j++) 
		$a[]=newObject("void");
	
	$p=round($i/$M*100);
	if (($p!=$oldp)&&(($p%10)==0)) {
		jsAction("setProgress('$p');");
		flush();
	
	}
	$memory[$p]=memory_get_usage()/1024;
	$time_ellapsed[$p]=(getmicrotime()-$bm);
	$bm=getmicrotime();
	unset($a);
	$oldp=$p;
}
$OBJECT_TIME=$bm-$OBJECT_TIME;
jsAction("setProgress('0');");
echo "<span style='color:green'>OK</span> ::";

/* Memory Usage */
$g=new graph(500,400);
$g->y_data["barras"]=array_values($memory);
$g->y_data["lineas"]=array_values($memory);
$g->x_data=array_keys($memory);

$g->parameter["file_name"]=$SYS["BASE"]."/Data/Img/Tmp/memory_usage";
$g->parameter["path_to_fonts"]=$SYS["DOCROOT"]."/Data/Fonts/";
$g->parameter['title'] = _("Uso de memoria");
$g->parameter['x_label'] = _("Objetos creados (x".($M/100).")");
$g->parameter['y_label_left'] = _("Consumo memoria (KB)");
$g->y_format['barras'] =
  array('colour' => 'green', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');
$g->y_format['lineas'] =
  array('colour' => 'black', 'line' => 'line', 'point' => 'square-open');
$g->y_order = array('barras','lineas');
$g->parameter['y_resolution_left']= 1;
$g->parameter['y_decimal_left']= 0;

$g->draw();

/* Time ellapsed test */
$t=new graph(500,400);
$t->y_data["barras"]=array_values($time_ellapsed);
$t->y_data["lineas"]=array_values($time_ellapsed);
$t->x_data=array_keys($time_ellapsed);
$t->parameter["file_name"]=$SYS["BASE"]."/Data/Img/Tmp/time_ellapsed";
$t->parameter["path_to_fonts"]=$SYS["DOCROOT"]."/Data/Fonts/";
$t->parameter['title'] = _("newObject() (".number_format($OBJECT_TIME,5)." )");
$t->parameter['x_label'] = _("Objetos creados (x".($M/100).")");
$t->parameter['y_label_left'] = _("Tiempo de creacion (milisegundos)");
$t->y_format['barras'] =
  array('colour' => 'green', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');
$t->y_format['lineas'] =
  array('colour' => 'black', 'line' => 'line', 'point' => 'square-open');
$t->y_order = array('barras','lineas');
$t->parameter["y_decimal_left"]=5;
$t->parameter['y_resolution_left']= 5;


$t->draw();

/* Data Base Perfomance Test */

echo "Test '$M^ Saves' ";
$a=newObject("void");
$bm=getmicrotime();
$DB_TIME=$bm;
for ($i=0;$i<=$M;$i+=$N) {
	
	for ($j=0;$j<$i;$j++) {
		$a->ID=1;
		$a->save();
	}
	$p=round($i/$M*100);

	if (($p!=$oldp)&&(($p%10)==0)) {
		jsAction("setProgress('$p');");
		flush();
		
	}
	$db_tgime_ellapsed[$p]=(getmicrotime()-$bm);
	$bm=getmicrotime();
	$oldp=$p;
}
$DB_TIME=$bm-$DB_TIME;
jsAction("setProgress('0');");
echo "<span style='color:green'>OK</span> ::";


$db_tg=new graph(500,400);
$db_tg->y_data["barras"]=array_values($db_tgime_ellapsed);
$db_tg->y_data["lineas"]=array_values($db_tgime_ellapsed);
$db_tg->x_data=array_keys($db_tgime_ellapsed);
$db_tg->parameter["file_name"]=$SYS["BASE"]."/Data/Img/Tmp/database";
$db_tg->parameter["path_to_fonts"]=$SYS["DOCROOT"]."/Data/Fonts/";
$db_tg->parameter['title'] = _("root->save() (".number_format($DB_TIME,5).")");
$db_tg->parameter['x_label'] = _("Objetos guardados (x".($M/100).")");
$db_tg->parameter['y_label_left'] = _("Tiempo (milisegundos)");
$db_tg->y_format['barras'] =
  array('colour' => 'green', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');
$db_tg->y_format['lineas'] =
  array('colour' => 'black', 'line' => 'line', 'point' => 'square-open');
$db_tg->y_order = array('barras','lineas');
$db_tg->parameter["y_decimal_left"]=5;
$db_tg->parameter['y_resolution_left']= 5;
$db_tg->draw();


echo "Test '$M^ List' ";


$bm=getmicrotime();
$LIST_TIME=$bm;
$MINIT=memory_get_usage()/(1024*1024);

$a=newObject("void");
$a->searchResults=$a->selectA();	
$list_time_ellapsed["selectA"]=(getmicrotime()-$bm);
$memories["selectA"]=(memory_get_usage()/(1024*1024))-$MINIT;
jsAction("setProgress('100');");
flush();

unset($a->searchResults);
unset($a);
  
$a=newObject("void");
setLimitRows(6500);
$a->searchResults=$a->selectAll();	
$list_time_ellapsed["selectAll"]=(getmicrotime()-$bm);
$memories["selectAll"]=(memory_get_usage()/(1024*1024))-$MINIT;
jsAction("setProgress('50');");
flush();

$bm=getmicrotime();
$LIST_TIME=$bm-$LIST_TIME;

jsAction("setProgress('0');");
echo "<span style='color:green'>OK</span> ::";
$a->deletes("1=1");

$db_tg=new graph(500,400);
$db_tg->y_data["barras"]=array_values($list_time_ellapsed);
$db_tg->y_data["mbarras"]=array_values($memories);
$db_tg->x_data=array_keys($list_time_ellapsed);
$db_tg->parameter["file_name"]=$SYS["BASE"]."/Data/Img/Tmp/select";
$db_tg->parameter["path_to_fonts"]=$SYS["DOCROOT"]."/Data/Fonts/";
$db_tg->parameter['title'] = _("selectAll vs. SelectA ( ".number_format($LIST_TIME,5)." )");
$db_tg->parameter['x_label'] = _("Tipo select");
$db_tg->parameter['y_label_left'] = _("Tiempo/Memoria)");
$db_tg->y_format['barras'] =
  array('colour' => 'green', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');
$db_tg->y_format['mbarras'] =
  array('colour' => 'red', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');

$db_tg->y_order = array('barras','mbarras');
$db_tg->parameter["y_decimal_left"]=5;
$db_tg->parameter['y_resolution_left']= 5;
$db_tg->draw();


/* render test     */
for ($k=0;$k<$M;$k++) {
	$a->ID=0;
	$a->save();
}
$M=100;
$tmpl=$a->makeTemplate("fake");
$abm=getmicrotime();
if ($SYS["bcompiler_extension"]) {
	require_once("Lib/lib_list_ng.php.phb");
	$example=new DataGrid();
	for ($i=1;$i<=$M;$i+=($M/3)) {
		$bm=getmicrotime();
		setLimitRows(round($i));
		$a->searchResults=$a->selectAll();
		ob_start();
		$example->listList($a,array(),$tmpl);
		ob_end_clean();
		$plist_time_ellapsed[$i]=getmicrotime()-$bm;
	}
}
for ($i=1;$i<=$M;$i+=($M/12)) {
	$bm=getmicrotime();
	setLimitRows(round($i));
 	$a->searchResults=$a->selectAll();
	ob_start();
	listList($a,array(),$tmpl);
	ob_end_clean();
	$cplist_time_ellapsed[$i]=getmicrotime()-$bm;
}
unset($a->searchResults);
for ($i=1;$i<=$M;$i+=($M/12)) {
	$bm=getmicrotime();
	setLimitRows(round($i));
 	$a->searchResults=$a->selectAll();
	ob_start();
	listList($a,array(),$tmpl,"",1,"plParseTemplateFast");
	ob_end_clean();
	$fplist_time_ellapsed[$i]=getmicrotime()-$bm;
	$afplist_time_ellapsed[$i]=0;
}


$totaltime=getmicrotime()-$abm;
$a->deletes("1=1");
$db_tg=new graph(500,400);
if ($SYS["bcompiler_extension"])
	$db_tg->y_data["barras"]=array_values($plist_time_ellapsed);
$db_tg->y_data["mbarras"]=array_values($cplist_time_ellapsed);
$db_tg->y_data["fbarras"]=array_values($fplist_time_ellapsed);
$db_tg->x_data=array_keys($cplist_time_ellapsed);

$db_tg->parameter["file_name"]=$SYS["BASE"]."/Data/Img/Tmp/render";
$db_tg->parameter["path_to_fonts"]=$SYS["DOCROOT"]."/Data/Fonts/";
if ($SYS["bcompiler_extension"])
	$db_tg->parameter['title'] = _("lib_planty Compiled  vs Source")."($totaltime)";
else
	$db_tg->parameter['title'] = _("lib_planty vs lib_plantyFast")."($totaltime)";

$db_tg->parameter['x_label'] = _("Number of rows");
$db_tg->parameter['y_label_left'] = _("Render time");


if ($SYS["bcompiler_extension"]) 
	$db_tg->y_format['barras'] =array('colour' => 'green', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');

$db_tg->y_format['mbarras'] = array('colour' => 'red', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');
$db_tg->y_format['fbarras'] = array('colour' => 'blue', 'line' => 'line', 'point' => 'square-open','bar' => 'fill');


if ($SYS["bcompiler_extension"])
		$db_tg->y_order = array('barras',"mbarras","fbarras");
	else
		$db_tg->y_order = array('mbarras',"fbarras");

$db_tg->parameter["y_decimal_left"]=5;
$db_tg->parameter['y_resolution_left']= 5;
$db_tg->draw();

/* end of render test */
$img_tabs=array(
	"memory_usage"=>$SYS["ROOT"].'/Data/Img/Tmp/memory_usage.png',
	"time_ellapsed"=>$SYS["ROOT"].'/Data/Img/Tmp/time_ellapsed.png',
	"database"=>$SYS["ROOT"].'/Data/Img/Tmp/database.png',
	"select"=>$SYS["ROOT"].'/Data/Img/Tmp/select.png',
	"render"=>$SYS["ROOT"].'/Data/Img/Tmp/render.png',
	"OBJECT_TIME"=>$OBJECT_TIME,
	"DB_TIME"=>$DB_TIME

);
plantHTML($img_tabs,"test_tabs");
HTML("footer");	
?>
