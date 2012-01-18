<?php
  
  function save()
  {
    global $prefix;
    debug("Info: Calling Extended save");
    if ($this->example_id<2) {
      $this->ERROR="No hay ejemplo seleccionado";
      return false;
    }
    
    $par = new Ente($this->name);
    $par = typecast($this, "Ente");
    //dataDump($par);
    return $par->save();
  }
  
  ?>