<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upc=$_GET["upc"]; 
$stock=$_GET["stock"]; 
$price=$_GET["price"]; 

if(empty($_GET["price"])) {
	$query=mysql_query("UPDATE item
					SET stock=stock+'$stock'
					WHERE upc='$upc'");
} else {
	$query=mysql_query("UPDATE item
						SET stock=stock+'$stock',price='$price'
						WHERE upc='$upc'");
}
if($query){
echo "Stock for $upc inserted successfully!";
}
else{ echo "An error occurred!"; }

?>