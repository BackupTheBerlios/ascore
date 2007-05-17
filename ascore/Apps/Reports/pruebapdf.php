<?php
$void_framming="yes";
require_once('Lib/lib_PDF.php');
require_once("Reports.php");
set_include_dir(dirname(__FILE__)."/../Cursos/-");
define('FPDF_FONTPATH','font/');

class myPDF extends FPDF
{
//Cargar los datos
var $angle=0;

/*function Rotate($angle,$x=-1,$y=-1)
{
	if($x==-1)
		$x=$this->x;
	if($y==-1)
		$y=$this->y;
	if($this->angle!=0)
		$this->_out('Q');
	$this->angle=$angle;
	if($angle!=0)
	{
		$angle*=M_PI/180;
		$c=cos($angle);
		$s=sin($angle);
		$cx=$x*$this->k;
		$cy=($this->h-$y)*$this->k;
		$this->_out(sprintf('q %.5f %.5f %.5f %.5f %.2f %.2f cm 1 0 0 1 %.2f %.2f cm',$c,$s,-$s,$c,$cx,$cy,-$cx,-$cy));
	}
}

function _endpage()
{
    if($this->angle!=0)
    {
        $this->angle=0;
        $this->_out('Q');
    }
    parent::_endpage();
}*/
function Header()
{
    //Put watermark
    $this->SetFont('Arial','B',50);
   //$this->SetTextColor(255,192,203);
    $this->SetTextColor(235);
    //$this->RotatedText(30,190,'C E P E S  A N D A L U C I A',45);
    $this->image('../images/cepes/JDA-marca_junta.gif',$this->x,$this->y,35,25);
    //$this->image('../images/cepes/logo.jpg',$this->x+35,$this->y-25,25,25);
    $this->image('../images/cepes/union_logo.gif',$this->x+35,$this->y-25,30,25);
}
/*
function RotatedText($x,$y,$txt,$angle)
{
    //Text rotated around its origin
    $this->Rotate($angle,$x,$y);
    $this->Text($x,$y,$txt);
    $this->Rotate(0);
}
*/
//Tabla simple
function BasicTable($header,$sectores,$opciones,$horas)
{
	
    //Cabecera
    
    $this->SetFont('Arial','B',10);
    $this->Cell(40,7,"ANÁLISIS SEGUN LA DURACIÓN DEL CURSO ",0,1);	
    
    $this->Cell(40,7,"",0,1);
    foreach($header as $col)
    {
    
	$this->Cell(30,10,$col,1,0,'C');
	
    }	
    $this->Ln();
	//Datos
	$c=newObject("curso");
	
	
    	foreach($opciones as $i=>$opcion)
	{
		
		$this->Cell(30,7,$opcion,1,0);
		$RES["{$i}cc"]=$c->countCursos($horas[$i]);
		$RES["{$i}ca"]=$c->countAlumnos($horas[$i]);
		$RES["cctotal"]+=$RES["{$i}cc"];
		$RES["catotal"]+=$RES["{$i}ca"];
		$this->SetFont('Arial','',10);
		$this->Cell(30,7,$RES["{$i}cc"],1,0,'C');
		$this->Cell(30,7,$RES["{$i}ca"],1,1,'C');
		$this->SetFont('Arial','B',10);
		
	}
	$this->Cell(30,7,"",0,2);
	$this->Cell(30,7,"Totales",1,0,'C');
	$this->Cell(30,7,$RES["cctotal"],1,0,'C');
	$this->Cell(30,7,$RES["catotal"],1,1,'C');

}


function TablaPerfil($opcedad,$perfil,$sexo)
{


//Datos

//NIVEL DE ESTUDIOS
$q_secob="(egb='Si' OR eso='Si'OR bachillere='Si' OR certesc='Si' )";
$q_sec="(bup='Si' OR eso='Si'OR bachillers='Si' OR fp1='Si' OR fp2='Si' OR fpmed='Si' OR cou='Si' OR preu='Si')";
$q_uni="(unimed='Si' OR unisup='Si')";
$q_sinalf="sinalf='Si'";

$corte=array(
	"sin-alfabetizar"=>$q_sinalf,
	"ens-sec-obl"=>"($q_secob AND NOT ($q_sec) AND NOT ($q_uni))",
	"ens-sec"=>"($q_sec AND NOT ($q_uni))",
	"universitario"=>$q_uni);
$opcnivel=array(
	"sin-alfabetizar"=>"Sin estudios",
	"ens-sec-obl"=>"Secundarios Obligatorios",
	"ens-sec"=>"Secundarios",
	"universitario"=>"Universitarios",
	"tot"=>"Total"
	);

//ANTIGUEDAD EN EL PARO
$date6m=time()-(30*6*(60*60*24));
$date1a=$date6m*2;
$date2a=$date1a*2;

$qparado=array(
	"menos1"=>"fechaalt_sol<'$date1a' AND perfil_sol <> 'Trabajador en activo'",
	"1-2"=>"fechaalt_sol>'$date1a' AND fechaalt_sol<'$date2a' AND perfil_sol <> 'Trabajador en activo'",
	"2mas"=>"fechaalt_sol>'$date2a' AND perfil_sol <> 'Trabajador en activo'");
	
$parado=array(
	"menos1"=>"Menos 1 años",
	"1-2"=>"Entre 1 y 2 años",
	"2mas"=>"2 o mas años"
	);


//EDAD
$d=date("d");
$m=date("m");
$y=date("Y");
$datex25=text_to_int_ext("$d/$m/".($y-25));
$datex45=text_to_int_ext("$d/$m/".($y-45));

$qedad=array(
	"25"=>"fecha_nac>=$datex25",
	"25-45"=>"fecha_nac<$datex25 AND fecha_nac>=$datex45",
	"45"=>"fecha_nac<$datex45"
	);
	
//SITUACION LABORAL
$qslaboral=array(
	"ocupados"=>"perfil_sol='Trabajador en activo'",
	"parados"=>"(perfil_sol='Desempleado mayor de 25 años' OR perfil_sol='Desempleado entre 25 y 30 años' OR perfil_sol='Desempleado mayor de 30 años')",
	"otros"=>"perfil_sol='nada'"
	);
	
$slaboral=array(
	"ocupados"=>"Ocupados",
	"parados"=>"Parados",
	"otros"=>"Otros"
	);
	
//SEXO
$qsexo=array(
	"Hombre"=>"sexo_sol='Hombre'",
	"Mujer"=>"sexo_sol='Mujer'"
	);

	
//PAGINA

$s=newObject("solicitud");
$contedad=1;
$base="adjudicada='Si'";
$this->SetFont('Arial','B',10);
$this->Cell(48,20,"ANÁLISIS DEL PERFIL DEL ALUMNADO",0,1);
$this->SetFont('Arial','',10);
$this->Cell(48,20,"",0);
$this->Cell(44,20,"",0);
	foreach($sexo as $fsexo)
	{
		$this->Cell(30,8,$fsexo,1,0,'C');
	}
	
	
	$this->Cell(30,8,"TOTAL",1,1,'C');
	$this->Cell(48,20,"EDAD",1,0,'C');
		foreach ($qedad as $t=>$fedad) 
		{
			if($contedad>1)
				$this->Cell(48,20,"",0,0,'C');
				
			
			$this->Cell(44,5,$opcedad[$t],1,0,'L');
			
			
			foreach ($qsexo as $i=>$fsexo) 
			{
				
				$query="$base AND $fedad AND $fsexo";
				$s->searchResults=$s->select($query,$offset,$sort);
				
				$RES[$t][$i]=$s->nRes+0;
						
				if($i=="Hombre")
				{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$hombretotal+=$RES[$t][$i];
					$cedad+=$RES[$t][$i];
				}else
				{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$mujertotal+=$RES[$t][$i];
					$cedad+=$RES[$t][$i];
				}
				
				
				
			}
			if($cedad==0)$cedad="0";
			$this->Cell(30,5,$cedad,1,1,'C');
			$contedad++;
			$cedad=0;
			
		}
		$total=$hombretotal+$mujertotal;
		$this->SetFont('Arial','B',10);
		$this->Cell(48,20,"",0,0,'C');
		$this->Cell(44,5,"Total",1,0,'L');
		$this->Cell(30,5,$hombretotal,1,0,'C');
		$this->Cell(30,5,$mujertotal,1,0,'C');
		$this->Cell(30,5,$total,1,1,'C');
		$this->SetFont('Arial','',10);
	$hombretotal=0;
	$mujertotal=0;
	$total=0;	
	
	$this->Cell(48,25,"NIVEL DE ESTUDIOS",1,0,'C');	
	$contnivel=1;
	
	
	foreach ($corte as $t=>$fcorte) 
	{
			if($contnivel>1)
				$this->Cell(48,20,"",0,0,'C');
				
			
			$this->Cell(44,5,$opcnivel[$t],1,0,'L');
			
			foreach ($qsexo as $i=>$fsexo) 
			{	
				$query="$base AND $fcorte AND $fsexo";
				$s->searchResults=$s->select($query,$offset,$sort);
				$RES[$t][$i]=$s->nRes+0;
				
				
				if($i=='Hombre')
				{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$hombretotal+=$RES[$t][$i];
					$cedad+=$RES[$t][$i];
				}else{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$mujertotal+=$RES[$t][$i];
					$cedad+=$RES[$t][$i];
				}
			
			
				
				
			}
			if($cedad==0)$cedad="0";
			$this->Cell(30,5,$cedad,1,1,'C');
			$cedad=0;
			//$ct=0;
		
		
		
		
		
		//$this->Cell(30,5,"0",1,1,'C');
		$contnivel++;
	}
	$this->SetFont('Arial','B',10);
	$total+=($hombretotal + $mujertotal);
	$this->Cell(48,20,"",0,0,'C');
	$this->Cell(44,5,"Total",1,0,'L');
	$this->Cell(30,5,"$hombretotal",1,0,'C');
	$this->Cell(30,5,"$mujertotal",1,0,'C');
	$this->Cell(30,5,"$total",1,1,'C');
	$this->SetFont('Arial','',10);
	$hombretotal=0;
	$mujertotal=0;
	$total=0;
	
	$cslab=1;
	$this->Cell(48,20,"SITUACIÓN LABORAL",1,0,'C');
	foreach($qslaboral as $t=>$fslaboral)
	{
		if($cslab>1)
			$this->Cell(48,20,"",0,0,'C');
			
		$this->Cell(44,5,$slaboral[$t],1,0,'L');
		
		foreach ($qsexo as $i=>$fsexo) 
			{	
				$query="$base AND $fslaboral AND $fsexo";
				$s->searchResults=$s->select($query,$offset,$sort);
				$RES[$t][$i]=$s->nRes+0;
				
				
				if($i=='Hombre')
				{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$hombretotal+=$RES[$t][$i];
					$csit+=$RES[$t][$i];
				}else
				{
					if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
					$mujertotal+=$RES[$t][$i];
					$csit+=$RES[$t][$i];
				}
			
			
				
				
			}
			if($csit==0)$csit="0";
			$this->Cell(30,5,$csit,1,1,'C');
			$csit=0;
		
		
		$cslab++;
	}
	$total=$hombretotal + $mujertotal;
	$this->SetFont('Arial','B',10);
	$this->Cell(48,20,"",0,0,'C');
	$this->Cell(44,5,"Total",1,0,'L');
	$this->Cell(30,5,"$hombretotal",1,0,'C');
	$this->Cell(30,5,"$mujertotal",1,0,'C');
	$this->Cell(30,5,"$total",1,1,'C');
	$this->SetFont('Arial','',10);
	$hombretotal=0;
	$mujertotal=0;
	$total=0;
	
	
	$cparado=1;
	$this->Cell(48,20,"ANTIGÜEDAD EN EL PARO",1,0,'C');
	foreach($qparado as $t=>$fparado)
	{
		if($cparado>1)
			$this->Cell(48,20,"",0,0,'C');
			
		$this->Cell(44,5,$parado[$t],1,0,'L');
		
		foreach ($qsexo as $i=>$fsexo) 
		{	
			$query="$base AND $fparado AND $fsexo";
			$s->searchResults=$s->select($query,$offset,$sort);
			$RES[$t][$i]=$s->nRes+0;
			if($i=='Hombre'){
				if($RES[$t][$i]==0)$RES[$t][$i]="0";
				$this->Cell(30,5,$RES[$t][$i],1,0,'C');
				$hombretotal+=$RES[$t][$i];
				$cpar+=$RES[$t][$i];
			}else{
				if($RES[$t][$i]==0)$RES[$t][$i]="0";
					$this->Cell(30,5,$RES[$t][$i],1,0,'C');
				$mujertotal+=$RES[$t][$i];
				$cpar+=$RES[$t][$i];
			}
			
		
				
				
	}
		if($cpar==0)$cpar="0";
			$this->Cell(30,5,$cpar,1,1,'C');
		$csit=0;
		$cparado++;
}
	$total=$hombretotal + $mujertotal;
	$this->Cell(48,20,"",0,0,'C');
	$this->SetFont('Arial','B',10);
	$this->Cell(44,5,"Total",1,0,'L');
	$this->Cell(30,5,"$hombretotal",1,0,'C');
	$this->Cell(30,5,"$mujertotal",1,0,'C');
	$this->Cell(30,5,"$total",1,1,'C');
	$this->SetFont('Arial','',10);
	

	
}

	
function TablaSectores()
{
//NUMERO DE TRABAJADORES
$trabajadores=array(
	"<10"=>"Hasta 10 trabajadores",
	"1150"=>"De 11 a 50 trabajadores",
	"51250"=>"51 - 250 trabajadores ",
	">250"=>" > 250 trabajadores"
	);	
//DATOS	
$datos=array("Personas","Empresas","Horas");	
$sectores=array("AGRICULTURA","INDUSTRIA","CONSTRUCCIÓN","SERVICIOS");
$actividades=array("Medio ambiente","Sociedad de la Información","Formación Práctica","Totales");


//PAGINA
		$this->SetFont('Arial','B',10);
		$this->Cell(30,8,"ANÁLISIS SEGUN SECTORES",0,1);
		$this->Cell(40,7,"",0,1);
		$this->SetFont('Arial','B',8);
		$this->Cell(30,8,"SECTOR",1,0,'C');
		$this->Cell(40,8,"ACTIVIDAD",1,0,'C');
		$contrab=1;
		foreach($trabajadores as $numtrab)
		{
			if($contrab<4)
			{
				$this->Cell(51,4,$numtrab,1,0,'C');
				$contrab++;
			}else
				$this->Cell(51,4,$numtrab,1,1,'C');
		}
		
		$this->Cell(30,8,"",0,0,'C');
		$this->Cell(40,8,"",0,0,'C');
		$contdat=1;
		$this->SetFont('Arial','',8);
		for($i=1;$i<5;$i++)
		{
			foreach($datos as $qdatos)
			{
				if(($contdat<12)&&($i<5))
				{
					$this->Cell(17,4,$qdatos,1,0,'C');	
					$contdat++;
				}else
					$this->Cell(17,4,$qdatos,1,1,'C');
			}
		}
		//$this->SetFont('Arial','',10);
		
		foreach($sectores as $fsectores)
		{
			$contact=1;
			$this->SetFont('Arial','B',8);
			$this->Cell(30,16,$fsectores,1,0,'L');
			
			foreach($actividades as $factividades)
			{	
				if($factividades=="Totales")
				{
					$this->SetFont('Arial','B',8);
					$this->Cell(30,8,"",0,0,'L');
					$this->Cell(40,4,$factividades,1,0,'L');
				}else
				{
				$this->SetFont('Arial','',8);
				if($contact>1)
				$this->Cell(30,8,"",0,0,'L');
								
				$this->Cell(40,4,$factividades,1,0,'L');
				}
				for($i=0;$i<11;$i++)
				{
				$this->Cell(17,4,"0",1,0,'R');
				}
				$this->Cell(17,4,"0",1,1,'R');
				$contact++;
			}
			//$this->SetFont('Arial','',10);
		}
	
		
}


function TablaBeneficiarios()
{

$s=newObject("solicitud");
$datex25=text_to_int_ext("$d/$m/".($y-25));
$datex45=text_to_int_ext("$d/$m/".($y-45));

$date6m=time()-(30*6*(60*60*24));
$date1a=$date6m*2;
$date2a=$date1a*2;

/* Condiciones */
$base="adjudicada='Si' $precond";
$perfil_sol=array(
	"Trabajador"=>"perfil_sol='Trabajador en activo'",
	"Desempleado1"=>"((perfil_sol='Desempleado menor de 25 años' AND fechant_sol>$date6m) OR (perfil_sol='Desempleado entre 25 y 30 años' AND fechant_sol>$date1a) OR (perfil_sol='Desempleado mayor de 30 años' AND fechant_sol>$date1a))",
	"Desempleado2"=>"((perfil_sol='Desempleado menor de 25 años' AND fechant_sol>$date6m) OR (perfil_sol='Desempleado entre 25 y 30 años' AND fechant_sol<$date1a AND fechant_sol>$date2a) OR (perfil_sol='Desempleado mayor de 30 años' AND fechant_sol<$date1a AND fechant_sol>$date2a))",
	"Desempleado3"=>"(perfil_sol<>'Trabajador en activo' AND fechant_sol<$date2a)"
);

$q_secob="(egb='Si' OR eso='Si'OR bachillere='Si' OR certesc='Si' )";
$q_sec="(bup='Si' OR eso='Si'OR bachillers='Si' OR fp1='Si' OR fp2='Si' OR fpmed='Si' OR cou='Si' OR preu='Si')";
$q_uni="(unimed='Si' OR unisup='Si')";
$q_sinalf="sinalf='Si'";

$edad=array(
	"25"=>"fecha_nac>=$datex25",
	"25-40"=>"fecha_nac<$datex25 AND fecha_nac>=$datex45",
	"45"=>"fecha_nac<$datex45"
	);
$sexo=array(
	"hombre"=>"sexo_sol='Hombre'",
	"mujer"=>"sexo_sol='Mujer'"
	);


$corte=array(
	"sin-alfabetizar"=>$q_sinalf,
	"ens-sec-obl"=>"($q_secob AND NOT ($q_sec) AND NOT ($q_uni))",
	"ens-sec"=>"($q_sec AND NOT ($q_uni))",
	"universitario"=>$q_uni);


	$dsexo=array(
		"hombre"=>"Hombres",
		"mujer"=>"Mujeres"
		);
	$dedad=array(
		"<25"=>"< 25 años",
		"2545"=>"25-45 años",
		">45"=>">45 años"
		);
		
	$dperfil_sol=array(
		"Trabajador"=>"Ocupados",
		"Desempleado1"=>"Desempleados menos de 1 año o jóvenes menos de 6 meses",
		"Desempleado2"=>"Desempleados entre 1 y 2 años o jóvenes entre 6 meses y 2 años",
		"Desempleado3"=>"Desempleados más de 2 años",
		"ben5"=>"Situaciones especiales"
		);	
		
	$dcorte=array(
		"sin-alfabetizar"=>"Sin estudios",
		"ens-sec-obl"=>"Secundarios Obligatorios",
		"ens-sec"=>"Secundarios",
		"universitario"=>"Universitarios"
		);	
		
		
		
	$this->Cell(50,10,'SEGUIMIENTO DE ACTUACIONES DEL FONDO SOCIAL EUROPEO (ANEXO 5)',0,1);
	$this->Cell(50,10,'INFORME ESTADISTICO DE LOS CURSOS SUBVENCIONADOS EN '.date("Y"),0,1);
	$this->Cell(25,10,'Expediente (Expediente)',0,1);
	$this->Cell(50,10,'Entidad:CEPES ANDALUCIA',0,1);
	$this->SetFont('Arial','B',10);
	$this->Cell(30,7,'ANÁLISIS DE BENEFICIARIOS',0,1);
	
	foreach($dsexo as $fsexo)
	{
		$this->SetFont('Arial','B',8);
		
		if($fsexo=="Hombres")
		{
		$this->Cell(126,7,'',0,0);
		$this->Cell(68,4,$fsexo,1,0,'C');
		}else
		$this->Cell(68,4,$fsexo,1,1,'C');
		$this->SetFont('Arial','',8);
		
		
	}
	$this->Cell(126,7,'',0,0);
	for($i=0;$i<2;$i++)
	{
		foreach($dedad as $fedad)
		{
		$this->Cell(17,4,$fedad,1,0,'C');
		}
		if($i==1)
			$this->Cell(17,4,'TOTAL',1,1,'C');
		else
			$this->Cell(17,4,'TOTAL',1,0,'C');
	}
	
		
		
		foreach ($perfil_sol as $t=>$qperfil)
		 {
		 	$this->Cell(86,20,$dperfil_sol[$t],1,0,'L');
			$concorte=1;
			foreach ($corte as $i=>$qcorte)
			 {
			 	if($concorte>1)
				{
				$this->Cell(86,20,'',0,0,'L');
				
				}
			 	$this->Cell(40,4,$dcorte[$i],1,0,'L');
				foreach ($sexo as $j=>$qsexo) 
				{
					foreach ($edad as $k=>$qedad)
					 {
						$query="$base AND $qperfil AND $qcorte AND $qedad AND $qsexo";
						$s->searchResults=$s->select($query,$offset,$sort);
						
						$RES[$t][$i][$j][$k]=$s->nRes+0;
						$RES["{$j}{$k}total"]+=$RES[$t][$i][$j][$k];
						$ck=$RES[$t][$i][$j][$k];
						$RES["{$i}total"]+=$ck;
						$total+=$ck;
						
						if($RES[$t][$i][$j][$k]==0)
						$this->Cell(17,4,'0',1,0,'C');
						else
						$this->Cell(17,4,$RES[$t][$i][$j][$k],1,0,'C');
						
						
						//$RES["{$j}{$k}total"]+=$ck;
						
					}
					
					if($dsexo[$j]=='Mujeres')
					{
						if($total==0)
							$this->Cell(17,4,'0',1,1,'C');
						else
							$this->Cell(17,4,$total,1,1,'C');
					}else{
						if($total==0)
							$this->Cell(17,4,'0',1,0,'C');
						else
							$this->Cell(17,4,$total,1,0,'C');
					}
					$ck=0;
					$total=0;
				}
				$concorte++;
				//$RES["{$i}total"]+=$total;
				
			}
			
			$hombretotal=0;
			$mujertotal=0;
			$this->Cell(86,20,'',0,0,'L');
			$this->SetFont('Arial','B',8);
			$this->Cell(40,4,'TOTAL',1,0,'L');
			foreach ($sexo as $j=>$qsexo) 
			{
				foreach ($edad as $k=>$qedad)
				{	if($RES["{$j}{$k}total"]==0)
						$this->Cell(17,4,"0",1,0,'C');
					else
					$this->Cell(17,4,$RES["{$j}{$k}total"],1,0,'C');
					$RES["total"]+=$RES["{$j}{$k}total"];
					$RES["{$j}{$k}total"]=0;
					
				}
				if($dsexo[$j]=='Mujeres')
				{
					if($RES["total"]==0)
						$this->Cell(17,4,'0',1,1,'C');
					else
						$this->Cell(17,4,$RES["total"],1,1,'C');
				}else{
					if($RES["total"]==0)
						$this->Cell(17,4,'0',1,0,'C');
					else
						$this->Cell(17,4,$RES["total"],1,0,'C');
				}
				$RES["total"]=0;
			}
			$this->SetFont('Arial','',8);
			$RES["{$i}total"]=0;
		}	
		
		
	
	

}



}
$pdf=new myPDF();
//Títulos de las columnas
//$header=array('País','Capital','Superficie (km2)','Pobl. (en miles)');
$sectores=array('Agricultura','Industria','Construcción','Servicios');
$perfil=array("EDAD","NIVEL DE ESTUDIOS","SITUACION LABORAL","ANTIGUEDAD EN EL PARO");


