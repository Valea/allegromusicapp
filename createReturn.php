<?php

// connect with the database
include_once("MYSQL_Connect.php");

$receiptId=$_GET['rid'];
$upc=$_GET['upc'];
$qty=$_GET['qty'];
$amt=$_GET['amt'];
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
	echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Return ID: " . $retid . "</p></div>";
}

//create an entry in ReturnItem table for the given item upc
$ret_item_sql = "INSERT INTO return_item (retid, upc, quantity) VALUES ('$retid', '$upc', '$qty')";

if (!mysql_query($ret_item_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>UPC: " . $upc . "</p></div>";
	echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Qty: " . $qty . "</p></div>";
	echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Amount refunded: " . $amt . "</p></div>";
}

//update the stock for the corresponding item
$item_sql = "UPDATE item SET stock = stock+'$qty' WHERE upc = '$upc'";
if (!mysql_query($item_sql))
{
	echo "Error: " . mysql_error();
}
else
{
	$check_stock_sql = "SELECT stock FROM item WHERE upc = '$upc'";
	$check_stock_result = mysql_query($check_stock_sql);
	
	while ($item_stock = mysql_fetch_array($check_stock_result))
	{
		echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Updated Stock: " . $item_stock['stock'] . "</p></div>";
	}
}

mysql_close();

?>