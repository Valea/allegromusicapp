<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upcs=json_decode($_GET['upcs']);
$quantity=(isset($_GET['quantity']) ? json_decode($_GET['quantity']) : null);

// return a table called mainTable
echo "<table id = 'mainTable'>";
echo "<thead><tr> 
			<th scope='col'>Item Name</th>
			<th scope='col'>Stock</th>
			<th scope='col'>UPC</th>
			<th scope='col'>Price</th>
			<th scope='col'>QTY</th>
			<th scope='col'>Ext. Price</th>
			<th scope='col'>Action</th>
		</tr></thead>";

if (empty($upcs))
{
	// return an item
	echo "<div class = 'item'>";  

	//Item title
	echo "<td>";
	echo "<div class = 'item_title'><p class = 'item_price_text'>''</p></div>";  
	echo "</td>";

	//Item stock
	echo "<td>";
	echo "<div class = 'item_stock'><p class = 'item_price_text'>''</p></div>";
	echo "</td>";

	//Item UPC
	echo "<td>";
	echo "<div class = 'item_upc'><p class = 'item_price_text'>''</p></div>";  
	echo "</td>";

	//Item price - we recorded price in cents now we have to covert it back to dollars
	echo "<td>";
	echo "<div class = 'item_price'><p class = 'item_price_text'>''</p></div>";
	echo "</td>";

	//Item quantity - get corresponding qty from quantity array using current index
	echo "<td>";
	echo "<div class = 'item_quantity'><p class = 'item_price_text'>''</p></div>";
	echo "</td>";

	//Extended price (quantity * price)
	echo "<td>";
	echo "<div class = 'item_price'><p class = 'item_price_text'>''</p></div>";
	echo "</td>";

	//Remove from basket
	echo "<td>";  
	echo "<div class = 'item_add'><p class = 'item_add_text'>''</p></div>";
	echo "</td>";

	echo "</table>";
}
else
{		
	foreach ($upcs as $index=>$upc)
	{
		//get info for each item in basket from the database
		$sql = "SELECT * FROM item WHERE upc = '".$upc."'";
		$result = mysql_query($sql);

		$i = 0;

		// item is of one item or tuple in the item table
		while ($item = mysql_fetch_array($result))
		{
		  if($i == 0)
		  {
			// return a new table row
			echo "<tr>";
		  }
		  
		  // return an item
		  echo "<div class = 'item'>";  
		  
		  //Item title
		  echo "<td>";
		  echo "<div class = 'item_title'><p class = 'item_price_text'>" . $item['title'] . "</p></div>";  
		  echo "</td>";
		  $i++;
		  
		  //Item stock
		  echo "<td>";
		  echo "<div class = 'item_stock'><p class = 'item_price_text'>" . $item['stock'] . "</p></div>";
		  echo "</td>";
		  $i++;
		  
		  //Item UPC
		  echo "<td>";
		  echo "<div class = 'item_upc'><p class = 'item_price_text'>" . $item['upc'] . "</p></div>";  
		  echo "</td>";
		  $i++;
		  
		  //Item price - we recorded price in cents now we have to covert it back to dollars
		  $price = $item['price']/100;
		  echo "<td>";
		  echo "<div class = 'item_price'><p class = 'item_price_text'>$" . $price . "</p></div>";
		  echo "</td>";
		  $i++;
		  
		  //Item quantity - get corresponding qty from quantity array using current index
		  $qty = $quantity[$index];
		  echo "<td>";
		  echo "<div class = 'item_quantity'><p class = 'item_price_text'>" . $qty . "</p></div>";
		  echo "</td>";
		  $i++;
		  
		  //Extended price (quantity * price)
		  $extprice = $qty * ($item['price']/100);
		  echo "<td>";
		  echo "<div class = 'item_price'><p class = 'item_price_text'>$" . $extprice . "</p></div>";
		  echo "</td>";
		  $i++;
		  
		  //Remove from basket
		  echo "<td>";  
		  echo "<div class = 'item_add' onclick = 'removeFromBasket(" . $item['upc'] . ")'><p class = 'item_add_text'>Remove From Basket</p></div>";
		  echo "</td>";
		  $i++;
		  
		  if ($i == 7)
		  {
			echo "</tr>";
			$i = 0;
		  }
		}
	}
	echo "</table>";
	echo "<tr>";
	echo "<button type='button' onclick = 'checkoutBasket()'>Checkout</button>";
	echo "</tr>";	
}
mysql_close();

?>