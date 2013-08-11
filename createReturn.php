<?php

// connect with the database
include_once("MYSQL_Connect.php");

$receiptId=$_GET['rid'];
$upc=$_GET['upc'];
$qty=$_GET['qty'];
$retid=0;

//create an entry in Returns table
$date_now_str = date("Y-m-d H:i:s");
// $date_now_datetime = new DateTime($date_now_str);
$return_sql = "INSERT INTO returns (ret_date, receiptId) VALUES ('$date_now_str', '$receiptId')";

if (!mysql_query($return_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	$retid = mysql_insert_id();
	echo "1 Return added. retid = " . $retid;
}

//create an entry in ReturnItem table for the given item upc
$ret_item_sql = "INSERT INTO return_item (retid, upc, quantity) VALUES ('$retid', '$upc', '$qty')";

if (!mysql_query($ret_item_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	echo "1 ReturnItem added";
}

//update the stock for the corresponding item
$item_sql = "UPDATE item SET stock = stock+'$qty' WHERE upc = '$upc'";
if (!mysql_query($item_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	echo "Updated stock for item upc: " . $upc; 
}

mysql_close();

?>