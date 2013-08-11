// JavaScript Document for Front and Back transactions

var signUp = 0;
var user ="";
var basket = new Array();
var basketInner;
var item_upc; 
var item_quantity;
var checkout = 0;
var string = "";

function basketItem (upc, quantity)
{
	this.upc = upc;
	this.quantity = quantity;
}

// when the page loads
function pageInit()
{
	// displays all items to the main page
	displayAllItem();
	checkOutPopUp(0);  
}

// display all items to the main center
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
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns goes inside the main_center tag
			document.getElementById("container").innerHTML=xmlhttp.responseText;
			var container = document.querySelector('.masonry');
			var msnry = new Masonry(container, {
				columnWidth: 40, isFitWidth: true
			});
		}
	}

	// request to run getAllItem.php without query strings  
	xmlhttp.open("GET","getAllItem.php",true);
	
	// excecute the request
	xmlhttp.send();
	clearCheckMark();
	showCheckMark('All');
}

// display all items based on genre
function getByGenre(genre)
{ 
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("container").innerHTML=xmlhttp.responseText;
			var container = document.querySelector('.masonry');
			var msnry = new Masonry( container, {
			columnWidth: 40, isFitWidth: true  });
		}
	}
	
	// request to run getByGenre.php with genre parameter  
	xmlhttp.open("GET","getByGenre.php?genre="+genre,true);
	xmlhttp.send();
	clearCheckMark();
	showCheckMark(genre);
}

// clear check marks on left side panel
function clearCheckMark()
{
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
function showCheckMark(genre)
{
	if (genre == 'All'){
		document.getElementById('all_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Rock'){
		document.getElementById('rock_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Rap'){
		document.getElementById('rap_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Pop'){
		document.getElementById('pop_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Country'){
		document.getElementById('country_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Classical'){
		document.getElementById('classical_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'New Age'){
		document.getElementById('newAge_check_img').style.opacity= '1';
		return;
	}
	if (genre == 'Instrumental'){
		document.getElementById('instrumental_check_img').style.opacity= '1';
		return;
	}
}

// addToBasket takes in a upc and adds it to basket
function addToBasket(upc)
{
	if (isNaN(upc) || upc == null || upc.toString().length != 6)
	{
		displayMessage('Please enter a valid 6-digit UPC');
		return;
	}
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// if response if false, then upc is invalid
			if (xmlhttp.responseText.trim() === 'false')
			{
				displayMessage('Invalid UPC! Does not exist in database');
			}
			else
			{
				// otherwise, upc is valid, so set item_upc to given upc
				item_upc = upc;
				
				// reset the purchase_upc field on the clerk page to empty
				if (document.getElementById("purchase_upc") != null)
				{
					document.getElementById("purchase_upc").value = "";
				}
				
				// open the basketQuantity popup
				basketQuantity(1);
			}
		}
	}
	
	// request to run checkUPC.php with upc parameter
	xmlhttp.open("GET","checkUPC.php?upc="+upc,true)
	xmlhttp.send();
}

function addQuantity()
{
	var quantityForm = document.getElementById("basket_quantity_form");
	var quantity = quantityForm.elements[0].value;
	
	//Check for a valid quantity value
	if (isNaN(quantity)||quantity == null || quantity == 0)
	{
		basketQuantity(0);
		displayMessage('Please Enter a Number');
		return;
	}
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			//if response if false, then not enough items in stock
			if (xmlhttp.responseText.trim() === 'false')
			{
				basketQuantity(0);
				displayMessage('Not enough Items in Stock');
			}
			else
			{
				item_quantity = quantity;
				var person = new basketItem(item_upc, item_quantity);
				// add the (upc,qty) pair to basket array and call addToSide
				basket.push(person);
				addToSide(person);
			}
		}
	}
	
	// request to run checkQuantity.php with item upc and quantity parameters
	xmlhttp.open("GET","checkQuantity.php?upc="+item_upc+"&quantity="+quantity,true)
	xmlhttp.send();
}

function addToSide(person)
{
	basketInner = document.getElementById('basket').innerHTML;
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns goes inside the basket tag (right side bar)
			basketInner += xmlhttp.responseText;
			document.getElementById("basket").innerHTML=basketInner;
			
			//close the basketQuantity popup
			basketQuantity(0);
		}
	}
	
	// request to run addToBasket.php with the (upc,quantity) pair
	xmlhttp.open("GET","addToBasket.php?upc="+person.upc +"&quantity=" +person.quantity,true)
	xmlhttp.send();
}  

function removeFromBasket(upc)
{
	//re-create new basket array excluding the upc being removed
	var person_temp = new Array();
    for (var i = 0; i < basket.length; i++){
		if (upc != basket[i].upc){
			person_temp.push(basket[i]);
		}
	}
	
	document.getElementById("basket").innerHTML= "";
	basket = person_temp;
	 
	string = "";
	for (var i = 0; i < basket.length; i++){
		string += basket[i].upc;
		string += ",";
		string += basket[i].quantity;
		if (basket[i + 1] != null){
			string+=",";
		}
	}
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns goes inside the basket tag (right side bar)
			document.getElementById("basket").innerHTML=xmlhttp.responseText;
		}
	}
	
	// request to run removeFromBasket.php with the new basket string as parameter
	xmlhttp.open("GET","removeFromBasket.php?basketItems="+string,true);
	xmlhttp.send();
}

