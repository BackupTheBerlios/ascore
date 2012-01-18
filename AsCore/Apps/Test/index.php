<?php

require("noexists.php");


require_once("Test.php");
$busqueda=(isset($_POST["busca"]))?$_POST["busca"]:$busqueda;
$host=(isset($_POST["host"]))?$_POST["host"]:$host;
setNavVars(array("busqueda","host"));
$n=newObject("example");
//$n->searchResults=$n->selectAll($offset,$sort);
if ($busqueda != "")
{
    if ($host != "" && $host > 1) {
            
            $n->searchResults=$n->selectAll($offset,$sort);
            $n->searchResults=$n->select($n->buildMultiquery($busqueda)." AND host=$host",$offset,$sort);
            //$n->searchResults=$n->select("host=$host",$offset,$sort);
            
                if($n->nRes==0)
                                $n->nohay="NO HAY NINGÚN DATO CON ESTE HOST";
        } else {    
            
            $n->searchResults=$n->selectAll($offset,$sort);
            $n->searchResults=$n->select($n->buildMultiquery($busqueda),$offset,$sort);
            if($n->nRes==0)
                            $n->nohay="NO EXISTEN DATOS QUE CUMPLAN EL CRITERIO DE BÚSQUEDA";
        }
   
}else{
    if ($host != "" && $host > 1) {
            
            $n->searchResults=$n->selectAll($offset,$sort);
            $n->searchResults=$n->select("host=$host",$offset,$sort);
                    if($n->nRes==0)
                            $n->nohay="NO HAY NINGÚN DATO CON ESTE HOST";
    } else {   
        $n->searchResults=$n->selectAll($offset,$sort);
    }
}


$datosExternos=array(
    
    //"host"=>'code#if ($object->fecha >= '.($_SESSION['fecha']+1).') return "Nuevos Mensajes";'
    //"grafica"=>'code#return $object->msgBar('.$total.');',
    //"bookmark"=>'xref#bookmark|host|nombre',
    "bookmark"=>$n->get_external_reference("host")
);
$c=newObject("bookmark");

$datosExternosBuscar=array(

	"host"=>$c->listAll("nombre")
	//"id_cat"=>array("Uno","Dos")
);

formAction("","","editForm");


plantHTML(
        array(
            "host"=>$_REQUEST["host"],
            "busca"=>$_REQUEST["busca"],
            "boton0"=>gfxBotonAction("Buscar","getElementById('editForm').submit()",True)
            ),'search_example',$datosExternosBuscar);

listList($n,$datosExternos,'example_list',"",1,"plParseTemplateFast");

?>