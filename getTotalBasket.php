<?php

// connect with the database
include_once("MYSQL_Connect.php");

$basket=$_GET["basketItems"];
$items = explode(",", $basket);
$length = count($items);
$totalPrice = 0;
$totalQuantity = 0;

for ($i=0; $i<$length; $i++){

	//get all items from the database
	$allItems = mysql_query("SELECT * FROM item WHERE upc = '".$items[$i]."'");
	$i++;
	// item is of one item or tuple in the item table
	while ($item = mysql_fetch_array($allItems))
	{
		$price = $item['price']/100;
		$numberofitems = $items[$i];
		$totalQuantity += $numberofitems;
		$itemprice = $price * $numberofitems;
		$totalPrice += $itemprice;
		
		echo "<div class = 'checkout_title'><p class = 'checkout_title_text'>" . $item['title'] . "</p></div>";
		echo "<div class = 'checkout_price'><p class = 'checkout_price_text'>$" . $price . "</p></div>";
		echo "<div class = 'checkout_quantity'><p class = 'checkout_quantity_text'>Quantity: " . $numberofitems . "</p></div>";
		echo "<div class = 'checkout_itemprice'><p class = 'checkout_itemprice_text'>$" . $itemprice . "</p></div>";
	}
	
	
}

	echo "<div class = 'checkout_totalquantity'><p class = 'checkout_totalquantity_text'>Total Quantity: " . $totalQuantity . "</p></div>";
	echo "<div class = 'checkout_totalprice'><p class = 'checkout_totalprice_text'>Total Price: $" . $totalPrice . "</p></div>";
	
mysql_close();

?>
