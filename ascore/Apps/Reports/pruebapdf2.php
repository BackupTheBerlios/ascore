<?php
define('FPDF_FONTPATH','font/');
require('rotation.php');

class PDF extends PDF_Rotate
{
function Header()
{
    //Put watermark
    $this->SetFont('Arial','B',50);
   //$this->SetTextColor(255,192,203);
      $this->SetTextColor(235);
    $this->RotatedText(30,190,'Propiedad de Activa Sistemas S.Coop',45);
}

function RotatedText($x,$y,$txt,$angle)
{
    //Text rotated around its origin
    $this->Rotate($angle,$x,$y);
    $this->Text($x,$y,$txt);
    $this->Rotate(0);
}
}

$pdf=new PDF();
$pdf->Open();
$pdf->AddPage();
$pdf->SetFont('Arial','',12);
$txt='Este documento es propiedad de Activa Sistemas S.Coop Andaluza ';
for($i=0;$i<25;$i++) 
    $pdf->Write(5,$txt);
    $pdf->Ln(20);
$pdf->Output();
?> 