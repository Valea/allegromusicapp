<?php

// connect with the database
include_once("MYSQL_Connect.php");


$upc=$_GET["upc"]; 
$price=$_GET["price"];
$stock=$_GET["stock"]; 

$allItems = mysql_query("SELECT * FROM item where upc ='$upc'");
while ($item = mysql_fetch_array($allItems)){
	$itemPrice = $item['price'];
	if ($price == 0){
		$price = $itemPrice;
	}
	
	$price -= $itemPrice;
	$itemPrice+=$price;
	$sql = "Update item SET stock = stock + '$stock', price = '$itemPrice' WHERE upc = '$upc'";
	if (mysql_query ($sql)){
		echo "Insert Worked";
	}
	else {
		echo "Insert Didn't Work";
	}
	

}

mysql_close();

?>