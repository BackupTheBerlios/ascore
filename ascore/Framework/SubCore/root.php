<?php

/* 

Previous XML stuff 

Funciones XML usadas por el parser para definir
la clase al vuelo.

*/

	/*

	FUNCION 	xmlstartElement
	
	Internal use only


	*/
	function xmlstartElement($parser, $name, $attrs) {
		global $curEle;

		$curEle[0]=strtolower($name);
		$curEle[1]=$attrs["TYPE"].":".$attrs["OPTION"];


	}

	/*

	FUNCION 	xmlendElement
	
	Internal use only


	*/
	function xmlendElement($parser, $name) {
 	global $curEle,$prop,$TrazaStatus;


		if ($TrazaStatus>1)
			debug("Propiedad \"$curEle[0]\" Tipo \"$curEle[1]\" Descripcion \"$curEle[2]\"","blue");
		$prop["p"][$curEle[0]]="";
		$prop["pd"][$curEle[0]]=$curEle[2];
		$prop["pt"][$curEle[0]]=$curEle[1];




	}
	
	/*

	FUNCION 	xmlcharacterData
	
	Internal use only


	*/

	function xmlcharacterData($parser, $data) {
		global $curEle;
		$curEle["saved"]=$curEle[2];
		$curEle[2]=$data;

	}

	/*

	FUNCION 	load_prop
	
	Internal use only


	*/
	function load_prop($file) {
		global $prop,$curEle;
		$prop=array(array(array()));
		$curEle="";
		$xml_parser = xml_parser_create();
			// use case-folding so we are sure to find the tag in $map_array
			xml_parser_set_option($xml_parser, XML_OPTION_CASE_FOLDING, true);
			xml_set_element_handler($xml_parser, "xmlstartElement", "xmlendElement");
			xml_set_character_data_handler($xml_parser, "xmlcharacterData");
			if (!($fp = c_fopen($file, "r"))) {
				die(debug("could not open XML input","red"));
			}

			while ($data = fread($fp, 4096)) {
				if (!xml_parse($xml_parser, $data, feof($fp))) {
					die(debug("XML error: ".xml_error_string(xml_get_error_code($xml_parser))." at line ".xml_get_current_line_number($xml_parser),"red"));
				}
			}
			xml_parser_free($xml_parser);
			$prop["pd"][$curEle[0]]=$curEle["saved"];//What a fuckin' patch!! Ugh!
			
			/* Some default System properties */
			$prop["p"]["S_UserID_CB"]="";
			$prop["pd"]["S_UserID_CB"]="Creado por";
			$prop["pt"]["S_UserID_CB"]="ref:";
			
			$prop["p"]["S_UserID_MB"]="";
			$prop["pd"]["S_UserID_MB"]="Modificado por";
			$prop["pt"]["S_UserID_MB"]="ref:";
			
			$prop["p"]["S_Date_C"]="";
			$prop["pd"]["S_Date_C"]="Fecha Creacion";
			$prop["pt"]["S_Date_C"]="date:";
			
			$prop["p"]["S_Date_M"]="";
			$prop["pd"]["S_Date_M"]="Fecha Modificacion";
			$prop["pt"]["S_Date_M"]="date:";
			
			return ($prop);

	}





/* 
****************************************
DECLARACION DE LA CLASE RAIZ
****************************************
*/


class Ente extends core{

	var $properties;
	var $properties_desc;
	var $properties_type;
	var $name;
	var $ID="0";
	var $nRes=0;
	var $offset;
	var $ERROR;
	var $ROOT;

	/*

	FUNCION Ente
	
	Sintaxis	Ente($name)
	$name		Nombre de la clase a cargar
	Descripcion:
	Carga una clase des un fichero .def
	El fichero debe estar guardado en el directorio
	especificado por la configuracion:

	$SYS["DOCROOT"].$SYS["DATADEFPATH"]
	
	No se suele usar este método directamente. Es más
	aconsejable usar las funciones newObject o coreNew


	*/

