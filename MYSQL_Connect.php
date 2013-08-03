   <?php
            //Variables for connecting to your database.
            //These variable values come from your hosting account.
            $hostname = "allegromusicapp.db.11025741.hostedresource.com";
            $username = "allegromusicapp";
            $dbname = "allegromusicapp";

            //These variable values need to be changed by you before deploying
            $password = "Cs304UBC!";
            
            //Connecting to your database
            mysql_connect($hostname, $username, $password) OR DIE ("Unable to 
            connect to database! Please try again later.");
            mysql_select_db($dbname);
           
            ?>