function basketQuantity(open)
{
	if (open == 1)
	{
		document.getElementById('basket_quantity_popup').style.display = 'inline';
	}
	else
	{
		//Reset fields when popup is closed
		document.getElementById("quantity_basket").value = '';
		document.getElementById('basket_quantity_popup').style.display = 'none';
	}
}

function checkOutPopUp(open)
{
	if (open == 1)
	{
		document.getElementById('checkout_popup').style.display = 'inline';		
		document.getElementById('credit_card_form').style.display = 'inline';
	}
	else
	{
		//Reset fields when popup is closed
		document.getElementById("credit_card_number").value = '';
		document.getElementById("expire_date").value = '';
		document.getElementById("checkout_popup_display").innerHTML = '';
		if (document.getElementById("payment_type") != null)
		{
			document.getElementById("payment_type").selectedIndex = 0;
		}
		document.getElementById('credit_card_form').style.display = 'none';
		document.getElementById('checkout_popup').style.display = 'none';
	}
}

function search(open)
{
	if (open == 1)
	{
		document.getElementById('search_popup').style.display = 'inline';
	}
	else
	{
		//Reset fields when popup is closed
		document.getElementById("title_search").value = '';
		document.getElementById("leading_singer_search").value = '';
		document.getElementById('search_popup').style.display = 'none';
	}
}
// signin to account
function signIn(open)
{
	if (open == 1)
	{
		if (user != "")
		{
			displayMessage('Already Signed In!');
			return;
		}
		document.getElementById('sign_in_popup').style.display = 'inline';
	}
	else
	{
		//Reset fields when popup is closed
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

function signIntoAccount()
{
	// check that username and password have been entered
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
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns a message
			if (xmlhttp.responseText.trim() ===  "You do not have an account with us" || xmlhttp.responseText.trim() === "Incorrect Password!")
			{
				displayMessage(xmlhttp.responseText);
			}
			else
			{
				user = xmlhttp.responseText;
				displayMessage("Welcome back " + user);
				signIn(0);
			}
		}
	}
	
	// request to run signIn.php with username and password parameters
	xmlhttp.open("GET","signIn.php?username="+ username + "&password=" + password ,true);
	xmlhttp.send();
}

function signUpForAccount()
{
	//show the address, phone and name input fields
	if (signUp == 0){
		document.getElementById('address_sign_in').style.display = 'inline';
		document.getElementById('phone_sign_in').style.display = 'inline';
		document.getElementById('name_sign_in').style.display = 'inline';
		signUp = 1;
		return;
	}
	
	// check that fields have been entered
	var signUpValues = document.getElementById("sign_in_form");
	var username = signUpValues.elements[0].value;
	if (username == null || username == "" || !is_email(username)){
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
	
	//optional address and phonenumber fields
	var address = signUpValues.elements[3].value;
	
	var phonenumber = signUpValues.elements[4].value;
	if (phonenumber != null && phonenumber !="" && !is_phone(phonenumber)){
		displayMessage('Please enter a valid 10 digit phone number');
		return;
	}
	
	// when all required fields are covered
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns a message
			displayMessage(xmlhttp.responseText);
			
			// hide the signIn popup once completed
			signIn(0);
		}
	}
  
	// request to run signUp.php with query strings
	var args = "username="+ username + "&password=" + password + "&name=" + name;
	if (address != null && address != "")
	{
		args += "&address=" + address;
	}	
	if (phonenumber != null && phonenumber != "")
	{
		args += "&phonenumber=" + phonenumber;
	}
	
	xmlhttp.open("GET","signUp.php?"+args,true);
	xmlhttp.send();	
}

