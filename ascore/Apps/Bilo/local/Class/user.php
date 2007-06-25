<?php

/* Extensión de la clase inventarios_muestrarios */

function donothing() {
	return True;

}

function save() {

 	debug("Info: Calling Extended save");
	unset($this->properties["fullname"]);
	if ($this->password==md5("")) {
		$this->ERROR=_("password vacio");
		return FALSE;
	}
  	if (($this->userExist($this->username))&&($this->ID<2)) {
		$this->ERROR=_("Usuario existente");
		return FALSE;
	}
	//dataDump($this);
	$par=new Ente($this->name);
	$par=typecast($this,"Ente");
	//dataDump($par);
	return $par->save();

}

function listGroups() {

	$g=newObject("group");
	setLimitRows(32);
	$a=($g->select("(code&{$this->grupos}=code) AND active='Si'"));
	resetLimitRows();
	
	return $a;

}

function listGroupsNames() {

	$g=newObject("group");
	setLimitRows(32);
	$a=($g->select("(code&{$this->grupos}=code) AND active='Si'"));
	resetLimitRows();
	foreach ($a as $k=>$v)
		$res[]=$v->groupname;
	
	return implode(",",$res);

}

function listGroupsIndex() {

	$g=newObject("group");
	setLimitRows(32);
	$a=($g->select("(code&{$this->grupos}=code) AND active='Si'"));
	resetLimitRows();
	foreach ($a as $k=>$v)
		$res[$v->ID]=$v->groupname;
	
	return $res;

}


function listGroupsCodes() {

	$g=newObject("group");
	setLimitRows(32);
	$a=($g->select("(code&{$this->grupos}=code) AND active='Si'"));
	resetLimitRows();
	foreach ($a as $k=>$v)
		$res[$v->ID]=$v->code;
	
	return $res;

}

function getUserByName($codename='username') {

	$res=$this->select("username='$codename'");
	$data=current($res);
	$this->setAll($data->properties);

}

function setGroupCode($arr_code) {

	$code=0;
	foreach ($arr_code as $k=>$v) {
		$g=newObject("group",$v);
		$code=$code|$g->code;
		debug($g->code,"red");
	}
	return $code;

}

function checkPassword($user='',$password='') {

	global $AUTH;
	
	$u=newObject("user");
	$res=$u->select("username='$user'");
	if ($u->nRes>0) {
		$user=current($res);
		if ($user->password==md5($password))
			return True;
		else
			$AUTH["error"]=_("Contraseña errónea");
	}
	else
		$AUTH["error"]=_("usuario desconocido");
	
	return False;
			

}

function GetIdFromName($name='') {
	
	
	
	$u=newObject("user");
	$res=$u->select("username='$name'");
	if ($u->nRes>0) {
		$user=current($res);
		$this->setAll($user->properties);
		return True;;
	}
	else
		return False;
	
}

function inGroup($name='') {

	$g=newObject("group");
	setLimitRows(32);
	$a=($g->select("(code&{$this->grupos}=code) AND active='Si' and groupname='$name'"));
	resetLimitRows();
	if (sizeof($a)>0)
		return True;
	else
		return False;
	
}

function selectUser($q,$offset=0,$sort="ID") {

        global $prefix,$SYS;

        $All=array();
        if ((empty($sort)))
            $sort="ID";
        if ((empty($offset))||($offset<0))
            $offset=0;

        $q="SELECT SQL_CALC_FOUND_ROWS *,CONCAT(nombre,' ',apellidos) as fullname from {$prefix}_".$this->name." WHERE $q AND ID>1";
        $q.=" ORDER BY $sort LIMIT $offset,".$SYS["DEFAULTROWS"];


        $bdres=_query($q);
        /*$rawres=fetch_array($bdres);
        $this->ID=$rawres["ID"];
        $this->properties=array_slice($rawres,1);*/

        for ($i=0,$aff_rows=_affected_rows();$i<$aff_rows;$i++) {
            $rawres=_fetch_array($bdres);
            //$p=array_slice($rawres,1);
            $All[$i]=$this->_clone($rawres);
        }
        $this->nRes=_affected_rows();
        if ($this->nRes<$SYS["DEFAULTROWS"])
            $this->nextP=$offset;
        else
            $this->nextP=$offset+$this->nRes;
        $this->prevP=$offset-$SYS["DEFAULTROWS"];
        
            $bdres=_query("SELECT FOUND_ROWS()");
        $aux=_fetch_array($bdres);
        $this->totalPages=$aux["FOUND_ROWS()"];
        
        return $All;

}	

