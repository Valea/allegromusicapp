<?php

// connect with the database
include_once("MYSQL_Connect.php");

// get the query string values;
$username = $_GET["username"];
$password = $_GET["password"];


// see if the user already has an account

$customer = mysql_query("SELECT * FROM customer WHERE cid='".$username."'");
if (mysql_num_rows($customer)==0){
	echo "You do not have an account with us";
}
else {
	while ($account = mysql_fetch_array($customer)){
		if ($account['password'] != $password){
			echo "Incorrect Password!";
		}
		else {
			echo $username;
		}
	}
}

mysql_close();

?>