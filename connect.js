// JavaScript Document for Front and Back transactions

var signUp = 0;
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
xmlhttp.open("GET","getAllItem.php",true);

// excecute the request
xmlhttp.send();
}

// addToBasket takes in a upc and adds it to basket
function addToBasket(upc){
	// create function to addToBasket
}

// signin
function signIn(open){
	if (open == 1)
		document.getElementById('sign_in_popup').style.display = 'inline';
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
	
	// if all fields are covered
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