$opcedad=array(
	"25"=>"Menos de 25",
	"25-45"=>"Entre 25-45",
	"45"=>"Mayores de 45",
	"tot"=>"Total"
	);
	

$opciones=array(
	"<40"=>" <40 Horas ",
	"4090"=>" 40 a 90 Horas ",
	"100350"=>" 100 a 350 Horas ",
	">350"=>" >350 Horas ");
$horas=array(
	"<40"=>"horas < 40",
	"4090"=>"horas >40 AND horas < 90",
	"100350"=>"horas > 100 AND horas < 350",
	">350"=>"horas > 350");
$sexo=array(
	"Hombre"=>"HOMBRES",
	"Mujer"=>"MUJERES"
	);
$header=array('DURACIÓN','Nº CURSOS','Nº ALUMNOS');
$headersec=array('SECTOR','ACTIVIDAD');
$sectores=array('AGRICULTURA','INDUSTRIA','CONSTRUCCION','SERVICIOS');

//Carga de datos
//$data=$pdf->LoadData('paises.txt');

$pdf->SetFont('Arial','',14);

$pdf->AddPage();
$pdf->BasicTable($header,$sectores,$opciones,$horas);
$pdf->AddPage();
$pdf->SetFont('Arial','',10);
$pdf->TablaPerfil($opcedad,$perfil,$sexo,$edad);
$pdf->AddPage('L');
$pdf->TablaSectores();
$pdf->AddPage('L');

$pdf->SetFont('Arial','',10);
$pdf->TablaBeneficiarios();
$pdf->Output();
?> 