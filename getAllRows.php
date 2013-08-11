<?php

// connect with the database
include_once("MYSQL_Connect.php");

$table=$_GET['table'];

if (!(is_null($table)))
{
	//get all rows from the given table
	$sql = "SELECT * FROM " . $table;
	$result = mysql_query($sql);	
	$num_fields = mysql_num_fields($result);
	$field_index = 0;
	
	// return a table called displayTable
	echo "<table id = 'displayTable'>";
	
	// create table headers
	echo "<thead><tr>";
	while ($field_index < $num_fields)
	{
		$field_name = mysql_field_name($result, $field_index);
		echo "<th scope='col' class='report_sales_text'>" . $field_name . "</th>";
		$field_index++;
	}
	$field_index = 0;
	echo "</tr></thead>";	
	
	while ($tuple = mysql_fetch_array($result))
	{
		if ($field_index == 0)
		{
			// return a new table row
			echo "<tr>";
		}
		echo "<div class = 'tuple'>";
		
		while ($field_index < $num_fields)
		{
			//Create a new column for each field
			echo "<td>";
			$field_name = mysql_field_name($result, $field_index);
			echo "<div id =" . $field_name . " style='padding:0 10px 0 10px'><p class = 'report_sales_text'>" . $tuple[$field_index] . "</p></div>";
			echo "</td>";
			$field_index++;
		}
		
		echo "</tr>";
		$field_index = 0;	
		echo "</div>";
	}
}
else
{
	echo "false";
}

mysql_close();

?>
