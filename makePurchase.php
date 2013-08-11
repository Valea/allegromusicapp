<?php

// connect with the database
include_once("MYSQL_Connect.php");

$basket=$_GET["basketItems"];
$cardNumber = (isset($_GET["cardnumber"]) ? $_GET["cardnumber"] : null);
$cardDate = (isset($_GET["carddate"]) ? $_GET["carddate"] : null);
$user = (isset($_GET["user"]) ? $_GET["user"] : null);
$items = explode(",", $basket);
$length = count($items);
$totalPrice = 0;
$totalQuantity = 0;
$dateTime = new DateTime();
$dateTime = $dateTime->format('Y-m-d H:i:s');

//If user is null, then it is an in-store purchase. Exclude expected delivery date and cid.
if (is_null($user))
{
	//If cardNumber or cardDate is null, assume cash purchase!
	if (is_null($cardNumber) || is_null($cardDate))
	{
		$sql = "INSERT INTO purchase (pur_date) VALUES ('".$dateTime."')";
	}
	else
	{
		$sql = "INSERT INTO purchase (pur_date, card_number, expiryDate) VALUES ('".$dateTime."', '$cardNumber', '$cardDate')";
	}
}
//Otherwise, it is an online purchase - need cid, card number and expiry date
else
{
	$expectedDate = mysql_query("SELECT * FROM `purchase` WHERE expectedDate is null");
	$daysNeeded = round(mysql_num_rows($expectedDate)/10) + 3;
	$dateAdded = new DateTime();
	$dateAdded = $dateAdded->modify ("+{$daysNeeded} day");
	$dateAdded = $dateAdded->format('Y-m-d');
	$sql = "INSERT INTO purchase (pur_date,cid,card_number,expiryDate,expectedDate) VALUES ('".$dateTime."','$user','$cardNumber','$cardDate','$dateAdded')";
}

mysql_query($sql);
$reciptID = mysql_insert_id();

for ($i=0; $i<$length; $i++)
{
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
echo "<div class = 'checkout_expectedDate'><p class = 'checkout_expectedDate_text'>Purchase Date: " . $dateTime . "</p></div>";

if (!(is_null($cardNumber)))
{
	$cardNumber_substr = substr($cardNumber, -5);
	echo "<br><div class = 'checkout_receiptID'><p class = 'checkout_receiptID_text'>Card #: ***********" . $cardNumber_substr . "</p></div>";
}

if (!(is_null($user)))
{
	echo "<br><div class = 'checkout_expectedDate'><p class = 'checkout_expectedDate_text'>Expected Date: " . $dateAdded  . "</p></div>";
}
	
mysql_close();

?>
