<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function Save() {
    
        //$this->fecha_pub=time();
        $f=newObject("fileh");
	$f->CaptureFile='foto';
    
	$par=new Ente($this->name);
	$par=typecast($this,"Ente");
	return $par->save();
        
}
?>
