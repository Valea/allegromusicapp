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
				
				//Determine whether purchase was Card or Credit
				if (!is_null($purchase["card_number"]))
				{
					echo "<div class = 'ret_cc_num'><p class = 'ret_receipt_text'>" . $purchase["card_number"] . "</p></div>";
					echo "<div class = 'ret_cc_expdate'><p class = 'ret_receipt_text'>" . $purchase["expiryDate"] . "</p></div>";
					echo "<div id = 'cancel_return' class='submit' onclick = 'cancelReturn()'>Cancel Return</div>";
					echo "<div id = 'confirm_return' class='submit' onclick = 'confirmReturn(" . $receiptId . ")'>Confirm Return</div>";		
				}
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
