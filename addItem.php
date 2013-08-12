<?php

// connect with the database
include_once("MYSQL_Connect.php");

$title=$_GET["title"]; 
$disk_type=$_GET["disk_type"]; 
$category=$_GET["category"]; 
$company=$_GET["company"]; 
$pub_year=$_GET["pub_year"]; 
$price=$_GET["price"];
$stock=$_GET["stock"];
$singerlist=$_GET["singers"];
$singers = explode(",", $singerlist);
$num_singers= count($singers);

$songlist=$_GET["songs"];
$songs = explode(",", $songlist);
$num_songs= count($songs);

$item_sql = "INSERT INTO item(title,disk_type,category,company,pub_year,price,stock) 
					VALUES('$title','$disk_type','$category','$company','$pub_year','$price','$stock')";
$item_result = mysql_query($item_sql);

if ($item_result)
{
	$upc = mysql_insert_id();
	echo "Item $upc: $title inserted successfully!<br>";
	
	for ($i=0; $i<$num_singers; $i++)
	{
		//For each singer in the singerlist, insert entry into lead_singer - check for duplicates first
		$singer_dup_sql = "SELECT * FROM lead_singer WHERE upc = '$upc' AND name = '$singers[$i]'";
		$singer_dup_result = mysql_query($singer_dup_sql);
		
		if (mysql_num_rows($singer_dup_result) > 0)
		{
			echo "Error: An entry for ('$upc', '$singers[$i]') already exists in lead_singer!<br>";
		}
		else
		{
			$singer_sql = "INSERT INTO lead_singer (upc, name) VALUES ('$upc', '$singers[$i]')";
			if (!mysql_query($singer_sql))
			{
				echo "Error: " . mysql_error();
			}
			// else
			// {
				// echo "('$upc', '$singers[$i]') inserted into lead_singer!<br>";
			// }
		}
	}
	
	for ($i=0; $i<$num_songs; $i++)
	{
		//For each song in the songlist, insert entry into has_song - check for duplicates first
		$song_dup_sql = "SELECT * FROM has_song WHERE upc = '$upc' AND song_title = '$songs[$i]'";
		$song_dup_result = mysql_query($song_dup_sql);
		
		if (mysql_num_rows($song_dup_result) > 0)
		{
			echo "Error: An entry for ('$upc', '$songs[$i]') already exists in has_song!<br>";
		}
		else
		{
			$song_sql = "INSERT INTO has_song (upc, song_title) VALUES ('$upc', '$songs[$i]')";
			if (!mysql_query($song_sql))
			{
				echo "Error: " . mysql_error();
			}
			// else
			// {
				// echo "('$upc', '$songs[$i]') inserted into has_song!<br>";
			// }
		}
	}
}
else
{
	echo "Error: " . mysql_error();
}

?>