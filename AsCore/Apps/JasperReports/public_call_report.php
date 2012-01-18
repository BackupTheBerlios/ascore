<?php
function is_date($fecha){
    //Comprueba si la cadena introducida es de la forma D/m/Y (15/04/1920)
    if (ereg("([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})", $fecha, $bloques)){
        if (!checkdate($bloques[2], $bloques[1], $bloques[3])) 
            return false;
    }else{
        return false;
    }
return true;
}
function isint( $mixed )
{
    return ( preg_match( '/^\d*$/'  , $mixed) == 1 );
}
//error_reporting(E_ERROR);
require_once("JasperReports.php");

include("phpjasper/Java.inc");
java_require(dirname(__FILE__)."/phpjasper/drivers.jar");

$dir=dirname(__FILE__)."/phpjasper/Pool/";

$URLBASE=$SYS["BASE"]."/Apps/JasperReports//phpjasper/Pool/";
/*
try {*/
foreach ($_GET as $var => $dat) {
    $dati = urldecode($dat);
    $dato = str_replace("\'", "'", $dati);
    //$dato = $dat;
    if ($var != "rewrite" && $var != "petition")
    if ($var == "ROOT") {
        $atomParam=array();
        $atomParam["paraname"]="ROOT";
        $atomParam["paratype"]="Cadena";
        $atomParam["value"]=$SYS["ROOT"];
        $P[]=$atomParam;
    } else if ($var != "jasperreport") {
        $atomParam=array();
        $atomParam["paraname"]=$var;
        if (is_numeric($dato)) {
            if (isint($dato)) {
                $tipo = "Entero";
            } else {
                $tipo = "Decimal";
            }
        } else if (is_date($dato)) {
            $tipo = "Fecha";
        } else {
            $tipo = "Cadena";
        }
        $atomParam["paratype"]=$tipo;
        $atomParam["value"]=$dato;
        $P[]=$atomParam;
    } else {
        $informe = $dato;
    }
}
        $it = $URLBASE.$informe.".jrxml";
	$jcm = new JavaClass("net.sf.jasperreports.engine.JasperCompileManager");  
	$report = $jcm->compileReport($URLBASE.$informe.".jrxml");  
	
	try {
		$jfm = new JavaClass("net.sf.jasperreports.engine.JasperFillManager");  
			$Conn = new Java("org.altic.jasperReports.JdbcConnection");
			$Conn->setDriver("com.mysql.jdbc.Driver");
			$Conn->setConnectString("jdbc:mysql://localhost:3306/{$SYS["mysql"]["DBNAME"]}");			
			$Conn->setUser($SYS["mysql"]["DBUSER"]);
			$Conn->setPassword($SYS["mysql"]["DBPASS"]);
			if ($Conn->getConnection()) {	
				$parameters=new Java("java.util.HashMap");
	
				foreach ($P as $k=>$v) {
					if ($v["paratype"]=="Fecha") {
                                                ereg("([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})", $v["value"], $bloques);
						$ts1=strtotime($bloques[3]."-".$bloques[2]."-".$bloques[1]);
                                                $JAVA_PAR=new Java("java.util.Date",date("y",$ts1)+100,date("m",$ts1)-1,date("d",$ts1));
						$parameters->put($v["paraname"],$JAVA_PAR);
					} else if ($v["paratype"]=="Entero") {
						$JAVA_PAR=new Java("java.lang.Integer",(int)$v["value"]);
						$parameters->put($v["paraname"],$JAVA_PAR);
						//$parameters->put($v["paraname"],$JAVA_PAR);
				
					} else if ($v["paratype"]=="Cadena") {
						$JAVA_PAR=new Java("java.lang.String",$v["value"]);
						$parameters->put($v["paraname"],$JAVA_PAR);
					}
					
					
					
				}
								
				$parameters->put("REPORT_DIR",$URLBASE);
					
				$print = $jfm->fillReport($report,$parameters,$Conn->getConnection());  
				
				$filem=time();
                                $rutahastafichero= "/coreg2_cache/{$SYS["ASCACHEDIR"]}/$filem.pdf";
				$finalname=session_save_path().$rutahastafichero;
						
				$jem = new JavaClass("net.sf.jasperreports.engine.JasperExportManager");  
				$jem->exportReportToPdfFile($print, $finalname);  
				//echo $jem->exportReportToPdf($print);  
				ob_end_clean();
				if (file_exists($finalname)) {
					
                                        header("Content-Type: application/pdf");
					header("Content-Disposition: inline; filename=\"$informe.pdf\"");
					readfile($finalname);
                                                                           
				}
			} else {
				
				echo "Errors";
				
			}
			
			} catch (JavaException $ex) {
							$trace = new Java("java.io.ByteArrayOutputStream");
							$ex->printStackTrace(new Java("java.io.PrintStream", $trace));
							debug("java stack trace: $trace\n","red");
							ob_end_clean();
							echo "Error ";
						}

?>