function listUsersInGroupName($name) {
	
	global $offset,$sort;
	$g=newObject("group");
	$g->getGroupByName($name);
	
	return ($this->selectUser("(grupos&{$g->code}={$g->code})",$offset,$sort));
	
}
function listUsersInGroup($id,$off=-1,$s=-1) {
	
	global $offset,$sort;
	
	$off=($off==-1)?$offset:$off;
	$s=($s==-1)?$sort:$s;
	
	$g=newObject("group",$id);
		
	return ($this->selectUser("(grupos&{$g->code}={$g->code})",$off,$s));
	
}
 function load($id){

        global $prefix;

        if ($id==0)
            return array();    
        $q="SELECT *,CONCAT(nombre,' ',apellidos) as fullname from {$prefix}_".$this->name." WHERE ID=$id";
        $bdres=_query($q);
        $rawres=_fetch_array($bdres);
        if ($rawres===False)
            return False;
        $this->ID=$rawres["ID"];
        $this->properties=array_slice($rawres,1);
        $this->_normalize();
        
        return True;
}
  function userExist($user){
  	global $prefix;
	$q="SELECT ID FROM {$prefix}_".$this->name." WHERE username='$user'";
	$bdres=_query($q);
	$this->nRes=_affected_rows();
	if ($this->nRes > 0)
		return True;
	else
		return False;
  
  }
  
  function check_empty($post){
  
  	$empty=false;
	if(empty($post["username"]))
		$empty=true;
	else
		$this->nombre=$post["username"];
	if(empty($post["password"]))
		$empty=true;
	else
		$this->nombre=$post["password"];
	if(empty($post["nombre"]))
		$empty=true;
	else
		$this->nombre=$post["nombre"];
	if(empty($post["apellidos"]))
		$empty=true;
	else
		$this->apellidos=$post["apellidos"];
	if(empty($post["direccion"]))
		$empty=true;
	else
		$this->apellidos=$post["direccion"];
	if(empty($post["localidad"]))
		$empty=true;
	else
		$this->apellidos=$post["localidad"];
	if(empty($post["p_state"]))
		$empty=true;
	else
		$this->apellidos=$post["p_state"];
	if(empty($post["zip"]))
		$empty=true;
	else
		$this->apellidos=$post["zip"];
	if(empty($post["pais"]))
		$empty=true;
	else
		$this->apellidos=$post["pais"];
	if(empty($post["telefono"]))
		$empty=true;
	else
		$this->telefono=$post["telefono"];
	if(empty($post["email"]))
		$empty=true;
	else
		$this->email=$post["email"];
	
	return $empty;
  }
  
  function NameSurname(){
  
  	return $this->nombre." ".$this->apellidos;
  }
  
  function selectShopUser($ID)
  {
  	$t=newObject("tienda");
	$t->searchResults=$t->select("id_user=$ID");
	return $t->searchResults[0]->ID;
  
  }
  
  function mailExist($email='',$ID=1)
  {
  	global $prefix;
	$q="SELECT ID FROM {$prefix}_".$this->name." WHERE email='$email' AND ID <> $ID";
	$bdres=_query($q);
	$this->nRes=_affected_rows();
	if ($this->nRes > 0)
		return True;
	else
		return False;
  
  
  }
?>
