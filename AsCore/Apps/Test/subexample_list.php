<?php
require_once("Test.php");

$u=newObject("subexample");

$u->searchResults=$u->selectAll($offset,$sort);
$d=array(
  "example_id"=>$u->get_external_reference("example_id")
);

listList($u,$d,"subexample_list");



?>