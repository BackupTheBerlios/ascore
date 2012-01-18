<?php
  
  function SetStatus($status) {
    
    if ($status=="ini") {
      
      $this->estado="En Curso"; 
      $this->rini=time();
      
    } else if ($status=="can") {
      $this->estado="Cancelada";  
      $this->fin=time();
    } else if ($status=="ter") {
      $this->estado="Terminada";  
      $this->fin=time();
      
      $tl=newObject("gtasklog",$this->gtasklog_id);
      $s=newObject("gsteplog");
      $steps=$s->select("gtasklog_id={$this->gtasklog_id} AND ID<>{$this->ID}");
      $c=1;
      foreach ($steps as $k=>$v) {
        if ($v->estado=="Terminada")
          $c=$c*1;
        else
          $c=$c*0;
      }
      
      
    }
    if($this->save()) {
      if ($c>0) {
        $tl->SetStatus("ter");
      }
      return $this->ID;
    }
    else
      return false;
    
  }
  
  function runBackground() {
    
    
    
  }
  
  
  function run() {
    $this->SetStatus("ini"); 
    $this->rini=time();
    
    $status=$this->runInstance();
    if ($status) 
      $this->SetStatus("ter"); 
    else
      $this->SetStatus("can"); 
    debug("Rant $status","blue");

    return $status;
  }
  
  function runInstance() { 
    set_time_limit (0);
    /* Accion */
    $con=newObject("ghost",$this->host);
    $connection=$con->makeConnection();
    if ($connection) {
      // <tipo type="list" option="Ejecución|Espera">Tipo</tipo>
      switch ($this->tipo) {
          
        case 'Ejecucion':
          
          return $this->_run_command($connection);
          break;
          
        case 'Espera':
          
          while(!$this->_waitfor($connection)) 
            sleep(30);
          return true;
          
          
          break;
          
        case 'Crear Script':
          
          return $this->_scripting($connection);
          
          break;  
          
        default:
          break;
                          }
      
      
    }else {
      $this->ERROR="Error al ejecutar el comando";
      return false;
    }
    
    return true;
  }
  
  
  
  function _run_command($connection) {
    
    $parent=newObject("gtasklog",$this->gtasklog_id);
   $fechadeevaluacion=($parent->inicio>3600)?($parent->inicio+($this->diasderetraso*24*60*60)):($parent->inicio+($parent->diasderetraso*24*60*60));
    $comando=strtr(strftime("cd {$this->path};{$this->comando}",$fechadeevaluacion),"\n"," ");
    debug("$comando","red");
    if (!($stream = ssh2_exec($connection,"$comando; echo \"INT_RES_STATUS:$?\""))) {
      $this->ERROR="Error al ejecutar el comando";
      return false;
    } else {
      stream_set_blocking($stream, true);
      $data = "";
      while ($buf = fread($stream,4096)) {
        $data .= $buf;
      }
      fclose($stream);
      $this->TMPOUTPUT=$data;
    }
    debug("$comando; echo \"INT_RES_STATUS:$?\" $data","blue");
    $res=trim(substr($data,strpos($data,"INT_RES_STATUS")+15));
    
    /* Return values */
    if ($this->maxreturnstatus) {
      $valores_de_retorno_admitidos=explode(",",$this->maxreturnstatus);
      if (in_array($res,$valores_de_retorno_admitidos))
        $res=0;
    }
    
    if ($res!="0") {
      $this->ERROR=$this->ultimoerror="Error al ejecutar el comando $comando\n ERROR CODE:{$data}";
      
      return false;
    }
    else {
      $this->ERROR="$res";
      $this->ultimoerror="Éxito $res, $data";
      return true;
    }
    
    
    
  }
  
  
  function _waitfor($connection) {
    
    $parent=newObject("gtasklog",$this->gtasklog_id);
    $fechadeevaluacion=($parent->inicio>3600)?($parent->inicio+($this->diasderetraso*24*60*60)):($parent->inicio+($parent->diasderetraso*24*60*60));
    $fp=strftime("{$this->path}/{$this->ficheros}",$fechadeevaluacion);
    
    $comando="if [ -f $fp ]; then echo true;else echo false;fi";
    if (!($stream = ssh2_exec($connection,$comando  ))) {
      $this->ERROR="Error al ejecutar el comando";
      return false;
    } else {
      stream_set_blocking($stream, true);
      $data = "";
      while ($buf = fread($stream,4096)) {
        $data .= $buf;
      }
      fclose($stream);
    }
    
    if (trim($data)=="true") {
      $this->ultimoerror="$fp existe. ".strftime("%d-%m-%Y %H:%M:%S");;
      return true;
    }    else {
      
      $this->ERROR=$this->ultimoerror="$fp no existe ($data). ".strftime("%d-%m-%Y %H:%M:%S");
      return false;
    }
    
    
  }
  
  function _scripting($connection) {
    $parent=newObject("gtasklog",$this->gtasklog_id);
    $fechadeevaluacion=($parent->inicio>3600)?($parent->inicio+($this->diasderetraso*24*60*60)):($parent->inicio+($parent->diasderetraso*24*60*60));
    
    $fichero_destino=strftime("{$this->path}/{$this->ficheros}",$fechadeevaluacion);
    
    /* Sustitucion de variables */
    
    $script=preg_replace("/__FECHA{([^\{]{1,100}?)}/e",'strftime("$1",'.$fechadeevaluacion.')',$this->script);
    //$script=$this->script;
    debug($script,"blue");
    
    /**/
    
    $localfile="/tmp/".md5(time().serialize($_SESSION).rand(0,1000));
    $f_localfile=fopen($localfile,"wb");
    fwrite($f_localfile, $script);
    fclose($f_localfile);
    chmod($localfile,0755);
    
    if (!ssh2_scp_send($connection,$localfile,$fichero_destino)) {
      $this->ERROR="Error al copiar el script $localfile,$fichero_destino";
      return false;
    } 
    
    $this->ultimoerror="Script preparado. ".strftime("%d-%m-%Y %H:%M:%S");;
    
    if ($this->comando) {
      
      return $this->_run_command($connection);
      
      
    } 
    
    return true;
    
  }
  
  ?>