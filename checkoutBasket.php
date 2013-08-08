<?php

// connect with the database
include_once("MYSQL_Connect.php");

$upcs=json_decode($_GET['upcs']);
$quantity=(isset($_GET['quantity']) ? json_decode($_GET['quantity']) : null);
$total=0;

// return a table called mainTable
echo "<table id = 'mainTable'>";
echo "<thead><tr> 
			<th scope='col'>Item Name</th>
			<th scope='col'>UPC</th>
			<th scope='col'>Price</th>
			<th scope='col'>QTY</th>
			<th scope='col'>Ext. Price</th>
		</tr></thead>";

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
	  $total += $extprice;
	  echo "<td>";
	  echo "<div class = 'item_ext_price'><p class = 'item_price_text'>$" . $extprice . "</p></div>";
	  echo "</td>";
	  $i++;
	  
	  if ($i == 5)
	  {
		echo "</tr>";
		$i = 0;
	  }
	}
}
echo "<tr>";
echo "<div class = 'total_price'><p class = 'item_price_text'>TOTAL: $" . $total . "</p></div>";
echo "</tr>";

echo "</table>";

echo "<div id = 'cc_info'>";
echo "<form name='cc_info' method='get'>
	<br>Credit Card Number:<br><input type='text' name='cc_number'>
	<br>Expiry Date:<br><input type='text' name='cc_exp_date'>
	<br><button type='button' onclick='cancelOrder()'>Cancel Order</button>
	<input type='submit' value='Confirm Order' onclick='confirmOrder(this.form, $total)'>
	</form>";
echo "</div>";

mysql_close();

?>