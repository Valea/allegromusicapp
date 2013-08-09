<?php //Check to see if a date has been posted

	// connect with the database
	include_once("MYSQL_Connect.php");

	$date = $_GET["date"];

	$salesOnDate = mysql_query("SELECT I.upc, I.category, I.price, I.stock, P.quantity
								FROM purchase_item P, item I
								WHERE P.upc = I.upc
								AND P.receiptId
								IN (SELECT P2.receiptId
									FROM purchase R, purchase_item P2
									WHERE R.receiptId = P2.receiptId
									AND DATE( R.pur_date ) = STR_TO_DATE('$date','%Y-%m-%d'))
								ORDER BY I.category DESC")
	or die("Sql error : ".mysql_error());

	$saleCount = mysql_num_rows($salesOnDate);

/*
	$salesOnDate = mysql_query("SELECT * 
						  FROM purchase 
						  WHERE DATE(pur_date) = STR_TO_DATE('$date','%Y-%m-%d')")
					or die ("Sql error : ".mysql_error());
	$saleCount = mysql_num_rows($salesOnDate);

	$purchasedItems = mysql_query("SELECT *
								   FROM $salesOnDate, purchase_item
								   WHERE $salesOnDate.['receiptId'] = purchase_item.receiptId")
					or die ("Sql error : ".mysql_error());

	$reportItems = mysql_query("SELECT *
								FROM $purchasedItems, item
								WHERE $purchasedItems.['upc'] = item.upc")
					or die ("Sql error : ".mysql_error());
*/
	// select from $query where receiptId = purchase_item(receiptId) --> $purchasedItems, 
	// select from items(UPC, category, price, units, value) where purchasedItems(upc) = item(upc)

	if ($saleCount==0) {
		echo "No sales were made on $date !";
	}
	else { 
		echo "A report has been printed for $date! There are $saleCount sales in this report.";
		
		echo "<table id = 'sales_table'>";
		echo "<tr>
			  <th>UPC</th>
			  <th>Category</th>
			  <th>Unit Price</th>
			  <th>Units</th>
			  <th>Total Value</th>
			</tr>";

		$i = 0;
		$units = 0;
		$subtotal = 0;
		$cattotal = array();
		$cattotal['Classical'] = 0;
		$cattotal['Country'] = 0;
		$cattotal['Instrumental'] = 0;
		$cattotal['New Age']  = 0;
		$cattotal['Pop']  = 0;
		$cattotal['Rap']  = 0;
		$cattotal['Rock']  = 0;
		$prevcat = 0;
		$catstock = array();
		$prevstock = 0;

		// sale is of one sale or tuple in the item reportItems
		while ($sale = mysql_fetch_array($salesOnDate))
		{
			//make 2d array for rows of  $sale
			$row[] = $sale;

		  if ($i!=0 && $row[$i]['category'] != $row[$i-1]['category']) {
		  	
		  	echo "</tr>
		  		  		  <tr><td></td><td>Total</td><td></td><td>$prevstock</td> <td>$prevcat</td></tr>";
		  		}



			// return a new table row
		    echo "<tr>";

		  // return a item title
		  echo "<td><div class = 'item_title'><p>" . $sale['upc'] . "</p></div></td>";
		  echo "<td><div class = 'item_category'><p>" . $sale['category'] . "</p></div></td>";

		  // we recorded price in cents now we have to covert it back to dollars
		  $price = $sale['price']/100;
		  echo "<td><div class = 'item_price'><p>$" . $price . "</p></div></td>";

		  echo "<td><div class = 'item_company'><p>" . $sale['quantity'] . "</p></div></td>";
		  $units = $units + $sale['quantity'];

		  echo "<td><div class = 'item_stock'><p>$" . $price * $sale['quantity'] . "</p></div></td>";
		  if (!(array_key_exists($sale['category'], $catstock)))
		  {
		  	$catstock[$sale['category']] = 0;
		  }
		  $catstock[$sale['category']] = $catstock[$sale['category']] + $sale['quantity'];
		  if (!(array_key_exists($sale['category'], $cattotal)))
		  {
		  	$cattotal[$sale['category']] = 0;
		  }
		  	echo "</tr>";
	  		$cattotal[$sale['category']] += ($price * $sale['quantity']);

		  $subtotal = $subtotal + ($price * $sale['quantity']);
		  $prevcat = $cattotal[$sale['category']];
		  $prevstock = $catstock[$sale['category']];
			$i++;
		}
		echo "</tr>
		  		  <tr><td></td><td>Total</td><td></td><td>$prevstock</td> <td>$prevcat</td></tr>";
		echo "<tr><td></td><td></td><td></td><td></td><td>----------</td></tr>

		<tr><td></td><td></td>
				<td>Total Daily Sales</td>
				<td>$units</td>
				<td>$$subtotal</td></tr>";
		}

?>