<?php //Check to see if a date has been posted

	// connect with the database
	include_once("MYSQL_Connect.php");

	$date = $_GET["date"];
	$num = $_GET["num"];

	// title, company, current stock, number of copies sold, most->least

	$bestsOnDate = mysql_query("SELECT I.title, I.company, I.stock, SUM(P.quantity) AS quant
								FROM purchase_item P, item I
								WHERE P.upc = I.upc
								AND P.receiptId
								IN (SELECT P2.receiptId
							            FROM purchase R, purchase_item P2
							            WHERE R.receiptId = P2.receiptId
							            AND DATE( R.pur_date ) = STR_TO_DATE('$date','%Y-%m-%d'))
								GROUP BY P.upc
								ORDER BY SUM(P.quantity) DESC
								LIMIT $num")
					or die("Sql error : ".mysql_error());

	$bestCount = mysql_num_rows($bestsOnDate);

	if ($bestCount==0) {
		echo "No sales were made on $date !";
	}
	else { 
		echo "A report has been printed for $date! These are the top $bestCount selling items.";
	
		echo "<table id = 'sales_table'>";
		echo "<tr>
			  <th>Title</th>
			  <th>Company</th>
			  <th>Current Stock</th>
			  <th>Copies Sold</th>
			</tr>";

		$i = 0;
		$units = 0;

		// sale is of one sale or tuple in the item reportItems
		while ($best = mysql_fetch_array($bestsOnDate))
		{

			// return a new table row
		    echo "<tr>";

		  // return a item title
		  echo "<td><div class = 'item_title'><p>" . $best['title'] . "</p></div></td>";
		  echo "<td><div class = 'item_company'><p>" . $best['company'] . "</p></div></td>";
		  echo "<td><div class = 'item_stock'><p>" . $best['stock'] . "</p></div></td>";
		  echo "<td><div class = 'top_quantity'><p>" . $best['quant'] . "</p></div></td>";

			$i++;
		}
		echo "</tr>";
		}
		echo "</table>";
?>