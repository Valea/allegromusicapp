<?php

// connect with the database
include_once("MYSQL_Connect.php");

// get the query string values;
$username = $_GET["username"];
$password = $_GET["password"];
$name = $_GET["name"];
$address = $_GET["address"];
$phonenumber = $_GET["phonenumber"];

$q = "insert into customer values ('" . $username . "','" . $password . "', '" . $name . "', '" . $address . "', '" . $phonenumber. "')";

// see if the user already has an account

$customer = mysql_query("SELECT * FROM customer WHERE cid='".$username."'");
if (mysql_num_rows($customer)>0){
	echo "You already have an account with us";
}
else {

	if (!mysql_query("insert into customer values ('$username','$password','$name','$address','$phonenumber')"))
		echo "Unable to make account";
	else
		echo "Your account has been made!";
}


mysql_close();

?>