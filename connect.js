// JavaScript Document for Front and Back transactions

var shoppingBasket = new Array();

function pageInit()
{
  // displays all items to the main page
  displayAllItem();	
}

function updateBasket()
{
	alert("update basket!");
	if (window.XMLHttpRequest)
	{
		// initialize a request for modern browsers
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// initialize a request for internet explorer, cuz ie is soooo awesome!
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns goes inside the main_center ta
			document.getElementById("main_center").innerHTML=xmlhttp.responseText;
		}
	}

	// request to run getBasketItemInfo.php
	var basketUPCs = new Array();
	for(item in shoppingBasket)
	{
		basketUPCs.push(item);
	}
	
	var basketQtys = new Array();
	for(item in shoppingBasket)
	{
		basketQtys.push(shoppingBasket[item]);
	}
	
	var jsonUPCs = JSON.stringify(basketUPCs);
	var jsonQtys = JSON.stringify(basketQtys);
	alert(jsonUPCs);
	alert(jsonQtys);
	var args = "basket=" + jsonUPCs + "&quantity=" + jsonQtys;
	xmlhttp.open("GET","getBasketItemInfo.php?" + args,true);

	// excecute the request
	xmlhttp.send();
}

function displayAllItem()
{ 
	if (window.XMLHttpRequest)
	{
		// initialize a request for modern browsers
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// initialize a request for internet explorer, cuz ie is soooo awesome!
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
	xmlhttp.open("GET","getAllItem.php",true);

	// excecute the request
	xmlhttp.send();
}

function initBasket()
{
	shoppingBasket = new Array();
}

//Add the given upc to the shopping basket
function addToBasket(upc)
{
	if (!(upc in shoppingBasket))
	{
		shoppingBasket[upc] = 1;
	}
	else
	{
		shoppingBasket[upc] = shoppingBasket[upc] + 1;
	}
	alert("Item " + upc + " has qty " + shoppingBasket[upc]);
}

//Remove the given upc from the shopping basket
function removeFromBasket(upc)
{
	for (item in shoppingBasket)
	{
		if (item == upc)
		{
			if (shoppingBasket[upc] > 0)
			{
				shoppingBasket[upc]--;
				alert("Item " + upc + " has qty " + shoppingBasket[upc]);
				break;
			}
			else
			{
				alert("0 qty for item " + upc);
				break;
			}
		}
		else
		{
			alert("Item " + upc + " not in basket");
			break;
		}
	}
}

function findMatchingItems(form)
{
	var category = form.category.value;
	var title = form.title.value;
	var singer = form.singer.value;
	var quantity = form.quantity.value;
	
	if (window.XMLHttpRequest)
	{
		// initialize a request for modern browsers
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// initialize a request for internet explorer, cuz ie is soooo awesome!
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

	// request to run filterItems
	var args = "category=" + category + "&title=" + title + "&singer=" + singer + "&quantity=" + quantity;
	xmlhttp.open("GET","filterItems.php?" + args,true);

	alert("Category " + category + " title " + title + " singer " + singer + " quantity " + quantity);
	
	// excecute the request
	xmlhttp.send();
}
