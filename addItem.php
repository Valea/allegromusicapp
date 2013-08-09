<?php

// connect with the database
include_once("MYSQL_Connect.php");

//if(isset($_POST["upc"])) { $upc=$_POST["upc"]; }
$title=$_GET["title"]; 
$disk_type=$_GET["disk_type"]; 
$category=$_GET["category"]; 
$company=$_GET["company"]; 
$pub_year=$_GET["pub_year"]; 
$price=$_GET["price"];
$stock=$_GET["stock"]; 

$query=mysql_query("INSERT INTO item(title,disk_type,category,company,pub_year,price,stock) 
					VALUES('$title','$disk_type','$category','$company','$pub_year','$price','$stock')");
if($query){
echo "Data for $title inserted successfully!";
}
else{ echo "An error occurred!"; }

mysql_close();

?>