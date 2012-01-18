<?php
  
  /* Enabling AJAX */
  
  require("GlobalSche.php");
  
  set_include_dir(dirname(__FILE__)."/../../Framework/Extensions/xajax/-");
  if ((empty($_POST))&&(!$_GET["oDataRequest"]))
    require('Extensions/wGui/wGui.includes.php');
  include 'xajax_core/xajax.inc.php';
  require_once("Extensions/wGui/wUI.php");
  require_once("gspanel_class.php");
  
  
  
  $xajax = new xajax();
  
  $FormWindow=new wWindow("FormWindow");
  $FormWindow->type=WINDOW.FIXED;
  $FormWindow->title="Tareas";
  //$FormWindow->setCSS("width","50%");
  
  $label=new wLabel("Mostrar terminadas",$FormWindow,"Mostrar terminadas");
  $ShowTerminadas=new wCheckBox("Terminadas",$FormWindow);
  
  
  $ShowTerminadas->addListener("onclick","ManageCheckActivadas");
  $ShowTerminadas->Listener["onclick"]->addParameter( XAJAX_JS_VALUE,'$("'.$ShowTerminadas->id.'").checked');
  
  function ManageCheckActivadas($source,$event,$on) {
    debug("ENTRANDO EN MANAGE","green");
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    
    if ($on=="on") {
      $_SESSION[$GSPAnel->id]["showfinished"]=true;
    } else
      $_SESSION[$GSPAnel->id]["showfinished"]=false;
    session_write_close (  );
    
    $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
    
    $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','gtasklog')");
    
    
    
    return $objResponse;
  }
  
  
  $GSPAnel=new GSControlPanel($FormWindow,"Registros","gtasklog");
  
  if ($_SESSION[$GSPAnel->id]["showfinished"])  {
    $GSPAnel->SQL_CONDS["gtasklog"]="((estado<>'Terminada') OR (fin>".(time()-60*60*24*7)." AND estado='Terminada'))";
    $ShowTerminadas->setChecked(true);
  }
  else {
    $GSPAnel->SQL_CONDS["gtasklog"]="((estado<>'Terminada'))";
    $ShowTerminadas->setChecked(false);
  }
  $GSPAnel->SQL_SORT["gtasklog"]="estado ASC,inicio ASC";
  
  $initiateButton=new wButton("initbutton",$GSPAnel->dForm->buttonPane);
  $initiateButton->label="Iniciar";
  $initiateButton->addListener("onclick","iniciarTarea");
  $initiateButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
  
  $terminateButton=new wButton("terbutton",$GSPAnel->dForm->buttonPane);
  $terminateButton->label="Terminar";
  $terminateButton->addListener("onclick","terminarTarea");
  $terminateButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
  
  $runButton=new wButton("runbutton",$GSPAnel->dForm->buttonPane);
  $runButton->label="Ejecutar";
  $runButton->addListener("onclick","runTarea");
  $runButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
  
  function runTarea($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("gtasklog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      $task->setStatus("ini");
      system("php5 ".dirname(__FILE__)."/cmd_spawn_task.php {$formData["ID"]} 2>&1 &> /tmp/task_{$formData["ID"]}.log &");
      
      $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
      $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','gtasklog')");
    } 
    
    return $objResponse;
    
  }
  
  function iniciarTarea($source,$event,$formData) {
    global $GSPAnel,$SYS;
    $objResponse = new xajaxResponse();
    $task=newObject("gtasklog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      $task->setStatus("ini");
      $objResponse->assign("statusBox","value","Tarea iniciada");
      $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
      $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','gtasklog')");
    } 
    
    
    return $objResponse;
    
  }
  
  function terminarTarea($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("gtasklog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      if (!$task->setStatus("ter")) {
        $objResponse->script("alert('{$task->ERROR}')");
      }
      else {
        $objResponse->script("tableGrid_{$GSPAnel->dGrid->id}.refresh()");
        $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[0]->id}','gtasklog')");
      }
    } 
    
    return $objResponse;
    
  }
  $GSPAnel->formatGridData="myFormatGridData";
  
  function myFormatGridData(&$res) {
    debug("ENTRANDO EN formatGridData","green");
    foreach ($res as $k=>$obj) {
      if (($obj->inicio<time())&&($obj->estado!='Terminada')) {
        $res[$k]->etiqueta="<b style='color:red'>{$obj->etiqueta}</b>";
      }
    }
  };
  
  $GSPAnel->addTab("Pasos","gsteplog","gtasklog_id");
  $initiateButton=new wButton("initbutton2",$GSPAnel->aForms[1]->buttonPane);
  $initiateButton->label="Iniciar";
  $initiateButton->addListener("onclick","iniciarPaso");
  $initiateButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->aForms[1]->id);
  $initiateButton=new wButton("closebutton2",$GSPAnel->aForms[1]->buttonPane);
  $initiateButton->label="Finalizar";
  $initiateButton->addListener("onclick","cerrarPaso");
  $initiateButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->aForms[1]->id);
  
  $initiateButton=new wButton("runButton",$GSPAnel->aForms[1]->buttonPane);
  $initiateButton->label="Ejecutar";
  $initiateButton->addListener("onclick","ejecutarPaso");
  $initiateButton->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->aForms[1]->id);
  
  $checkStatus=new wButton("checkstatus",$GSPAnel->dForm->buttonPane);
  $checkStatus->label="Estado";
  $checkStatus->addListener("onclick","checkStatus");
  $checkStatus->Listener["onclick"]->addParameter( XAJAX_FORM_VALUES,$GSPAnel->dForm->id);
  
  
  /* Ejecutar Paso */
  
  function ejecutarPaso($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("gsteplog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      $MSG=$task->run();
      $objResponse->assign("statusBox","value","Paso llamado a ejecucion ( {$task->ERROR} )");
      $objResponse->script("CallAllHandlers()");
      $objResponse->script("$('{$GSPAnel->aForms[1]->id}').reset()");
      $objResponse->script("xajax_wForm.requestloadFromId({$task->ID},'{$GSPAnel->aForms[1]->id}','gsteplog')");
    } 
    
    return $objResponse;
    
  }
  
  function iniciarPaso($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("gsteplog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      $task->setStatus("ini");
      $objResponse->assign("statusBox","value","Paso iniciado");
      $objResponse->script("tableGrid_{$GSPAnel->grids["gsteplog"]->id}.refresh()");
      $objResponse->script("$('{$GSPAnel->aForms[1]->id}').reset()");
      
    } 
    
    
    
    return $objResponse;
    
  }
  
  function cerrarPaso($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    $task=newObject("gsteplog",$formData["ID"]);
    
    if ($task->ID<2)
      $objResponse->script("alert('Selecciona una tarea primero')");
    else {
      $task->setStatus("ter");
      $objResponse->assign("statusBox","value","Paso iniciado");
      $objResponse->script("tableGrid_{$GSPAnel->grids["gsteplog"]->id}.refresh()");
      $objResponse->script("$('{$GSPAnel->aForms[1]->id}').reset()");
    } 
    
    return $objResponse;
    
  }
  
  function checkStatus($source,$event,$formData) {
    global $GSPAnel;
    $objResponse = new xajaxResponse();
    if ($formData["estado"]=="No Iniciada")
      return $objResponse;
    $logData="<pre>".file_get_contents("/tmp/task_{$formData["ID"]}.log")."</pre>";
    $objResponse->script('
      logWin=window.open();
      logWin.document.writeln(base64_decode("'.base64_encode($logData).'"));
      ');
    
    return $objResponse;
    
  }
  //$GSPAnel2=new GSControlPanel($LayOut,"gsteplog");
  
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
  
  ?>
