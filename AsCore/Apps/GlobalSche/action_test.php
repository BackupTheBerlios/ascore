<?php
  
  
  require("GlobalSche.php");
  
  set_include_dir(dirname(__FILE__)."/../../Framework/Extensions/xajax/-");
  if ((empty($_POST))&&(!$_GET["oDataRequest"]))
    require('Extensions/wGui/wGui.includes.php');
  include 'xajax_core/xajax.inc.php';
  require_once("Extensions/wGui/wUI.php");
  require_once("gspanel_class.php");
  
  $xajax = new xajax();
  
  $FormWindow=new wWindow("FormWindow");
  $FormWindow->title="Tareas Definidas";
  $FormWindow->setCSS("width","900px");
   $FormWindow->type=WINDOW.FIXED;
  $GSPAnel=new GSControlPanel($FormWindow,"Tareas","gtask");
  $GSPAnel->addTab("Pasos","gstep","gtask_id");
  
  
  if ((empty($_POST))&&(!$_GET["oDataRequest"])){
    $FormWindow->render();
    $xajax->printJavascript($SYS["ROOT"]."/Framework/Extensions/xajax");
    
  } else if ($_GET["oDataRequest"]) {
    $GSPAnel->aj_RequestData($_GET["instance"]);
  }
  else {
    $xajax->processRequest();
  }
  
  ?>