<?php

// connect with the database
include_once("MYSQL_Connect.php");

// get the query string values;
$id= $_GET["id"];

// see if the user already has an account

$purchase = mysql_query("SELECT * FROM purchase WHERE receiptId='$id'");
if (mysql_num_rows($purchase)==0){
	echo "Not a Valid ID";
}
else {
	$dateTime = new DateTime();
	$dateTime = $dateTime->format('Y-m-d'); 
	if(mysql_query("UPDATE purchase SET deliveredDate  = '$dateTime' WHERE receiptId='$id'"))
	{
		echo "Product Delivered";
	}
	else{
		echo "Cannot update DataBase";
	}
	

}

mysql_close();

?>