<?php

// connect with the database
include_once("MYSQL_Connect.php");

// get the query string values;
$username = $_GET["username"];
$password = $_GET["password"];
$name = $_GET["name"];
$address = (isset($_GET["address"]) ? $_GET["address"] : null);
$phonenumber = (isset($_GET["phonenumber"]) ? $_GET["phonenumber"] : null);

// check if the user already has an account before inserting
$customer = mysql_query("SELECT * FROM customer WHERE cid='".$username."'");
if (mysql_num_rows($customer) > 0)
{
	echo "E-mail id already exists!<br>Please choose another e-mail id.";
}
else
{
	if (!mysql_query("INSERT INTO customer VALUES ('$username','$password','$name','$address','$phonenumber')"))
	{
		echo "Unable to make account. Error: " . mysql_error();
	}
	else
	{
		echo "Your account has been made!";
	}
}

mysql_close();

?>