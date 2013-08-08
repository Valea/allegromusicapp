<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upcs=json_decode($_GET['upcs']);
$quantity=(isset($_GET['quantity']) ? json_decode($_GET['quantity']) : null);
$cid=$_GET['cid'];
$cardNum=$_GET['cardNum'];
$expiryDate=$_GET['expiryDate'];
$receiptId=0;

//create entry in Purchase table
//TODO: Calculate expectedDate and how to set deliveredDate??
$currentDate = date_default_timezone_get();
$purchase_sql = "INSERT INTO purchase (pur_date, cid, card#, expiryDate) 
				VALUES ('$currentDate', '$cid', '$cardNum', '$expiryDate')";
if (!mysql_query($purchase_sql))
{
	echo "<tr>Error:" . mysql_error() . "</tr>";
	echo "alert(error!)";
}
else
{
	$receiptId = mysql_insert_id();
	echo "<tr>1 Purchase added. receiptId =" . $receiptId . "</tr>";
	echo "alert(success!)";
}

foreach ($upcs as $index=>$upc)
{
	//create an entry in PurchaseItem table for each item upc
	$purchaseItem_sql = "INSERT INTO purchase_item (receiptId, upc, quantity)
						VALUES ('$receiptId', '$upc', '$quantity[$index]')";
	if (!mysql_query($purchaseItem_sql))
	{
		echo "Error: " . mysql_error();
	}
	else
	{
		echo "1 PurchaseItem added";
	}
}

mysql_close();

?>