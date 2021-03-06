<?php

require_once("Bilo.php");

function BILO_uid() {

	global $SYS;
	if ($SYS["config"]["authentication"]===false) {
		debug(__FILE__." ".__LINE__.' Auth disabled by $SYS["config"]["authentication"]',"red");
		return 1;
	}
	
	if ((isset($_SESSION["__auth"]["username"]))&&(isset($_SESSION["__auth"]["uid"])))
		return $_SESSION["__auth"]["uid"];
	else
		return 1;
	
}
function BILO_isAdmin() {

	global $SYS;
	if ($SYS["config"]["authentication"]===false) {
		debug(__FILE__." ".__LINE__.' Auth disabled by $SYS["config"]["authentication"]',"red");
		return true;
	}
	
	if (BILO_checkGroup("Administradores"))
	 	return True;
	else
		return False;
	
}

function BILO_isOperator() {

	global $SYS;
	if ($SYS["config"]["authentication"]===false) {
		debug(__FILE__." ".__LINE__.' Auth disabled by $SYS["config"]["authentication"]',"red");
		return true;
	}
	
	if (BILO_checkGroup("Operadores"))
	 	return True;
	else
		return BILO_isAdmin();
	
}

function BILO_username() {

	return $_SESSION["__auth"]["username"];
	
	
}

function BILO_isLogged() {

	global $SYS;
	if ($SYS["config"]["authentication"]===false) {
		debug(__FILE__." ".__LINE__.' Auth disabled by $SYS["config"]["authentication"]',"red");
		return true;
	}
		
	if ((isset($_SESSION["__auth"]["username"]))&&(isset($_SESSION["__auth"]["uid"])))
		return true;
	else
		return false;
	
}

function BILO_login() {

	global $SYS;
	$user=newObject("user");
	
	if (Ente_user::checkPassword($_POST["username"],$_POST["password"])) {
		$reg=newObject("registro");
		if ($user->GetIdFromName($_POST["username"])) {
			if ($user->activo=='No') {
				$SYS["MESSAGES"].=_("Usuario no activo");
				return false;
				}
			$reg->user_id=$user->ID;
			$reg->dia=dateTodayStamp();
			if ($_POST["mov"]=="entrada") 
				$reg->entrada_m=time();
			else if ($_POST["mov"]=="salida") 
				$reg->salida_m=time();
			else
				$reg->entrada_m=time();
		    $reg->ip=CheckIP();
			if ($reg->save()) {
				$SYS["MESSAGES"].=_("Registro correcto");
				$_SESSION["__auth"]["username"]=$user->username;
				$_SESSION["__auth"]["uid"]=$user->ID;
				$pref=newObject("user_pref");
				$pref->getPrefByUser($user->ID);
				$pref->setPrefs();
				
				return true;
			}
	}
		else	
				$SYS["MESSAGES"].=_("Usuario desconocido");
		
	}
	
	return false;
	
}
function BILO_logout() {

	if (BILO_isLogged()) {
	
		$user=newObject("user",BILO_uid());
		$reg=newObject("registro");
		$reg->user_id=$user->ID;
		$reg->dia=dateTodayStamp();
		if ($_POST["mov"]=="entrada") 
			$reg->entrada_m=time();
		else if ($_POST["mov"]=="salida") 
			$reg->salida_m=time();
		else
			$reg->salida_m=time();
		
		if ($reg->save()) {
			echo _("Salida correcta");
			unset($_SESSION["__auth"]["username"]);
			unset($_SESSION["__auth"]["uid"]);
			session_unset();
			session_destroy();
			
			return true;
			}
		else	
			{
			echo _("Error");
			return false;
		}
		
	}
	echo _("No autentificado");
	return false;
	
}

function BILO_checkGroup($group) {
	
	global $SYS;
	if ($SYS["config"]["authentication"]===false) {
		debug(__FILE__." ".__LINE__.' Auth disabled by $SYS["config"]["authentication"]',"red");
		return true;
	}
	$user=newObject("user",BILO_uid());
	if ($user->inGroup($group))
		return True;
	else
		return False;
	
}

function BILO_void_login() {

	$user=newObject("user");
	$reg=newObject("registro");
	if ($user->GetIdFromName("anyone")) {
		$reg->user_id=$user->ID;
		$reg->dia=dateTodayStamp();
		if ($_POST["mov"]=="entrada") 
			$reg->entrada_m=time();
		else if ($_POST["mov"]=="salida") 
			$reg->salida_m=time();
		else
			$reg->entrada_m=time();
			
		if ($reg->save()) {
			$SYS["MESSAGES"].=_("Registro correcto");
			$_SESSION["__auth"]["username"]=$user->username;
			$_SESSION["__auth"]["uid"]=$user->ID;
		}
					
		}
	}

function CheckIP() {
	
	if (isset($_SERVER["REMOTE_ADDR"]))
		if (strpos($_SERVER["REMOTE_ADDR"],"10.")!==0)
			if (strpos($_SERVER["REMOTE_ADDR"],"172.16")!==0)
				if (strpos($_SERVER["REMOTE_ADDR"],"192.168")!==0)
					return $_SERVER["REMOTE_ADDR"];
	
	if (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
		if (strpos($_SERVER["HTTP_X_FORWARDED_FOR"],"10.")!==0)
			if (strpos($_SERVER["HTTP_X_FORWARDED_FOR"],"172.16")!==0)
				if (strpos($_SERVER["HTTP_X_FORWARDED_FOR"],"192.168")!==0)
					return $_SERVER["HTTP_X_FORWARDED_FOR"];
	
	
	return "".$_SERVER["REMOTE_ADDR"];
}

?>