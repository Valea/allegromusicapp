<?php

include_once("MYSQL_Connect.php");

mysql_query("UPDATE viewCount SET `view` = `view`+1 WHERE id = '1'");

?>