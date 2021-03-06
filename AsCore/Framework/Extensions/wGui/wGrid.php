<?php
  
  class wGrid extends wObject implements wRenderizable {
    
    var $name="";
    var $type=0;
    var $dataModel=array();
    private $counter=0;
    var $DataURL;
    var $columns;
    var $title;
    var $width;
    var $actionOnSelectID="a=1";
    
    
    
    function __construct($name=null,&$parent) {
      parent::__construct($name,$parent);
      $this->name=$name;
      
      define("LAYOUT.VERTICAL",0);
      define("LAYOUT.HORIZONTAL",1);
      $this->setWidth(640);
      
    }
    
    function addColumn($col) {
      
      $this->columns[]=$col;
      
    }
    
    function render() {
      
      
      echo '<div style="position:relative">
        <span onclick=\'$("'.$this->id.'").style.width="90px"\' style="cursor:pointer;font-size:19px;margin-right:5px"> . </span>
        <span onclick=\'$("'.$this->id.'").style.width="595px"\' style="cursor:pointer;font-size:19px;margin-right:5px"> .. </span>';
      echo "<span onclick=\"tableGrid_{$this->id}.tableModel.options.width='1000px';$('{$this->id}').style.width='1000px';tableGrid_{$this->id}_restart()\" style='cursor:pointer;font-size:19px;'> ... </span>";
      echo "<span onclick='tableGrid_{$this->id}_restart()' style='cursor:pointer;font-size:19px;right:0px;position:absolute'>O</span>
        </div>";
      echo "<!-- START OF GRID -->\n<div id='{$this->id}' style='{$this->cssStyle}'>";
      echo "<script>\n";
      echo "var datos_{$this->id} = new Array();\n";
      echo "var columna_{$this->id}= new Array();\n";
      echo "var columnaT_{$this->id}= new Array();\n";
      echo "columnaT_{$this->id}=".javascript_encode($this->columns).";";
      $tableModel=array(
        "options"=>array(
          "width"=>$this->width,
          "title"=>$this->title,
          "pager"=>array(
            "pageParameter"=>'page'
          ),
          "addSettingBehavior"=>false,
          "rowClass"=>"#ChangeRowStyle#"
        ),
        "columnModel"=>"#columnaT_{$this->id}#",
        "url"=>"{$this->DataURL}"
        //,"afterRender"=>"#new function() {alert('{$this->id}')}#"
        
      );
      echo ";\nvar tableModel_{$this->id}=".javascript_encode($tableModel).";\n";  
      /*  
      var tableModel_<?php echo $this->id?> = {
      options : {
      width: '<?php echo $this->width?>',
      title: '<?php echo $this->title?>',
      pager: {
      pageParameter : 'page'
    },
      addSettingBehavior : true,
      rowClass : function(rowIdx) {
      var className = '';
      if (rowIdx % 2 == 0) {
      className = 'hightlight';
    }
      return className;
    },
      
    },
      columnModel : columnaT_<?php echo $this->id?>,
      
      url: '<?php echo $this->DataURL?>'
      
      
    };*/
      
      echo "\nvar tableGrid_{$this->id}=null;\nvar tableGrid_{$this->id}_storedvalue=1;";
      echo "  
        EventHandlers[cEventHandlers]=function() {
        parNode=document.getElementById('{$this->id}');
        if (parNode.offsetHeight>0) {
        if (tableGrid_{$this->id}!=null) {
        tableGrid_{$this->id}.refresh();
        
        setTimeout('tableGrid_{$this->id}.setValueAt(true,0,parseInt(tableGrid_{$this->id}_storedvalue),true)', 500);
        //tableGrid_{$this->id}.setValueAt(true,0,parseInt(tableGrid_{$this->id}_storedvalue),true);
        }
        else {
        tableGrid_{$this->id} = new MyTableGrid(tableModel_{$this->id});
        tableGrid_{$this->id}.render('{$this->id}');
        
        }
        }
        }
        cEventHandlers++;
        
        function tableGrid_{$this->id}_restart() {
        
        tableGrid_{$this->id} = new MyTableGrid(tableModel_{$this->id});
        tableGrid_{$this->id}.render('{$this->id}');
        setTimeout('tableGrid_{$this->id}.setValueAt(true,0,parseInt(tableGrid_{$this->id}_storedvalue),true)', 500);
        }
        ";
      
      echo "</script></div>";
    }
    
    function setWidth($w) {
      
      $this->width="{$w}px";
      $this->setCSS("width",$this->width);
    }
    
    function _setDefaults() {
      /* Some default properties */
      $this->setCSS("border","1px solid gray");
      //$this->setCSS("margin","5px");
      $this->setCSS("width",$this->width);
      $this->setCSS("height","550px");
      $this->setCSS("overflow","hidden");
      $this->setCSS("position","left");
    }
    
    function setDataModel($model) {
      // stub 
      
    }
    
    function setDataModelFromCore($object) {
      
      $columns[]=array(
        "id"=>"grid_ID",'title'=>'id','width'=>'30','editable'=>true,'editor'=>
        "#new MyTableGrid.CellRadioButton({onClickCallbackAlt:function(a,b,c) {tableGrid_{$this->id}_storedvalue=c.substr(12)},onClick: function(value, checked) {{$this->actionOnSelectID}}})#"
      );
      foreach ($object->properties_type as $name=>$desc) {
        $width=0;
        if (strpos($desc,"password")===0) 
          continue;
        if (strpos($name,"S_")===0) 
          continue;
        if (strpos($desc,"string:")===0)  {
          $width=ceil(substr($desc,7)*2.5);
        }
        if ($width>500)
          continue;
        
        $columns[]=array(
          "id"=>"grid_$name",
          'title'=>$object->properties_desc[$name],
          'width'=>($width<120)?120:$width,
          'editable'=>false,
          'hidden'=>true,
          //'type'=>"$type"
          //'editor'=>''
        );  
        
      }
      
      $this->columns=$columns;
      
      
    }
    
    /* 
    
    Prepares  data to be exported via json. 
    
    $resultados = array of core objects
    $nRes       = number of results
    $pagina     = page to retrieve
    
    */
    static function prepareGridData($resultados,$nRes,$pagina=1)  {
      error_reporting(E_ERROR);
      global $SYS;
      while (@ob_end_clean());
      header('Content-Type: application/json');
      
      foreach ($resultados as $linea=>$row) {
        $result[$linea]["grid_ID"]=$row->ID;
        
        foreach($row->properties_type as $nombreCampo=>$tipoCampo) {
          
          if(strpos($tipoCampo,"ref")===0){
            $refData=explode(":",$tipoCampo);
            if (sizeof($refData)>=3) {
              $result[$linea]["grid_$nombreCampo"]=($row->get_ext($refData[1],$row->$nombreCampo,$refData[2]));
            }
            else
              $result[$linea]["grid_$nombreCampo"]=($row->$nombreCampo);
          }
          else if (strpos($tipoCampo,"date")!==false) {
            if ($row->$nombreCampo>10000) {
              $format=substr($tipoCampo,strpos($tipoCampo,":")+1);
              $result[$linea]["grid_$nombreCampo"]=(strftime(($format)?$format:"%d/%m/%Y",$row->$nombreCampo)); 
            }
            else
              $result[$linea]["grid_$nombreCampo"]="" ;
          }
          else{   
            $result[$linea]["grid_$nombreCampo"]=($row->$nombreCampo);
          } 
        }
        
      }
      
      if (!$result)
        $result=array();
      
      $Gfrom=($pagina-1)*$SYS["DEFAULTROWS"]+1;
      $Gto=$Gfrom+$SYS["DEFAULTROWS"]-1;
      if ($Gto>$nRes)
        $Gto=$nRes;
      
      if ($pagina>ceil($nRes/$SYS["DEFAULTROWS"]))
        $pagina=ceil($nRes/$SYS["DEFAULTROWS"]);
      
      $GPages=ceil($nRes/$SYS["DEFAULTROWS"]);
      $response=array(
        "options"=>array(
          "pager"=>array(
            "currentPage"=> (($pagina>0)?$pagina:1)+0,
            "total"=>$nRes,
            "from"=>($Gfrom>0)?$Gfrom:1,
            "to"=>($Gto>0)?$Gto:$nRes,
            "pages"=>ceil($nRes/$SYS["DEFAULTROWS"])
          )
        ),
        "rows"=>$result
        
      );
      
      echo json_encode(($response));
      
      
    }
    
  }
    
    
    ?>
