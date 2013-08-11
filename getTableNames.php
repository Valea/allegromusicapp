<?php

// connect with the database
include_once("MYSQL_Connect.php");

//get all rows from the given table
$sql = "SHOW TABLES";
$result = mysql_query($sql);
$index = 0;

while ($table = mysql_fetch_array($result))
{
	if ($index == 0)
	{
		echo "<option value=" . $table[0] . " selected>" . $table[0] . "</option>";
	}
	else
	{
		echo "<option value=" . $table[0] . " selected>" . $table[0] . "</option>";
	}
	$index++;
}

mysql_close();

?>
