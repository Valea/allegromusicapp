<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upc=$_GET["upc"];

//get all matching items from the database
$result = mysql_query("SELECT upc FROM item WHERE upc = '".$upc."'");
$num_results = mysql_num_rows($result);

if ($num_results > 0)
{
	echo "true";
}
else
{
	echo "false";
}

mysql_close();

?>
