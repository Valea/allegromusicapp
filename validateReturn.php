<?php

// connect with the database
include_once("MYSQL_Connect.php");

$receiptId=$_GET['receiptId'];

//get all items from the database
$sql = "SELECT * FROM purchase WHERE receiptId = '$receiptId'";
$result = mysql_query($sql);
$num_results = mysql_num_rows($result);

if ($num_results > 0)
{
	while ($purchase = mysql_fetch_array($result))
	{
		if ($purchase["receiptId"] == $receiptId)
		{
			$date_now = new DateTime(date("Y-m-d H:i:s"));
			$pur_date = new DateTime($purchase["pur_date"]);
			$interval = $pur_date->diff($date_now);
			if ($interval->days <= 15)
			{
				echo "<div class = 'ret_pur_date'><p class = 'ret_receipt_text'>" . $purchase["pur_date"] . "</p></div>";
				echo "<div class = 'ret_receipt_id'><p class = 'ret_receipt_text'>" . $purchase["receiptId"] . "</p></div>";
				
				//Determine whether purchase was Cash or Credit
				if (!is_null($purchase["card_number"]))
				{
					echo "<div class = 'ret_cc_num'><p class = 'ret_receipt_text'>" . $purchase["card_number"] . "</p></div>";
					echo "<div class = 'ret_cc_expdate'><p class = 'ret_receipt_text'>" . $purchase["expiryDate"] . "</p></div>";
				}
				
				$items_sql = "SELECT * FROM purchase_item P, item I WHERE P.upc = I.upc AND P.receiptId = '$receiptId'";
				$items_result = mysql_query($items_sql);
				$i = 0;
								
				// return a table called mainTable
				echo "<table id = 'mainTable'>";
				echo "<thead><tr>
						<th scope='col'>Select Item</th>
						<th scope='col'>QTY to Refund</th>
						<th scope='col'>Item Name</th>
						<th scope='col'>UPC</th>
						<th scope='col'>Price</th>
						<th scope='col'>QTY</th>
						<th scope='col'>Ext. Price</th>
					</tr></thead>";
				
				$selected_btn_set = false;
				while ($item = mysql_fetch_array($items_result))
				{					
					//First, check if there have been previous returns for the given receiptId
					//If amount already returned is same as total quantity purchased, don't allow return of this item anymore!
					$prev_ret_sql = "SELECT * FROM returns WHERE receiptId = '$receiptId'";
					$prev_ret_result = mysql_query($prev_ret_sql);
					$amt_already_returned = 0;
					
					while ($prev_ret = mysql_fetch_array($prev_ret_result))
					{
						//Get all matching return_item entries for the given retid and item upc
						$prev_ret_item_sql = "SELECT * FROM return_item WHERE retid = " . $prev_ret['retid'] . " AND upc = " . $item['upc'];
						$prev_ret_item_result = mysql_query($prev_ret_item_sql);
						
						//All the quantity returned for each matching return_item entry
						while ($prev_ret_item = mysql_fetch_array($prev_ret_item_result))
						{
							$amt_already_returned += $prev_ret_item['quantity'];
						}
					}
					
					$qty_remaining = $item['quantity'] - $amt_already_returned;	
					
					if($i == 0)
					{
						// return a new table row
						echo "<tr>";
					}

					// return an item
					echo "<div class = 'item'>";
					
					//Radio button - disable the radio button if qty_remaining is 0
					echo "<td>";
					
					if ($qty_remaining == 0)
					{
						echo "<input id ='refund_radio' type='radio' name='refund_radio' value=" . $item['upc'] . " disabled>";
					}
					else
					{
						if (!($selected_btn_set))
						{
							echo "<input id ='refund_radio' type='radio' name='refund_radio' value=" . $item['upc'] . " checked>";
							$selected_btn_set = true;
						}
						else
						{
							echo "<input id ='refund_radio' type='radio' name='refund_radio' value=" . $item['upc'] . ">";
						}
					}
					echo "</td>";
					$i++;
					
					//Quantity to refund - set the id to include the item upc so we can identify it 	
					$refund_qty_id = "refund_qty_" . $item['upc'];
					echo "<td>";
					if ($qty_remaining == 0)
					{
						echo "<input id=" . $refund_qty_id . " type='text' name='refund_qty' value='All QTY returned' min='1' max=" . $qty_remaining . " disabled>";
					}
					else
					{
						echo "<input id=" . $refund_qty_id . " type='text' name='refund_qty' value='1' min='1' max=" . $qty_remaining . ">";
					}
					echo "</td>";
					$i++;
					
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

					//Item quantity
					echo "<td>";
					echo "<div class = 'item_quantity'><p class = 'item_price_text'>" . $item['quantity'] . "</p></div>";
					echo "</td>";
					$i++;

					//Extended price (quantity * price)
					$extprice = $item['quantity'] * ($item['price']/100);
					echo "<td>";
					echo "<div class = 'item_ext_price'><p class = 'item_price_text'>$" . $extprice . "</p></div>";
					echo "</td>";
					$i++;

					if ($i == 7)
					{
						echo "</tr>";
						$i = 0;			
					}
				}
				
				echo "</table>";			
				echo "<div id = 'cancel_return' class='submit' onclick = 'cancelReturn()'>Cancel Return</div>";
				echo "<div id = 'confirm_return' class='submit' onclick = 'confirmReturn(" . $receiptId . ")'>Confirm Return</div>";
			}
			else
			{
				echo "2";
			}
			break;
		}
	}
}
else
{ 
	echo "0";
}

mysql_close();

?>