	function Ente($name) {

		global $SYS,$TrazaStatus,$MEMORY_CACHE;

		
		$this->properties_desc=array();
		$this->properties=array();
		$this->properties_type=array();
		$this->ROOT=$SYS["ROOT"];
		$cache_time=false;
		$source_time=false;
		
		/* Soporte para precompilados */
		
		
		if (!isset($MEMORY_CACHE["$name"])) {
			if (file_exists(session_save_path()."/coreg2_cache/".$name.".cached_core_object_properties_".$SYS["PROJECT"])) 
				$cache_time=filemtime(session_save_path()."/coreg2_cache/".$name.".cached_core_object_properties_".$SYS["PROJECT"]);
				
			else
				$cache_time=false;
				
			if (file_exists($SYS["DOCROOT"].$SYS["DATADEFPATH"].$name.".def"))
				$source_time=filemtime($SYS["DOCROOT"].$SYS["DATADEFPATH"].$name.".def");
				
			else if (e_file_exists("local/Class/{$name}.def"))
				$source_time=filemtime(e_file_exists("local/Class/{$name}.def"));
				
			else
				$source_time=false;
			
					
			
			
			
			
			
			
			if (($cache_time!==False)&&($cache_time>$source_time)) {
				
				debug("Cargando definicion compilada de '$name'","yellow");
				$fd = c_fopen (session_save_path()."/coreg2_cache/".$name.".cached_core_object_properties_".$SYS["PROJECT"], "r");
				$buffer="";
				while (!feof($fd)) {
				$buffer .= fgets($fd, 4096);
				}
				fclose ($fd);
				$prop=unserialize($buffer);
				unset($buffer);
			
			}
			else {
				
				/* Establece las propiedades desde un fichero XML */
				
				if (file_exists($SYS["DOCROOT"].$SYS["DATADEFPATH"].$name.".def")) {
					debug("Fichero definicion ".$SYS["DOCROOT"].$SYS["DATADEFPATH"].$name.".def existe");
					$file = $SYS["DOCROOT"].$SYS["DATADEFPATH"].$name.".def";
				}
				else
					if (e_file_exists("local/Class/{$name}.def")) {
						debug($SYS["BASE"]."/local/Class/{$name}.def existe");
						$file = e_file_exists("local/Class/{$name}.def");
						}
					else
						die(debug($SYS["BASE"]."/local/Class/{$name}.def no  existe"));
		
				
		
				debug("Cargando definicion de '$name'","yellow");
		
				$prop=load_prop($file);
		
				
				
				debug("Compilando dinamicamente '$name'","magenta");
				$fd = c_fopen (session_save_path()."/coreg2_cache/".$name.".cached_core_object_properties_".$SYS["PROJECT"], "w");
				fwrite($fd,serialize($prop),strlen(serialize($prop)));
				fclose($fd);
				
				
			}
			$MEMORY_CACHE["$name"]=serialize($prop);
		}
		else {
			
			$prop=unserialize($MEMORY_CACHE["$name"]);
		}
		$this->properties=$prop["p"];
		$this->properties_desc=$prop["pd"];
		$this->properties_type=$prop["pt"];
		$this->_normalize();
		
		$this->name=$name;
	
		

	}

	/*********************
	Function show
	
	Sintaxis	show($propertie)
	$propertie	propertie to print
	
	Print a propertie value

	*********************/


	function show($prop) {

		echo $this->properties[$prop];
	}

	/*********************
	Function get
	*********************/

	function get($prop) {

		return $this->properties[$prop];
	}

	/*********************
	Function set
	*********************/

	function set($prop,$value) {


		if (!in_array($prop,array_keys($this->properties))) {
			debug("Propiedad - \"$prop\" - no disponible","red");
			return false;
		}
		else {
			$this->properties[$prop]=$value;
			$this->_normalize();
			return true;
		}

	}

	/*********************
	Function get_ext
	*********************/

	function get_ext($object,$reference,$field,$function=False,$functionargs="") {

		$tmp=newObject("$object",$reference);
		if ($function)
			return $tmp->$field($functionargs);
		else
			return $tmp->$field;

	}
	
	/*********************
	Function setAll
	
	Syntax		setAll(array)
	
	Load all properties from array
	Example: setAll($_POST);
	
	Do some magic on types
	*********************/

	function setAll($arraydata) {
	
		foreach ($arraydata as $k=>$v) 
			if (in_array($k,array_keys($this->properties)))
					$this->properties[$k]=$v;
		
		foreach ($this->properties as $pk=>$pv)
			if (strpos($this->properties_type[$pk],"boolean:")!==False)
				$this->properties[$pk]=(($arraydata["$pk"]=="on")||($arraydata["$pk"]=="Si")||($arraydata["$pk"]=="1"))?'Si':'No';
	
		$this->ID=$arraydata["ID"];
		$this->_normalize();
		

	
	
	}

	/*********************
	Function setAllSoft
	
	Syntax		setAllSoft(array)
	
	Load all properties from array
	Example: setAllSoft($_POST);
	
	Do some magic on types. Don't use if checks.
	*********************/

	function setAllSoft($arraydata) {
	
		foreach ($arraydata as $k=>$v) 
			if (in_array($k,array_keys($this->properties)))
					$this->properties[$k]=$v;
		
	
	
		$this->ID=$arraydata["ID"];
		$this->_normalize();
		

	
	
	}


	/*********************
	Function save
	
	Syntax:		save()
	
	Saves the current object
	if ID<2, it will create a new elemente in the table
	
	*********************/

