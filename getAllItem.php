<?php

// connect with the database
include_once("MYSQL_Connect.php");



//get all items from the database
$allItems = mysql_query("SELECT * FROM item ");

// return a table called mainTable
echo "<table id = 'mainTable'>";

$i = 0;

// item is of one item or tuple in the item table
while ($item = mysql_fetch_array($allItems))
{
  if($i == 0)
  {
	// return a new table row
    echo "<tr>";
  }
  // return a new table column
  echo "<td>";
  // return an item
  echo "<div class = 'item'>";
  
  // return a item title
  echo "<div class = 'item_title'><p class = 'item_title_text'>" . $item['title'] . "</p></div>";
  echo "<div class = 'item_category'><p class = 'item_category_text'>Genre: " . $item['category'] . "</p></div>";
  echo "<div class = 'item_disk_type'><p class = 'item_disk_type_text'>Disk Type: " . $item['disk_type'] . "</p></div>";
  echo "<div class = 'item_company'><p class = 'item_company_text'>Label: " . $item['company'] . "</p></div>";
  echo "<div class = 'item_pub_year'><p class = 'item_pub_year_text'>Year: " . $item['pub_year'] . "</p></div>";
  
  // we recorded price in cents now we have to covert it back to dollars
  $price = $item['price']/100;
  echo "<div class = 'item_price'><p class = 'item_price_text'>$" . $price . "</p></div>";
  echo "<div class = 'item_stock'><p class = 'item_stock_text'>Stock: " . $item['stock'] . "</p></div>";
  echo "<div class = 'item_add' onclick = 'addToBasket(" . $item['upc'] . ")'><p class = 'item_add_text'>Add To Basket</p></div>";
  echo "</div>";
  echo "</td>";
  $i++;
  // i want a table that is 3xn
  if ($i == 3)
  {
	echo "</tr>";
	$i = 0;
  }
}

echo "</table>";
mysql_close();

?>
