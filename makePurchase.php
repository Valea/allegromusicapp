<?php

// connect with the database
include_once("MYSQL_Connect.php");

$basket=$_GET["basketItems"];
$cardNumber = $_GET["cardnumber"];
$cardDate = $_GET["carddate"];
$user = $_GET["user"];
$items = explode(",", $basket);
$length = count($items);
$totalPrice = 0;
$totalQuantity = 0;
$dateTime = new DateTime();
$dateTime = $dateTime->format('Y-m-d H:i:s'); 
$expecteddate = mysql_query("SELECT * FROM `purchase` WHERE deliveredDate is null ");
$addDate = round(mysql_num_rows($expecteddate) /10) + 3;
$dateExpect = new DateTime();
date_modify($dateExpect, '+'.$addDate.' day');
$dateExpect = $dateExpect->format('Y-m-d'); 


mysql_query("insert into purchase (pur_date,cid,card_number,expiryDate,expectedDate) values ('".$dateTime."','$user','$cardNumber','$cardDate','$dateExpect')");
$reciptID = mysql_insert_id();

for ($i=0; $i<$length; $i++){

	//get all items from the database
	$allItems = mysql_query("SELECT * FROM item WHERE upc = '".$items[$i]."'");
	$i++;
	// item is of one item or tuple in the item table
	while ($item = mysql_fetch_array($allItems))
	{
		$upc = $item['upc'];
		$price = $item['price']/100;
		$numberofitems = $items[$i];
		$totalQuantity += $numberofitems;
		$itemprice = $price * $numberofitems;
		$totalPrice += $itemprice;
		mysql_query("insert into purchase_item values ('$reciptID','$upc','$numberofitems')");
		mysql_query("update item set stock = stock-'$numberofitems' where upc = '$upc'");
		
	}
	
	
}

echo "<div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Receipt ID: " . $reciptID . "</p></div>";
echo "<div class = 'checkout_expectedDate'><p class = 'checkout_expectedDate_text'>Expected Date: " . $dateExpect . "</p></div>";
	
mysql_close();

?>
