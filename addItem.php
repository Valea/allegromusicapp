<?php

// connect with the database
include_once("MYSQL_Connect.php");

//if(isset($_POST["upc"])) { $upc=$_POST["upc"]; }
if(isset($_POST["title"])) { $title=$_POST["title"]; }
if(isset($_POST["disk_type"])) { $disk_type=$_POST["disk_type"]; }
if(isset($_POST["category"])) { $category=$_POST["category"]; }
if(isset($_POST["company"])) { $company=$_POST["company"]; }
if(isset($_POST["pub_year"])) { $pub_year=$_POST["pub_year"]; }
if(isset($_POST["price"])) { $price=$_POST["price"]; }
if(isset($_POST["stock"])) { $stock=$_POST["stock"]; }

$query=mysql_query("INSERT INTO item(title,disk_type,category,company,pub_year,price,stock) 
					VALUES('$title','$disk_type','$category','$company','$pub_year','$price','$stock')");
if($query){
echo "Data for $title inserted successfully!";
}
else{ echo "An error occurred!"; }

?>