	function save() {
		global $res,$prefix;

		/* Normalizamos datos */

		$this->data_normalize();
		$res="";
		if (($this->ID>1)&&!empty($this->ID)) {
			debug("Llamada ".$this->name."->save redirigida a update con ".$this->ID,"yellow");
			return $this->update();
		}
		else
		{
			if (!function_exists("fsadd")) {
				function fsadd(&$str) {
					global $res;
					if ($str!="ID")
						$res.=",`$str`";
				}
			}
			if (!function_exists("dsadd")) {
				/* Funcion dinamica */
				function dsadd(&$str,$key) {
					global $res;
					if ($key!="ID") {
						$res.=",'$str'";
							
					}
				}
			}
			$this->S_UserID_CB=$_SESSION["__auth"]["uid"];
			$this->S_Date_C=time();
		
			$this->_flat();
			array_walk(array_keys($this->properties),"fsadd");
			$q="INSERT INTO `{$prefix}_".$this->name."`( `ID` ".$res.")";
			$res="";
			reset($this->properties);
			array_walk($this->properties,"dsadd");
			$q.=" VALUES (''$res)";
			
			$bdres=_query($q);
			$this->ID=_last_id();
			$this->nRes=_affected_rows();
			if ($this->nRes>0)
				return $this->ID;
			else
				return False;
		}

	}

	/*********************
	Function delete
	*********************/

	function delete() {

		global $res,$prefix;
    	$q="DELETE FROM `{$prefix}_".$this->name."` WHERE `ID` = '".$this->ID."'  ";
		$bdres=_query($q);
		$this->nRes=_affected_rows();
		if ($this->nRes>0)
			return True;
		else
			return False;
		
	}

	/*********************
	Function deletes
	*********************/

	function deletes($cond) {

		global $res,$prefix;
    	$q="DELETE FROM `{$prefix}_".$this->name."` WHERE $cond  ";
		$bdres=_query($q);
		$this->nRes=_affected_rows();
		if ($this->nRes>0)
			return True;
		else
			return False;
		
	}


	/*********************
	Function load
	*********************/

	function load($id){

		global $prefix;

		if ($id==0)
			return array();	
		$q="SELECT * from {$prefix}_".$this->name." WHERE ID=$id";
		$bdres=_query($q);
		$rawres=_fetch_array($bdres);
		if ($rawres===False)
			return False;
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,0);
		$this->_normalize();
		
