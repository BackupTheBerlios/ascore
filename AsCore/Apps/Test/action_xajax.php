<?php
require_once("Test.php");

set_include_dir(dirname(__FILE__)."/../../Framework/Extensions/xajax/-");
  if ((empty($_POST))&&(!$_GET["oDataRequest"]))
    require('Extensions/wGui/wGui.includes.php');
  include 'xajax_core/xajax.inc.php';
  require_once("Extensions/wGui/wUI.php");
  require_once("gspanel_class.php");
  
  
$xajax = new xajax();

$FormWindow=new wWindow("FormWindow");
$FormWindow->type=WINDOW.FIXED;
$FormWindow->title="Prueba";

$label=new wLabel("Registros de pruebas",$FormWindow,"Registros de pruebas");
   
 $GSPAnel=new GSControlPanel($FormWindow,"Ejemplo","example");
 
  $aumentaButton=new wButton("aumbutton",$GSPAnel->dForm->buttonPane);
  $aumentaButton->setCSS("width","100px");
  $aumentaButton->label="Aumentar visitas";
  $aumentaButton->addListener("onclick","aumentarVisitas");
  $aumentaButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
  
  $disminuyeButton=new wButton("disbutton",$GSPAnel->dForm->buttonPane);
  $disminuyeButton->setCSS("width","100px");
  $disminuyeButton->label="Diminuir visitas";
  $disminuyeButton->addListener("onclick","disminuirVisitas");
  $disminuyeButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
 
  
  function aumentarVisitas($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("example",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona un ejemplo primero')");
    else {
      $valorvisitas = $task->visita + 1;  
        
      $task->visita = $valorvisitas;
      $task->save();
      
      $objResponse->script("alert('Visitas: $task->visita')");
           
      $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
      $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','example')");
    } 
    
    return $objResponse;
    
  }  
  
  
  function disminuirVisitas($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("example",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona un ejemplo primero')");
    else {
      $valorvisitas = $task->visita - 1;  
        
      $task->visita = $valorvisitas;
      $task->save();
      
      $objResponse->script("alert('Visitas: $task->visita')");           
      $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
      $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','example')");
    } 
    
    return $objResponse;
    
  }  
  
  
 $GSPAnel->addTab("Sub-ejemplos","subexample","example_id");
 //$GSPAnel->aj_RequestData("example");
 //$GSPAnel->SQL_CONDS["example"]="((activo='No'))";
 //$GSPAnel->SQL_SORT["example"]="fecha_pub DESC";

 
 if ((empty($_POST))&&(!$_GET["oDataRequest"])){
    
     
    $FormWindow->render();
    //$window->render();
    
    $xajax->printJavascript($SYS["ROOT"]."/Framework/Extensions/xajax");
    
  } else if ($_GET["oDataRequest"]) {
     
    /* Data Request */
    /*$classname=$_GET["oDataRequest"];
    $o=new $classname(null,$_GET["instance"]);*/
    $GSPAnel->aj_RequestData($_GET["instance"]);

  }
  else {
    
    $xajax->processRequest();
    debug("End","red");
  }
/*
$FormWindow->render();

 $xajax->processRequest();
 $xajax->printJavascript($SYS["ROOT"]."/Framework/Extensions/xajax");
 * 
 * 
 */
?>
