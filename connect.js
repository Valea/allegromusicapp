// JavaScript Document for Front and Back transactions

function pageInit(){
  // displays all items to the main page
  displayAllItem();	
  
  // create basket view for the right side bar
}


function displayAllItem()
{ 
if (window.XMLHttpRequest)
  {// initialize a request for modern browsers
  xmlhttp=new XMLHttpRequest();
  }
else
  {// initialize a request for internet explorer, cuz ie is soooo awesome!
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	// everything the php script returns goes inside the main_center tag
    document.getElementById("main_center").innerHTML=xmlhttp.responseText;
    }
  }


// request to run getAllItem.php without query strings  
xmlhttp.open("GET","getAllItem.php",true)



// excecute the request
xmlhttp.send();
}

function getByGenre(genre)
{ 
if (window.XMLHttpRequest)
  {// initialize a request for modern browsers
  xmlhttp=new XMLHttpRequest();
  }
else
  {// initialize a request for internet explorer, cuz ie is soooo awesome!
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	// everything the php script returns goes inside the main_center tag
    document.getElementById("main_center").innerHTML=xmlhttp.responseText;
    }
  }


// request to run getAllItem.php without query strings  
xmlhttp.open("GET","getByGenre.php?genre="+genre,true)



// excecute the request
xmlhttp.send();
}

// addToBasket takes in a upc and adds it to basket
function addToBasket(upc){
	// create function to addToBasket
}
