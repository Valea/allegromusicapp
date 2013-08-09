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
mysql_query("insert into purchase (pur_date,cid,card_number,expiryDate) values ('".$dateTime."','$user','$cardNumber','$cardDate')");
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

echo "<div class = 'checkout_title'><p class = 'checkout_title_text'>Receipt ID: " . $reciptID . "</p></div>";
	
mysql_close();

?>
