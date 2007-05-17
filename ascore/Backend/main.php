<?php

/*********************** 
Extended URI featuring

MODULE
APP
ACTION
************************/


require_once("coreg2.php");	
set_include_dir(dirname(__FILE__)."/local/Tmpl/-");

require_once("Bilo/API_exports.php");
set_include_dir(dirname(__FILE__)."/Bilo/-");
require_once("Lib/lib_session.php");

setLimitRows(20);
$up=newobject("user_pref");
$up->getPrefByUser(BILO_uid());
$up->setPrefs();

if ((!$isLoginScreen)&&(!$SYS["GLOBAL"]["void_login"])) {
		if (BILO_isLogged()==false) {
			PlantHTML(array("location"=>$SYS["ROOT"]."/Login/login.php"),"opener");
			die();
		}
		else if ((BILO_isOperator())||(BILO_isAdmin())) {
			echo '';	
		}
		else {
			PlantHTML(array("location"=>$SYS["ROOT"]."/Login/login.php"),"opener");
			die();
		}

	}

$EURI=explode("/",$petition);

/* 

Creación de menús dinámico

*/

if (is_file(dirname(__FILE__)."/../Apps/$APP/$ACTION")) {
	if (strpos($ACTION,"action_")===0)
		include(dirname(__FILE__)."/../Apps/$APP/$ACTION");
	else if (($SYS["GLOBAL"]["DEV_MODE"])&&(strpos($ACTION,"dev.php"))) {
		die("dev");
		include(dirname(__FILE__)."/../Apps/$APP/$ACTION");
	
	}
	else {
		plantHTML(array("PATH"=>$SYS["ROOT"]),"f_menu");
		include(dirname(__FILE__)."/../Apps/$APP/$ACTION");
		plantHTML(array("PATH"=>$SYS["ROOT"]),"footer");
	}
}
else if (empty($APP)){
	$metadata=array("page"=>"empty.php");
	/* Build menu entry systen */
	foreach($SYS["APPS"] as $v=>$k) {
		if (!is_file($SYS["BASE"]."/Apps/".$k."/admin_menu_entry.php"))
			continue;
		require($SYS["BASE"]."/Apps/".$k."/admin_menu_entry.php");
		if ($menu_entry["active"]) {
			$metadata["menu_entrys"].='
			<td class="tmenuitem" onclick="flip(\'menuEntry'.$v.'_box\')" >
			
				'.$menu_entry["label"].'&nbsp;&nbsp;&nbsp;<br>
				<div id="menuEntry'.$v.'" style="position : absolute;z-index:10"></div>
				
			
			</td>
			';
			$metadata["menu_entrys_items"].='
				<div id="menuEntry'.$v.'_box" class="thook"  style="display : none; position : absolute; z-index : 1;" onclick="flip(\'none\')">';
			foreach($menu_entry["items"] as $j)
				$metadata["menu_entrys_items"].='
				<A href="'.$j[0].'" target="'.$j[1].'" class="tlink">&nbsp; '.$j[2].'</A><br>';
				
			$metadata["menu_entrys_items"].='</div>';
			
			$TMI++;	
		}
	}
	$metadata["total_menu_items"]=$TMI;
	set_include_dir(dirname(__FILE__)."/local/Tmpl/-");
	plantHTML($metadata,"mainview");
 }
 else {
 	echo "Not found $petition";
	header("HTTP/1.0 404 Not Found");
 }
 
/*
echo '<div style="padding:10px;border:1px solid gray">';
dataDump($SYS);
echo "<hr>";
dataDump($_SESSION);
echo '</div>';
*/


?>