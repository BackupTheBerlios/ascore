<?php
/*
function save()
{	
	for($i = 0 ; $i < count($this->b_categoria_id); $i++)
	{
		$a=newObject('b_libro_categoria');
		$a->b_libro_id = $this->ID;
		$a->b_categoria_id = $this->b_categoria_id[$i];
		$a->save();
		echo "..";
	}


	//dataDump($this);
	$par=new Ente($this->name);
	$par=typecast($this,"Ente");
	//dataDump($par);
	return $par->save();
}*/

function GetCategoryTree()
{
	$a=newObject('b_categoria');
	$a->searchResults=$a->selectAll($offset,$sort);
	$this->b_categoria_id = array();
	//$this->nombre_cat = array();
	$i = 0;
	echo '<br>';
	foreach($a->searchResults as $key)
	{	
		$this->b_categoria_id['ID'][$i] = $key->ID;
		echo $this->b_categoria_id['ID'][$i].'|';
		$this->b_categoria_id['nombre_cat'][$i] = $key->nombre_cat;
		echo $this->b_categoria_id['nombre_cat'][$i].'|';
		$b=newObject('b_libro_categoria');
		$b->searchResults=$b->select("b_libro_id=".$this->ID." AND b_categoria_id=".$key->ID);
		if($b->searchResults){
			$this->b_categoria_id['selected'][$i] = 1;
		}
		else{
			$this->b_categoria_id['selected'][$i] = 0;
		}
		echo 'selected: '.$this->b_categoria_id['selected'][$i].'<br>';
		$i++;
	}	
	/*
	$a=newObject('b_libro_categoria');
	$a->searchResults=$a->select("b_libro_id=".$this->ID);
	$i = 0;
	$e=newObject("b_categoria");	
	$d=array(	
	"b_cat_padre_id"=>$e->listAll("nombre_cat")
	);
	plantHTML($c,'add_cat',$d);
	foreach($a->searchResults as $key)
	{	
		$this->b_categoria_id = array();
		$this->nombre_cat = array();
		$this->b_categoria_id[$i] = $key->b_categoria_id;
		$b=newObject('b_categoria',$key->b_categoria_id);
		$this->nombre_cat[$i] = $b->nombre_cat;
		$i++;
	}
	*/
	return true;	
}

?>