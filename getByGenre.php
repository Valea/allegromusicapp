<?php

// connect with the database
include_once("MYSQL_Connect.php");

$category=$_GET["genre"];

//get all items from the database
$allItems = mysql_query("SELECT * FROM item WHERE category = '".$category."'");

// item is of one item or tuple in the item table
  while ($item = mysql_fetch_array($allItems))
{
  echo "<div class = 'item'>";
  $upc = $item['upc'];
  // return a item title
  echo "<div class = 'item_title'><p class = 'item_title_text'>" . $item['title'] . "</p></div>";
  echo "<div class = 'item_category'><p class = 'item_category_text'>Genre: " . $item['category'] . "</p></div>";
  echo "<div class = 'item_disk_type'><p class = 'item_disk_type_text'>Disk Type: " . $item['disk_type'] . "</p></div>";
  $artist = mysql_query("SELECT * FROM lead_singer where upc = '$upc' ");
  while ($singer = mysql_fetch_array($artist)){
	echo "<div class = 'item_lead_singer'><p class = 'item_lead_singer_text'>Artist: " . $singer['name'] . "</p></div>";
  }
  echo "<div class = 'item_company'><p class = 'item_company_text'>Label: " . $item['company'] . "</p></div>";
  
    $songs = mysql_query("SELECT * FROM has_song where upc = '$upc' ");
  while ($song = mysql_fetch_array($songs)){
	echo "<div class = 'item_has_song'><p class = 'item_has_song_text'>Song: " . $song['song_title'] . "</p></div>";
  }
  
  echo "<div class = 'item_pub_year'><p class = 'item_pub_year_text'>Year: " . $item['pub_year'] . "</p></div>";
  
  // we recorded price in cents now we have to covert it back to dollars
  $price = $item['price']/100;
  echo "<div class = 'item_price'><p class = 'item_price_text'>$" . $price . "</p></div>";
  echo "<div class = 'item_stock'><p class = 'item_stock_text'>Stock: " . $item['stock'] . "</p></div>";

  echo "<div class = 'item_add' onclick = 'addToBasket(" . $item['upc'] . ")'><p class = 'item_add_text'>Add To Basket</p></div>";
  echo "</div>";
  
}


mysql_close();

?>
