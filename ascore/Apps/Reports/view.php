<?php


require_once("Reports.php");

$ID=(isset($ID))?$ID:1;
$id_curso=(isset($id_curso))?$id_curso:1;
$u=newObject("report",$ID);
$u->id_curso=$id_curso;
if ($u->tipo=='HardCoded') {
	if ($print_mode!="yes") 
		$dummy=1;//plantHTML(array(),"f_menu");
	else {
		if (!ini_get("output_buffering"))
			ob_start();
		
		
	}	
	setLimitRows(5000);
	
	require_once("reports/{$u->url}.php");
	
	
	if ($print_mode!="yes") 
		$dummy=1;//HTML("footer");
	else { 
		$data=ob_get_contents();
		ob_clean();
		require_once("Lib/lib_PDF.php");
		
		if ($SYS["GLOBAL"]["spooler"]=="ASPooler") {
			$cdata=urlencode($data);
			jsAction("location.href='http://".$SYS["GLOBAL"]["ip_spooler"].":9090?$cdata'");
		}
		else
			PDF_html_2_pdf($data);
	}	
}

else 
{

	if ($print_mode!="yes") 
		$dummy=1;//plantHTML(array(),"f_menu");
	else {
		if (!ini_get("output_buffering"))
			ob_start();
		
		
	}	
	
	$q=newObject("queryb",$u->query_id);
	$q->searchResults=$bulk;
	$res=_query($q->queryb);
        $bulk=array();
        for ($i=0,$rows_affected=_affected_rows();$i<$rows_affected;$i++) {
            $rawres=_fetch_array($res);
            //$p=array_slice($rawres,1);
            $bulk[]=$rawres;
        }
	
	$magic_template='
	<!--HEAD-->
	<h3 align="center">'.$u->reportname.'</h3>
<table width="95%" cellspacing="0" border="1" cellpadding="1" align="center" bgcolor="#CECECE" style="border:solid 1px gray">
<tr>
	
	';
	
	foreach($bulk[0] as $row=>$data) {
		$row=explode("|",$row);
		
		$magic_template.="
		<th>${row[0]}</th>
		";
		unset($row[0]);
		$metadata[]=implode("|",$row);
	}
$magic_template.='		
</tr>
<!--SET-->
<tr>
';
	$j=0;
	foreach($bulk[0] as $row=>$data) {
		$type=explode(":",$metadata[$j]);
		
		if ($type[0]=="date") {
			$cell="<!-- A:$row -->";
		}
		else if ($type[0]=="datex") {
			$cell="<!-- R:$row -->";
		}
		else if ($type[0]=="money") {
			$cell="<!-- S:$row -->";
		}
		else if ($type[0]=="time") {
			$cell="<!-- T:$row -->";
		}
		else if ($type[0]=="ref") {
			
			$cell="<!-- T:$row -->";
		}
		else
			$cell="<!-- D:$row -->";
			
		$magic_template.="
		<td bgcolor=\"white\">$cell</td>
		";
		$j++;
	}
$magic_template.='		
</tr>
<!--END-->
</table>';
	
	$q->searchResults=$bulk;
	listList($q,array(),$magic_template);
	
	
	if ($print_mode!="yes") 
		$dummy=1;//HTML("footer");
	else { 
		$data=ob_get_contents();
		ob_clean();
		require_once("Lib/lib_PDF.php");
		
		PDF_html_2_pdf($data);
		echo $data;
	}	
	

}
?>