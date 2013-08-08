// JavaScript Document for Front and Back transactions

var signUp = 0;
var user ="";

var basket = new Array();
var basketUPCs = new Array();
var basketQtys = new Array();

var basketInner;
var item_upc; 
var item_quantity;


function basketItem (upc, quantity){
	this.upc = upc;
	this.quantity = quantity;
}

// when the page loads
function pageInit(){
  // displays all items to the main page
  displayAllItem();	
}

function updateBasket()
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
			// everything the php script returns goes inside the main_center ta
			document.getElementById("main_center").innerHTML=xmlhttp.responseText;
		}
	}

	// request to run getBasket.php
	basketUPCs = new Array();
	for(item in basket)
	{
		basketUPCs.push(item);
	}
	
	basketQtys = new Array();
	for(item in basket)
	{
		basketQtys.push(basket[item]);
	}
	
	var jsonUPCs = JSON.stringify(basketUPCs);
	var jsonQtys = JSON.stringify(basketQtys);
	var args = "upcs=" + jsonUPCs + "&quantity=" + jsonQtys;
	xmlhttp.open("GET","getBasket.php?" + args,true);

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
	clearCheckMark();
	showCheckMark('All');
}

function initBasket()
{
	basket = new Array();
}

//Add the given upc to the shopping basket
function addToBasket(upc)
{
	if (!(upc in basket))
	{
		basket[upc] = 1;
	}
	else
	{
		basket[upc] = basket[upc] + 1;
	}
}

//Remove the given upc from the shopping basket
function removeFromBasket(upc)
{
	for (item in basket)
	{
		if (item == upc)
		{
			delete basket[upc];
			updateBasket();
			break;
		}
	}
}

function checkoutBasket()
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
			// everything the php script returns goes inside the main_center ta
			document.getElementById("main_center").innerHTML=xmlhttp.responseText;
		}
	}

	// request to run checkoutBasket.php
	var jsonUPCs = JSON.stringify(basketUPCs);
	var jsonQtys = JSON.stringify(basketQtys);
	var args = "upcs=" + jsonUPCs + "&quantity=" + jsonQtys;
	xmlhttp.open("GET","checkoutBasket.php?" + args,true);

	// excecute the request
	xmlhttp.send();
}

function cancelOrder()
{
	alert("cancel order!");
}

