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
				echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Purchase Date: " . $purchase["pur_date"] . "</p></div>";
				echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Receipt Id: " . $purchase["receiptId"] . "</p></div>";
				
				//Determine whether purchase was Cash or Credit
				if (!is_null($purchase["card_number"]) && !empty($purchase["card_number"]))
				{
					echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Payment Type: Credit</p></div>";
					echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Credit Card Number: " . $purchase["card_number"] . "</p></div>";
					echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Expiry Date: " . $purchase["expiryDate"] . "</p></div>";
				}
				else
				{
					echo "<div class = 'clerk_input'><p class = 'ret_receipt_text'>Payment Type: Cash</p></div>";
				}
				
				$items_sql = "SELECT * FROM purchase_item P, item I WHERE P.upc = I.upc AND P.receiptId = '$receiptId'";
				$items_result = mysql_query($items_sql);
				$i = 0;
				
				// return a table called returnTable
				echo "<table id = 'returnTable'>";
				echo "<thead><tr>
						<th scope='col' class='return_header_small' align='center'>Select Item</th>
						<th scope='col' class='return_header_small'>QTY to Refund</th>
						<th scope='col' class='return_header_small'>Refund Amount</th>
						<th scope='col' class='return_header_wide'>Item Name</th>
						<th scope='col' class='return_header_small'>UPC</th>
						<th scope='col' class='return_header_small'>Price</th>
						<th scope='col' class='return_header_small'>QTY</th>
					</tr></thead>";
				
				$selected_btn_set = false;
				$item_index = 0;
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
						echo "<tr class =". "d" .($item_index & 1). ">";
					}
					
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
						echo "<input id=" . $refund_qty_id . " type='text' name='refund_qty' value='1' min='1' max=" . $qty_remaining . " onkeyup='this.onchange' onchange='updateRefundQtyAmount(this.value, " . $qty_remaining . ", " . $item['price'] . ", " . $item['upc'] . ")'>";
					}
					echo "</td>";
					$i++;

					//Amount refundable (quantity to refund * price)
					$refund_amt_id = "refund_amt_" . $item['upc'];
					$max_refund_amt = $qty_remaining * ($item['price']/100);
					echo "<td>";
					echo "<input id=" . $refund_amt_id . " type='text' name='refund_amt' value=" . ($item['price']/100) . " min='0' max=" . $max_refund_amt . " disabled>";
					echo "</td>";
					$i++;
					
					//Item title
					echo "<td>";
					echo "<div><p class = 'return_item_text'>" . $item['title'] . "</p></div>";
					echo "</td>";
					$i++;

					//Item UPC
					echo "<td>";
					echo "<div><p class = 'return_item_text'>" . $item['upc'] . "</p></div>";
					echo "</td>";
					$i++;

					//Item price - we recorded price in cents now we have to covert it back to dollars
					$price = $item['price']/100;
					echo "<td>";
					echo "<div><p class = 'return_item_text'>$" . $price . "</p></div>";
					echo "</td>";
					$i++;

					//Item quantity
					echo "<td>";
					echo "<div><p class = 'return_item_text'>" . $item['quantity'] . "</p></div>";
					echo "</td>";
					$i++;

					if ($i == 7)
					{
						echo "</tr>";
						$i = 0;			
					}
					
					$item_index++;
				}
				
				echo "</table>";				
				echo "<div id = 'cancel_return' class='item_add' onclick = 'cancelReturn()'><p class = 'item_add_text'>Cancel Return</p></div>";
				echo "<div id = 'confirm_return' class='item_add' onclick = 'confirmReturn(" . $receiptId . ")'><p class = 'item_add_text'>Confirm Return</p></div>";
			}
			else
			{
				echo "Not Within 15 Days";
			}
			break;
		}
	}
}
else
{ 
	echo "Invalid";
}

mysql_close();

?>