function checkOut()
{
	// check if basket is empty
	if (basket.length == 0){
		displayMessage('You have nothing in your basket');
		return;
	}
	
	// create a comma-delimited string of (upc,quantity) pairs
	string = "";
	for (var i = 0; i < basket.length; i++){
		string += basket[i].upc;
		string += ",";
		string += basket[i].quantity;
		if (basket[i + 1] != null){
			string+=",";
		}
	}
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("checkout_popup_display").innerHTML=xmlhttp.responseText;
			checkOutPopUp(1);
		}
	}
	
	// request to run getTotalBasket.php
	xmlhttp.open("GET","getTotalBasket.php?basketItems="+string,true)
	xmlhttp.send();
}

function onlineCheckOut()
{
	// check that the user is signed in
	if (user == "" || user == null){
		checkOutPopUp(0);
		signIn(1);
		displayMessage('Please Sign-In First');
		return;
	}
	
	// check for that credit card info is entered
	if (checkout == 0){
		document.getElementById('credit_card_form').style.display = 'inline';
		checkout++;
		return;
	}
	var creditCard = document.getElementById("credit_card_form");
	var cardNumber = creditCard.elements[0].value;
	if (cardNumber.length != 16){
		displayMessage('Enter a 16-digit card number');
		return;
	}
	var cardDate = creditCard.elements[1].value;
	if (cardDate.length != 4 ){
		displayMessage('Enter a 4-digit card date');
		return;
	}
	
	checkout = 0;
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// show response text in the checkout popup and then reset the basket once completed
			var string = document.getElementById("checkout_popup_display").innerHTML;
			string += xmlhttp.responseText;
			checkOutPopUp(0);
			document.getElementById('receipt_text').innerHTML = string;
			document.getElementById('receipt_popup').style.display = 'inline';
			displayAllItem();
			document.getElementById('basket').innerHTML = "";
			basket = new Array();
		}
	}
	
	// request to run makePurchase.php
	xmlhttp.open("GET","makePurchase.php?basketItems="+string + "&cardnumber=" + cardNumber + "&carddate=" + cardDate + "&user=" + user,true);
	xmlhttp.send();	
}

function searchDB()
{
	// get the search parameters from the input form
	var searchValues = document.getElementById("search_form");
	var title= searchValues.elements[0].value;
	var artist = searchValues.elements[1].value;
	if (title == "" && artist == ""){
		displayMessage("Enter a song title or artist");
		return;
	}
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("container").innerHTML=xmlhttp.responseText;
			var container = document.querySelector('.masonry');
			var msnry = new Masonry(container, {
				columnWidth: 40, isFitWidth: true  
			});
			search(0);
			if (xmlhttp.responseText.trim() == ''){
				displayMessage('No Items Found');
			}
			clearCheckMark();
		}
	}
	
	// request to run getSearch.php
	xmlhttp.open("GET","getSearch.php?title="+title + "&artist="+artist,true);
	xmlhttp.send();	
}

// check if the email is an actual email
function is_email(email){
	return /^([\w!.%+\-])+@([\w\-])+(?:\.[\w\-]+)+$/.test(email);
}

// check if the phone number is an actual phone number
function is_phone(phone){
	return /^\d{10}$/.test(phone);
}

// USE THIS METHOD TO DISPLAY A MESSAGE TO A USER!!!!!!!	
function displayMessage(message){
	document.getElementById("message_box_text").innerHTML = message;
	document.getElementById('message_popup').style.display = 'inline'
}

function menuopen(element)
{
	document.getElementById(element).style.opacity = "1";
	document.getElementById(element).style.zIndex = "10";
}
function menuclose(element)
{
	document.getElementById(element).style.opacity = "0";
	document.getElementById(element).style.zIndex = "-2";
}