function confirmOrder(form, total)
{

	var cc_number = form.cc_number.value;
	var cc_exp_date = form.cc_exp_date.value;

	alert("confirm order!");
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

	// request to run createPurchase.php
	var jsonUPCs = JSON.stringify(basketUPCs);
	var jsonQtys = JSON.stringify(basketQtys);
	alert(jsonUPCs);
	alert(jsonQtys);
	var args = "upcs=" + jsonUPCs + "&quantity=" + jsonQtys + "&cid=" + user + "&cardNum=" + cc_number + "&expiryDate=" + cc_exp_date;
	xmlhttp.open("GET","createPurchase.php?" + args,true);

	// excecute the request
	xmlhttp.send();
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

// display all items based on genre
function getByGenre(genre) { 
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
	clearCheckMark();
	showCheckMark(genre);
}

// clear check marks on left side panel
function clearCheckMark(){
	document.getElementById('all_check_img').style.opacity= '0';
	document.getElementById('rock_check_img').style.opacity= '0';
	document.getElementById('pop_check_img').style.opacity= '0';
	document.getElementById('rap_check_img').style.opacity= '0';
	document.getElementById('country_check_img').style.opacity= '0';
	document.getElementById('classical_check_img').style.opacity= '0';
	document.getElementById('newAge_check_img').style.opacity= '0';
	document.getElementById('instrumental_check_img').style.opacity= '0';
}


// show check mark beside selected genre
function showCheckMark(genre){
	if(genre == 'All'){
		document.getElementById('all_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Rock'){
		document.getElementById('rock_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Rap'){
		document.getElementById('rap_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Pop'){
		document.getElementById('pop_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Country'){
		document.getElementById('country_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Classical'){
		document.getElementById('classical_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'New Age'){
		document.getElementById('newAge_check_img').style.opacity= '1';
		return;
	}
	if(genre == 'Instrumental'){
		document.getElementById('instrumental_check_img').style.opacity= '1';
		return;
	}

}

/*
function addQuantity(){
	var quantityForm = document.getElementById("basket_quantity_form");
	var quantity = quantityForm.elements[0].value;
	if (isNaN(quantity)||quantity == null || quantity == 0){
		displayMessage('Please Enter a Number');
		return;
	}
   // create function to addToBasket
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
	   if (xmlhttp.responseText.trim() === 'false'){
		 displayMessage('Not enough Items in Stock');
	   }
	  else{
		item_quantity = quantity;
		var person = new basketItem(item_upc, item_quantity);
		// create function to addToBasket
		basket[basket.length] = person;
		addToSide(person);
	  }
    
    }
  } 
  // request to run getAllItem.php without query strings  
  xmlhttp.open("GET","checkQuantity.php?upc="+item_upc+"&quantity="+quantity,true)

  // excecute the request
  xmlhttp.send();	
  
}
*/

function search(open){
	if (open == 1){
		document.getElementById('search_popup').style.display = 'inline';
	}
	else{
		document.getElementById("title_search").value = '';
		document.getElementById("leading_singer_search").value = '';
		document.getElementById('search_popup').style.display = 'none';
		}
}
// signin to account
function signIn(open){
	if (open == 1){
		if (user != ""){
			displayMessage('Already Signed In!');
			return;
		}
		document.getElementById('sign_in_popup').style.display = 'inline';
	}
	else{
		document.getElementById("address_sign_in").value = '';
		document.getElementById("name_sign_in").value = '';
		document.getElementById("phone_sign_in").value = '';
		document.getElementById("email_sign_in").value = '';
		document.getElementById("password_sign_in").value = '';
		document.getElementById('sign_in_popup').style.display = 'none';
		document.getElementById('address_sign_in').style.display = 'none';
		document.getElementById('phone_sign_in').style.display = 'none';
		document.getElementById('name_sign_in').style.display = 'none';
		signUp = 0;
		}
}

function signIntoAccount(){
	var signUpValues = document.getElementById("sign_in_form");
	var username = signUpValues.elements[0].value;
	if (!is_email(username)){
		displayMessage('Please enter a valid e-mail');
		return;
	}
	var password = signUpValues.elements[1].value;
	if (password == null || password == ""){
		displayMessage('Please enter a password');
		return;
	}

	// when all fields are covered
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
		// everything the php script returns a message
		if (xmlhttp.responseText.trim() ===  "You do not have an account with us" || xmlhttp.responseText.trim() === "Incorrect Password!"){
			displayMessage(xmlhttp.responseText);
		}
		else{
			user = xmlhttp.responseText;
			displayMessage("Welcome back " + user);
			signIn(0);
		}
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","signIn.php?username="+ username + "&password=" + password ,true);

	// excecute the request
	xmlhttp.send();
}

function signUpForAccount(){
	if (signUp == 0){
		document.getElementById('address_sign_in').style.display = 'inline';
		document.getElementById('phone_sign_in').style.display = 'inline';
		document.getElementById('name_sign_in').style.display = 'inline';
		signUp = 1;
		return;
	}
	var signUpValues = document.getElementById("sign_in_form");
	var username = signUpValues.elements[0].value;
	if (!is_email(username)){
		displayMessage('Please enter a valid e-mail');
		return;
	}
	var password = signUpValues.elements[1].value;
	if (password == null || password == ""){
		displayMessage('Please enter a password');
		return;
	}
	var name = signUpValues.elements[2].value;
	if (name == null || name == ""){
		displayMessage('Please enter your name');
		return;
	}
	var address = signUpValues.elements[3].value;
	var phonenumber = signUpValues.elements[4].value;
	if (phonenumber != null && phonenumber !="" && !is_phone(phonenumber )){
		displayMessage('Please enter a valid 10 digit phone number');
		return;
	}
	
	// when all fields are covered
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
	// everything the php script returns a message
	displayMessage(xmlhttp.responseText);
	signIn(0);
    }
  }
  
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","signUp.php?username="+ username + "&password=" + password + "&name=" + name + "&address=" + address + "&phonenumber=" + phonenumber,true);

	// excecute the request
	xmlhttp.send();	
}

// check if the email is an actual email
function is_email(email){
	return /^([\w!.%+\-])+@([\w\-])+(?:\.[\w\-]+)+$/.test(email);
}

function is_phone(phone){
	return /^\d{10}$/.test(phone);
}

// USE THIS METHOD TO DISPLAY A MESSAGE TO A USER!!!!!!!	
function displayMessage(message){
	document.getElementById("message_box_text").innerHTML = message;
	document.getElementById('message_popup').style.display = 'inline'
}
