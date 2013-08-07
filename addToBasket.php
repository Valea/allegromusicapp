<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upc=$_GET["upc"];
$quantity=$_GET["quantity"];

//get all items from the database
$add = mysql_query("SELECT * FROM item WHERE upc = '".$upc."'");


// item is of one item or tuple in the item table
while ($item = mysql_fetch_array($add))
{
  // return an item
  echo "<div class = 'basket'>";
  
  // return a item title
  echo "<div class = 'basket_title'><p class = 'basket_title_text'>" . $item['title'] . "</p></div>";
  // we recorded price in cents now we have to covert it back to dollars
  $price = $item['price']/100;
  echo "<div class = 'basket_price'><p class = 'basket_price_text'>$" . $price . "</p></div>";
  echo "<div class = 'basket_stock'><p class = 'basket_stock_text'>Quantity: " . $quantity . "</p></div>";
  echo "<div class = 'basket_remove' onclick = 'removeFromBasket(" . $item['upc'] . ")'><p class = 'basket_remove_text'>Remove From Basket</p></div>";
  echo "</div>";
  }

mysql_close();

?>
