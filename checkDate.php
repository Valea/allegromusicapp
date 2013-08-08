<?php //Check to see if a date has been posted

	// connect with the database
	include_once("MYSQL_Connect.php");

	$date = $_GET["date"];

	//$mysql_date = date(‘Y-m-d’,strtotime($_GET['date']));


	$query = mysql_query("SELECT * 
						  FROM purchase 
						  WHERE DATE(pur_date) = STR_TO_DATE('$date','%Y-%m-%d')");

	if (mysql_num_rows($query)==0) {
		echo "No sales were made on $date !";
	}
	else{ echo "A report can be printed for $date !"; }

?>