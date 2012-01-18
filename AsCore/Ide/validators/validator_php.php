<?php

function php_check_syntax( $php, $isFile=false )
{
        # Prevent output
        ob_start();
        passthru( 'php  -l  '.$php.' 2>&1', $ret );
        $output = ob_get_clean();

        if( $ret !== 0 )
        {
            # Parse error to report?
            preg_match( '/Parse error:\s*syntax error,(.+?)\s+in\s+.+?\s*line\s+(\d+)/', $output, $match ); 
            
                return array(
                    'line'    =>    (int)$match[2],
                    'msg'    =>    $match[1]
                );
            
        }
        return true;
}

//fixes related bugs: 29761, 34782 => token_get_all returns <?php NOT as T_OPEN_TAG
function token_fix( &$tokens ) {
    if (!is_array($tokens) || (count($tokens)<2)) {
        return;
    }
   //return of no fixing needed
    if (is_array($tokens[0]) && (($tokens[0][0]==T_OPEN_TAG) || ($tokens[0][0]==T_OPEN_TAG_WITH_ECHO)) ) {
        return;
    }
    //continue
    $p1 = (is_array($tokens[0])?$tokens[0][1]:$tokens[0]);
    $p2 = (is_array($tokens[1])?$tokens[1][1]:$tokens[1]);
    $p3 = '';

    if (($p1.$p2 == '<?') || ($p1.$p2 == '<%')) {
        $type = ($p2=='?')?T_OPEN_TAG:T_OPEN_TAG_WITH_ECHO;
        $del = 2;
        //update token type for 3rd part?
        if (count($tokens)>2) {
            $p3 = is_array($tokens[2])?$tokens[2][1]:$tokens[2];
            $del = (($p3=='php') || ($p3=='='))?3:2;
            $type = ($p3=='=')?T_OPEN_TAG_WITH_ECHO:$type;
        }
        //rebuild erroneous token
        $temp = array($type, $p1.$p2.$p3);
        if (version_compare(phpversion(), '5.2.2', '<' )===false)
            $temp[] = isset($tokens[0][2])?$tokens[0][2]:'unknown';

        //rebuild
        $tokens[1] = '';
        if ($del==3) $tokens[2]='';
        $tokens[0] = $temp;
    }
    return;
}


function ValidateCode($file) {

	return php_check_syntax($file,true);

}


?>


