<?php
  
  require_once("coreg2.php");
  $SYS["PROJECT"]="GlobalSche";
  
  set_include_dir(dirname(__FILE__)."/local/Tmpl/-");
  set_include_dir(dirname(__FILE__)."/-");
  set_include_dir(dirname(__FILE__)."/../Memo/-");
  set_include_dir(dirname(__FILE__)."/../../Framework/Extensions/xajax/-");
  
  
  function generateJobsToday() {
    setlimitRows(150000);
    $d=newObject("gtasklog");
    $d->deletes("estado='No iniciada' AND inicio>".dateTodayStamp());
    $u=newObject("gtask");
    $ids=$u->allID();
    $d=array();
    $tasks=array(1);
    
    foreach ($ids as $id) {
      $o=newObject("gtask",$id);
      $cron = new Parser($o->getCronString());
      $RunsToday=$cron->getRuns(time());
      
      foreach ($RunsToday as $timeStampOfRun){
        //echo strftime("%d/%m/%Y %H:%M",$cron_ran)." # ".$cron_ran;
        $tl=newObject("gtasklog");  
        $tasklog=$tl->getByTaskDate($o,$timeStampOfRun);
        if ($tasklog) {
          $tasks[]=$tasklog->ID;
          //print_r($tasklog);
        } else {
          //
          $tl=newObject("gtasklog");
          $tl->etiqueta=$o->titulo."@".strftime("%Y%m%d");
          $tl->tipo='Desde Definición';
          $tl->gtask_id=$id;
          $tl->schedule_id=$o->schedule_id;
          $tl->inicio=$timeStampOfRun;
          $tl->estado='No iniciada';
          $tl->automatica=$o->automatica;
          $tl->emailconfirmacion=$o->emailconfirmacion;
          $tl->departamento=$o->departamento;
          $tl->diasderetraso=$o->diasderetraso;
          $tasks[]=$tl->save();
          
        }
      }
      
    }
    resetlimitRows();
  }
  ?>