		return True;

	}


	/*********************
	Function update
	*********************/

	function update(){

		global $res,$prefix;

		$this->S_UserID_MB=$_SESSION["__auth"]["uid"];
		$this->S_Date_M=time();
		$this->_flat();
		if (!function_exists("fadd")) {
			function fadd(&$val,&$key) {
				global $res;
				$res.=" `$key`='$val' , ";
			}
		}
		array_walk($this->properties,"fadd");
		$q="UPDATE `{$prefix}_".$this->name."` SET ";
		$q.=substr($res,0,strlen(sizeof($res))-3)."  WHERE `ID`=".$this->ID. " LIMIT 1";
		$bdres=_query($q);
		$this->nRes=_affected_rows();
		if ($this->nRes>-1)
			return $this->ID;
		else
			return False;

	}

	/*********************
	Function selectAll
	*********************/

	function selectAll($offset=0,$sort="ID") {

		global $prefix,$SYS;
		debug($SYS["DEFAULTROWS"]);
		if ((empty($sort)))
			$sort="ID";
		$All=array();
		if ((empty($offset))||($offset<0))
			$offset=0;
		$q="SELECT SQL_CALC_FOUND_ROWS * from {$prefix}_".$this->name." WHERE ID>1";
		$q.=" ORDER BY $sort LIMIT $offset,".$SYS["DEFAULTROWS"];
		
		$bdres=_query($q);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/

		for ($i=0,$af_rows=_affected_rows();$i<$af_rows;$i++) {
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

	/*********************
	Function select
	*********************/

	function select($q,$offset=0,$sort="ID",$groupby='',$addfields='') {

		global $prefix,$SYS;

		$All=array();
		if ((empty($sort)))
			$sort="ID";
		if ((empty($offset))||($offset<0))
			$offset=0;

		$q="SELECT SQL_CALC_FOUND_ROWS *$addfields from {$prefix}_".$this->name." WHERE $q AND ID>1 $groupby";
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
	/*********************
	Function select
	*********************/

	function query($q,$offset=0,$sort="ID") {

		global $prefix,$SYS;

		$All=array();
		if ((empty($sort)))
			$sort="{$prefix}{$this->name}.ID";
		if ((empty($offset))||($offset<0))
			$offset=0;

		
		$q.=" ORDER BY $sort LIMIT $offset,".$SYS["DEFAULTROWS"];


		$bdres=_query($q);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/

		for ($i=0,$af_rows=_affected_rows();$i<$af_rows;$i++) {
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
		return $All;


	}

	/*********************
	Function listAll
	*********************/


	function listAll($field,$addVoidValue=True,$more="") {

		if (empty($more))
			$all=$this->selectAll();
		else {
			setLimitRows(50);
			$all=$this->select($more);
			resetLimitRows();
		}
		
		if ($addVoidValue)
			$list[1]="--";
		foreach ($all as $k=>$o)
			if (method_exists($o,$field)) {
				debug("Llamada listAll tiene argumento a funcion","red");
				$list[$o->ID]=$o->$field();
			}
			else
				$list[$o->ID]=$o->$field;
		return $list;

	}

	/*********************
	Function _clone
	*********************/


	function _clone($data) {

		
		$bin=$this;
		$bin->properties=$data;
		$bin->_normalize();
		return $bin;
	}

	/*********************
	Function _normaliez
	*********************/

	function _normalize() {
        if (is_array($this->properties))
		foreach ($this->properties as $k=>$v)  {
		
		if (strpos($this->properties_type[$k],"boolean:")!==False) {
				$this->$k=(($v=="on")||($v=="Si"))?'Si':'No';
				
					
			}
		else
			$this->$k="".$v."";

		}
	}

	/*********************
	Function _escape_chars
	*********************/

	function _escape_chars() {
        if (is_array($this->properties))
		foreach ($this->properties as $k=>$v)  {
		
		
			$this->$k=addslashes($v);

		}
	}

	/*********************
	Function _flat
	*********************/

	function _flat() {
		$newproperties=$this->properties;
        foreach ($newproperties as $k=>$v) 
					$this->properties[$k]="".$this->$k."";


	}


	/*********************
	Function data_normalize
	*********************/

	function data_normalize() {
		$this->_flat();
		foreach ($this->properties_type as $k=>$v) {
             if ((strpos($v,"datex")!==False)&&(!ereg("^[0-9]+$",$this->$k))) {
					$fecha=explode("/", $this->$k);
					$fecha=$fecha[0]+$fecha[1]*100+$fecha[2]*10000;			
					$this->$k=$fecha;
			 }			 

	     else	if ((strpos($v,"date")!==False)&&(!ereg("^[0-9]+$",$this->$k))) {
					$fecha=explode("/", $this->$k);
					$fecha=strtotime($fecha[1]."/".$fecha[0]."/".$fecha[2])+1;				
					$this->$k=$fecha;
			 }
	     
		}
		$this->_flat();
	}

	/* 
	***********************************************************
	***********************************************************
	********** Métodos de útiles para el framework ************
	***********************************************************
	***********************************************************

	*/

	function showProperties() {
		global $prefix;
		
		reset($this->properties);
		reset($this->properties_type);
		reset($this->properties_desc);
		echo "<table border=\"1\" cellpadding=\"1\">";
		echo "<th>Propiedad</th><th>Valor actual</th><th>Tipo</th><th>Descripcion</th>";
		for ($i=0,$loop_c=sizeof($this->properties);$i<$loop_c;$i++) {


			echo "<tr>";
			echo "<td>".key($this->properties)."</td>";
			echo "<td>".current($this->properties)."</td>";
			echo "<td>".current($this->properties_type)."</td>";
			echo "<td>".current($this->properties_desc)."</td>";
			echo "</tr>";
			$q.=key($this->properties)."\t".current($this->properties)."\t".current($this->properties_type)."\t".current($this->properties_desc)."\n";
			next($this->properties_desc);
			next($this->properties_type);
			next($this->properties);
		}
		echo "<tr><td>DataBase Instance</td><td colspan=\"3\">";
		$res=_query("SHOW TABLE STATUS LIKE '{$prefix}_{$this->name}'");
		dataDump(_fetch_array($res));
		
		echo "</td></tr></table>";
		
	}
	function sqlGenesis() {

		global $prefix;

		debug("Prefijo $prefix tabla $this->name","red"); 
		$q="SHOW TABLES";
		$bdres=_query($q);
		$exists=False;
		while ($rawres=_fetch_array($bdres)) {
			if (current($rawres)=="{$prefix}_{$this->name}")
				$exists=True;
		}
		if ($exists) {
			$q="";
			/* La tabla  existe */
			$q="SHOW FIELDS FROM `{$prefix}_{$this->name}`";
			$bdres=_query($q);
			$j=0;
			while ($rawres=_fetch_array($bdres)) { 
				$fieldlst[$j]=current($rawres);
				$j++;
			}
			$q="";
			reset($this->properties_type);
			reset($this->properties);
			for ($i=0,$loop_c=sizeof($this->properties);$i<$loop_c;$i++) {
				//echo "-".current($this->properties_type).".<br>";
				if (in_array(key($this->properties),$fieldlst))
					$action="ALTER TABLE `{$prefix}_".$this->name."` CHANGE `".key($this->properties)."` `".key($this->properties)."` ";
				else
					$action="ALTER TABLE `{$prefix}_".$this->name."` ADD `".key($this->properties)."` ";

				if (strstr(current($this->properties_type),"string")) {
					$len=explode(":",current($this->properties_type));
					$q.= $action."VARCHAR( $len[1] ) NOT NULL ;\n";
				}
				else if (strstr(current($this->properties_type),"longtext")) {
					$len=explode(":",current($this->properties_type));
					$q.= $action."BLOB  NOT NULL ;\n";
				}
				elseif (strstr(current($this->properties_type),"text")) {
					$q.=$action." TEXT  NOT NULL ;\n";
				}
				else if (strstr(current($this->properties_type),"list")) {
					$len=explode(":",current($this->properties_type));
					$options=explode("|",$len[1]);
					$enum="'".$options[0]."'";
					for ($j=1,$options_size=sizeof($options);$j<$options_size;$j++) {
						$enum.=",'".$options[$j]."'";
					}
					$q.=$action." ENUM ( ".$enum." ) NOT NULL;\n";

				}

				elseif (strstr(current($this->properties_type),"nulo")) {
					$q.="";
				}
				else if (strstr(current($this->properties_type),"ref")) {
				$q.=$action." INT;\n";

				}
				else if (strstr(current($this->properties_type),"int")) {
				$q.=$action." INT;\n";

				}
				else if (strstr(current($this->properties_type),"date")) {
				$q.=$action." INT;\n";

				}
				else if (strstr(current($this->properties_type),"datex")) {
				$q.=$action." INT;\n";

				}
				else if (strstr(current($this->properties_type),"time")) {
				$q.=$action." INT;\n";

				}
				else if (strstr(current($this->properties_type),"money")) {
				$q.=$action." DECIMAL(15,5);\n";

				}
				else if (strstr(current($this->properties_type),"float")) {
				$q.=$action." DECIMAL(15,15);\n";

				}
				else if (strstr(current($this->properties_type),"boolean")) {
					$len=explode(":",current($this->properties_type));
					$q.=$action." ENUM('Si','No') ";
					$q.="DEFAULT '{$len[1]}' NOT NULL;\n";

				}

			next($this->properties_type);
			next($this->properties);
			}
			//			LIMPIEZA
			print_r($fieldlst);
			for ($i=0,$fieldlst_options=sizeof($fieldlst);$i<$fieldlst_options;$i++)
				if ((in_array($fieldlst[$i],array_keys($this->properties)))||($fieldlst[$i]=="ID"))
					echo "";
				else
					$q.="ALTER TABLE `{$prefix}_{$this->name}` DROP `".$fieldlst[$i]."`;\n";

			echo "<pre>$q</pre>";
			return $q;

		}
		else
		{
			$q ="CREATE TABLE `{$prefix}_".$this->name."` (\n";
			$q.="`ID` INT NOT NULL AUTO_INCREMENT ,\n";
			reset($this->properties_type);
			reset($this->properties);
			for ($i=0,$properties_size=sizeof($this->properties);$i<$properties_size;$i++) {
				//echo "-".current($this->properties_type).".<br>";
				if (strstr(current($this->properties_type),"string")) {
					$len=explode(":",current($this->properties_type));
					$q.="`".key($this->properties)."` VARCHAR( $len[1] ) NOT NULL ,\n";
				}
				else if (strstr(current($this->properties_type),"longtext")) {
					$len=explode(":",current($this->properties_type));
					$q.="`".key($this->properties)."` BLOB NOT NULL ,\n";
				}

				elseif (strstr(current($this->properties_type),"text")) {
					$q.="`".key($this->properties)."` TEXT  NOT NULL ,\n";
				}
				else if (strstr(current($this->properties_type),"list")) {
					$len=explode(":",current($this->properties_type));
					$options=explode("|",$len[1]);

					$enum="'".$options[0]."'";
					for ($j=1,$options_size=sizeof($options);$j<$options_size;$j++) {
						$enum.=",'".$options[$j]."'";
					}
					
					$q.="`".key($this->properties)."` ENUM ( ".$enum." ) NOT NULL,\n";

				}

				else if (strstr(current($this->properties_type),"ref")) {
					$q.="`".key($this->properties)."` INT,\n";

				}
				else if (strstr(current($this->properties_type),"int")) {
					$q.="`".key($this->properties)."` INT,\n";

				}
				else if (strstr(current($this->properties_type),"date")) {
					$q.="`".key($this->properties)."` INT,\n";

				}
				else if (strstr(current($this->properties_type),"datex")) {
					$q.="`".key($this->properties)."` INT,\n";

				}
				else if (strstr(current($this->properties_type),"time")) {
					$q.="`".key($this->properties)."` INT,\n";

				}
				elseif (strstr(current($this->properties_type),"nulo")) {
					$q.="";
				}
				else if (strstr(current($this->properties_type),"money")) {
					$q.="`".key($this->properties)."` DECIMAL(15,5),\n";

				}
				else if (strstr(current($this->properties_type),"float")) {
					$q.="`".key($this->properties)."` DECIMAL(15,5),\n";

				}
				else if (strstr(current($this->properties_type),"boolean")) {
					$len=explode(":",current($this->properties_type));
					$q.="`".key($this->properties)."` ENUM('Si','No') ";
					$q.="DEFAULT '{$len[1]}' NOT NULL,\n";

				}
			next($this->properties_type);
			next($this->properties);
			}
			$q.="INDEX ( `ID` ), PRIMARY KEY ( `ID` )\n)\n";
			echo "<pre>$q</pre>";
			return $q;
		}
	}

	function makeTemplate($name) {

        $q='
<!--HEAD-->
<style  type="text/css">
td.dynamic_class_'.$name.'0 {text-align:center;vertical-align:top;background-color:#EEEEF6}
td.dynamic_class_'.$name.'1 {text-align:center;vertical-align:top;background-color:white}
td.dynamic_class_'.$name.'2 {text-align:center;vertical-align:top;background-color:#F7F7F7}
td.dynamic_class_'.$name.'3 {text-align:center;vertical-align:top;background-color:white}
</style>
<table width="95%" cellspacing="1" border="1" cellpadding="1" align="center" style="border:solid 1px gray">
';
		
		reset($this->properties_desc);
		reset($this->properties);
		$q.="<th>Nº</th>\n";
		for ($i=0;$i<sizeof($this->properties);$i++) {
				$q.="<th><a href=\"<!-- N:navvars -->&sort=".key($this->properties)."\">".current($this->properties_desc)."</a></th>\n";
 				next($this->properties_desc);
				next($this->properties);
		}				
	    $q.='
<!--SET-->
<tr>
		';
		reset($this->properties_type);
		reset($this->properties);
		$q.='
	<td class="<!-- dynamic_class -->"><!-- D:ID --></td>
';
		for ($i=0;$i<sizeof($this->properties);$i++) {
			
			if (current($this->properties_type)=="datex:")
				$q.='
	<td class="<!-- dynamic_class -->"><!-- R:'.key($this->properties).' --></td>';
			else if (current($this->properties_type)=="date:")
				$q.='
	<td class="<!-- dynamic_class -->"><!-- A:'.key($this->properties).' --></td>';
			else
					$q.='
	<td class="<!-- dynamic_class -->"><!-- D:'.key($this->properties).' --></td>';

			next($this->properties_type);
			next($this->properties_desc);
			next($this->properties);
		}
	
		$q.='    
</tr>
<!--END-->
</table>
<br>
<table width="95%" cellspacing="0" border="0" cellpadding="4" align="center" style="border:solid 1px gray">
<tr><th align="left">
	<!-- IFPAGER1 --><a href="<!-- N:prevpage -->">Página anterior</a><!-- FIPAGER1 -->
</th>
<th align="center"><!-- D:Pager -->
</th><th align="right">
	<!-- IFPAGER2 --><a href="<!-- N:prevpage -->">Página siguiente</a><!-- FIPAGER2 -->
</th>
</tr>
</table>
<br>
';
        return $q;
		
	}


	function makeEditTemplate($name) {

        $q='
<!--HEAD-->
<!--SET-->
<script type="text/javascript" language="JavaScript1.3">
<!--
function checkDate(ele) {
 dat=document.getElementById(ele).value;
 b1=dat.search("/");
 dat2=dat.slice(b1+1);
 b2=dat2.search("/")+b1+1;
 dia=parseInt(dat.slice(0,b1));
 mes=parseInt(dat.slice(b1+1,b2));
 an=parseInt(dat.slice(b2+1));
 ok=0;
 if ((dia>31)||(dia<1)||(isNaN(dia)))
	ok=1;
 if ((mes>12)||(mes<1)||(isNaN(mes)))
	ok=1;
 if ((an<2000)||(an>2030)||(isNaN(an)))
	ok=1;
 if (ok==1) {
	alert("Fecha incorrecta");
	dia="01";
	mes="01";
	an="2004";
	document.getElementById(ele).value=""; 		
	}
}

function checkMoney(ele) {

	money=new String(document.getElementById(ele).value);
	dot=money.indexOf(",");
	if (dot!=-1) {
		money2=money.slice(0,dot)+".";
		money2+=money.slice(dot+1);
		money=money2;
	}
	value=parseFloat(money);
	if (isNaN(value)) {
		alert("Valor monetario incorrecto");
		money=0;
	}
	else
		money=value.toString();

	document.getElementById(ele).value=money; 		
}



-->
</script>
<style  type="text/css">
td.dynamic_class_'.$name.'0 {text-align:center;vertical-align:top;background-color:#EEEEF6}
td.dynamic_class_'.$name.'1 {text-align:center;vertical-align:top;background-color:white}
td.dynamic_class_'.$name.'2 {text-align:center;vertical-align:top;background-color:#F7F7F7}
td.dynamic_class_'.$name.'3 {text-align:center;vertical-align:top;background-color:white}
</style>

<table width="95%" cellspacing="1" border="0" cellpadding="1" align="center" style="border:solid 1px gray">
';
		
		reset($this->properties_desc);
		reset($this->properties);
		reset($this->properties_type);
		for ($i=0;$i<sizeof($this->properties);$i++) {
				$q.="<tr>\n\t<td>".current($this->properties_desc)."</td>\n";
				if (strstr(current($this->properties_type),"string")) {
                	if (substr(current($this->properties_type),strpos(current($this->properties_type),":")+1)<51) {
						$q.="\n\t<td><input type=\"text\" name=\"".key($this->properties)."\" maxlength=\"".substr(current($this->properties_type),strpos(current($this->properties_type),":")+1)."\"
						value=\"<!-- D:".key($this->properties)." -->\" size=\"".substr(current($this->properties_type),strpos(current($this->properties_type),":")+1)."\"/>";
					}
					else {
						$q.="\n\t<td><textarea name=\"".key($this->properties)."\" cols=\"50\"><!-- D:".key($this->properties)." --></textarea>";
					}
				}

				else if (strstr(current($this->properties_type),"date"))
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"10\"
					size=\"10\" value=\"<!-- A:".key($this->properties)." -->\" onblur=\"javascript:checkDate('".key($this->properties)."')\"/>";
				else if (strstr(current($this->properties_type),"datex"))
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"10\"
					size=\"10\" value=\"<!-- A:".key($this->properties)." -->\" onblur=\"javascript:checkDate('".key($this->properties)."')\"/>";					
				else if (strstr(current($this->properties_type),"time"))
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"10\"
					size=\"10\" value=\"<!-- T:".key($this->properties)." -->\" />";

				else if (strstr(current($this->properties_type),"int"))
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"11\"
					size=\"11\" value=\"<!-- D:".key($this->properties)." -->\"/>";

				else if (strstr(current($this->properties_type),"list")) {
					$q.="\n\t<td><select name=\"".key($this->properties)."\">";
					$options=substr(current($this->properties_type),strpos(current($this->properties_type),":")+1);
					$ops=explode("|",$options);
					//dataDump($ops);
					foreach ($ops as $minikey=>$minival)
						$q.="\t<option value=\"$minival\" <!-- O:".key($this->properties).$minival." -->>$minival</option>\n";
					$q.= "</select>";
				}
				else if (strstr(current($this->properties_type),"money")) {
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"15\"
					size=\"15\" value=\"<!-- S:".key($this->properties)." -->\" onblur=\"javascript:checkMoney('".key($this->properties)."')\"/>";
				}
				else if (strstr(current($this->properties_type),"float")) {
					$q.="\n\t<td><input type=\"text\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" maxlength=\"15\"
					size=\"15\" value=\"<!-- F:".key($this->properties)." -->\" onblur=\"javascript:checkMoney('".key($this->properties)."')\"/>";
				}
				else if (strstr(current($this->properties_type),"boolean")) {
					$q.="\n\t<td><input type=\"checkbox\" id=\"".key($this->properties)."\" name=\"".key($this->properties)."\" <!-- G:".key($this->properties)." -->/>";
					

				}
				else                       
					$q.="<td>".current($this->properties);
				$q.="\n\t</td>\n</tr>\n";
 				next($this->properties_desc);
				next($this->properties);
				next($this->properties_type);
				
		}				

$q.="
<tr>
	<td colspan=\"2\" align=\"right\"><!-- D:boton0 -->&nbsp;&nbsp;<!-- D:boton1 -->&nbsp;&nbsp;<!-- D:boton2 -->&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr></table>
<input type=\"hidden\" name=\"ID\" value=\"<!-- D:ID -->\"/>
<!--END-->
";
		 return $q;
		
	}

	function makeViewTemplate($name) {

        $q='
<!--HEAD-->
<style  type="text/css">
td.dynamic_class_'.$name.'0 {text-align:center;vertical-align:top;background-color:#EEEEF6}
td.dynamic_class_'.$name.'1 {text-align:center;vertical-align:top;background-color:white}
td.dynamic_class_'.$name.'2 {text-align:center;vertical-align:top;background-color:#F7F7F7}
td.dynamic_class_'.$name.'3 {text-align:center;vertical-align:top;background-color:white}
</style>
<!--SET-->
<table width="95%" cellspacing="1" border="0" cellpadding="1" align="center" style="border:solid 1px gray">
';
		
		reset($this->properties_desc);
		reset($this->properties);
		reset($this->properties_type);
		for ($i=0;$i<sizeof($this->properties);$i++) {
				$q.="<tr>\n\t<td>".current($this->properties_desc)."</td>\n";
				if (strpos(current($this->properties_type),"date")!==False)
					$q.="\n\t<td><!-- A:".key($this->properties)." -->";
				if (strpos(current($this->properties_type),"datex")!==False)
					$q.="\n\t<td><!-- R:".key($this->properties)." -->";
									
				else if (strpos(current($this->properties_type),"money")!==False)
					$q.="\n\t<td><!-- S:".key($this->properties)." -->";
				else if (strpos(current($this->properties_type),"time")!==False)
					$q.="\n\t<td><!-- T:".key($this->properties)." -->";
				else
					$q.="\n\t<td><!-- D:".key($this->properties)." -->";
					
				$q.="\n\t</td>\n</tr>\n";
 				next($this->properties_desc);
				next($this->properties);
				next($this->properties_type);
				
		}				

$q.="</table>
<!--END-->
";
		 return $q;
		
	}

	function metacompile() {

	return True;

	}
	
	/*********************
	Function allID
	*********************/

	function allID() {

		global $prefix,$SYS;
		
		$q="SELECT ID from {$prefix}_".$this->name." WHERE ID>1";
		
		$bdres=_query($q);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/
		$All=array();
		for ($i=0,$rows_affected=_affected_rows();$i<$rows_affected;$i++) {
			$rawres=_fetch_array($bdres);
			//$p=array_slice($rawres,1);
			$All[$i]=$rawres["ID"];
		}
		
		return $All;


	}
	
	/*********************
	Funcion selectA
	
	Sintaxis	selectD($q)
	$q		Condiciones SQL
	Descripcion:
	Comportamiento similar al select normal, pero
	realiza una query sin paginacion y devuelve
	los datos como un array.
	
	Es más rápida y consume menos memoria que el
	select normal, pero carece de muchas funcionalidades.
	Se usaría para listados grandes o informes

	*********************/

	function selectA($q="") {

		global $prefix,$SYS;
		
		if (!empty($q))
			$qry="SELECT * from {$prefix}_".$this->name." WHERE ID>1 AND $q";
		else
			$qry="SELECT * from {$prefix}_".$this->name." WHERE ID>1";
		
		$bdres=_query($qry);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/
		$All=array();
		for ($i=0,$rows_affected=_affected_rows();$i<$rows_affected;$i++) {
			$rawres=_fetch_array($bdres);
			//$p=array_slice($rawres,1);
			$All[$rawres["ID"]]=$rawres;
		}
		$this->nRes=sizeof($All);
		return $All;


	}
	
	/*********************
	Funcion nextID(ID)
	
	Siguiente elemento en la tabla


	*********************/

	function nextID($ID='') {

		global $prefix,$SYS;
		
		if (empty($ID)) {
			$ID=$this->ID;
		}
		
		
		$qry="SELECT ID from {$prefix}_".$this->name." WHERE ID>$ID AND ID>1 ORDER BY ID ASC";
		
		$bdres=_query($qry);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/
		if ($bdres)
			if ($rawres=_fetch_array($bdres))
				return $rawres["ID"];
			else
				return $ID;


	}
	
	/*********************
	Funcion prevID(ID)
	
	Anterior elemento en la tabla


	*********************/

	function prevID($ID='') {

		global $prefix,$SYS;
		
		if (empty($ID)) {
			$ID=$this->ID;
		}
		
		
		$qry="SELECT ID from {$prefix}_".$this->name." WHERE ID<$ID AND ID>1 ORDER BY ID DESC";
		
		$bdres=_query($qry);
		/*$rawres=fetch_array($bdres);
		$this->ID=$rawres["ID"];
		$this->properties=array_slice($rawres,1);*/
		if ($bdres)
			if ($rawres=_fetch_array($bdres))
				return $rawres["ID"];
			else
				return $ID;


	}

	function buildMultiquery($tokens) {

		$fields=($this->properties);
		$token=explode(" ",$tokens);
		foreach ($token as $kk=>$vv) {
			foreach ($fields as $k=>$v)  {
				$xmultiquery[]="$k LIKE '%$vv%' ";	
			}
			$multiquery=implode(" OR ",$xmultiquery);
			unset($xmultiquery);
			$smultiquery[]="(".$multiquery.")";
		}
		$query=implode(" AND ",$smultiquery);
		return $query;
	}
	
	



}
