<?php

// connect with the database
include_once("MYSQL_Connect.php");

$receiptId=$_GET['receiptId'];
// $upcs=json_decode($_GET['upcs']);
// $quantity=(isset($_GET['quantity']) ? json_decode($_GET['quantity']) : null);
$retid=0;

//create an entry in Returns table
$date_now_str = date("Y-m-d H:i:s");
// $date_now_datetime = new DateTime($date_now_str);
$return_sql = "INSERT INTO returns (ret_date, receiptId)
			VALUES ('$date_now_str', '$receiptId')";

if (!mysql_query($return_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	$retid = mysql_insert_id();
	echo "1 Return added. receiptId = " . $retid;
}

/*
//create an entry in PurchaseItem table for each item upc/
foreach ($upcs as $index=>$upc)
{
	$purchaseItem_sql = "IF NOT EXISTS (SELECT * FROM return_item WHERE retid = '$retid' AND upc = '$upc')
	BEGIN
		INSERT INTO return_item (retid, upc, quantity)
		VALUES ('$retid', '$upc', '$quantity[$index]')
	END";
	if (!mysql_query($purchaseItem_sql))
	{
	echo "Error: " . mysql_error();
	}
	else
	{
	echo "1 PurchaseItem added";
	}
}
*/

mysql_close();

?>