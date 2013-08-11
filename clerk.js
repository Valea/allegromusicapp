// JavaScript Document for Front and Back transactions

var signUp = 0;
var user ="";
var basket = new Array();
var basketInner;
var item_upc; 
var item_quantity;
var checkout = 0;
var string = "";

function basketItem (upc, quantity){
	this.upc = upc;
	this.quantity = quantity;
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

// USE THIS METHOD TO DISPLAY A MESSAGE TO A USER!!!!!!!	
function displayMessage(message){
	document.getElementById("message_box_text").innerHTML = message;
	document.getElementById('message_popup').style.display = 'inline'
}

//Show or hide credit card in payment info based on selected payment type
function togglePaymentInfo(type)
{
	//Hide initially
	document.getElementById("credit_card_number").style.visibility = 'hidden';
	document.getElementById("expire_date").style.visibility = 'hidden';
	if (type == "Cash")
	{
		document.getElementById("credit_card_number").style.visibility = 'hidden';
		document.getElementById("expire_date").style.visibility = 'hidden';
	}
	else if (type == "Credit")
	{
		document.getElementById("credit_card_number").style.visibility = 'visible';
		document.getElementById("expire_date").style.visibility = 'visible';
	}
}

//Process instore checkout based on payment type
function instoreCheckout(type)
{	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{			 
			var string = document.getElementById("checkout_popup_display").innerHTML;
			string += xmlhttp.responseText;
			checkOutPopUp(0);
			document.getElementById('receipt_text').innerHTML = string;
			document.getElementById('receipt_popup').style.display = 'inline';
			document.getElementById('basket').innerHTML = "";
			basket = new Array();
		}
	}	
	
	if (type == "Cash")
	{
		xmlhttp.open("GET","makePurchase.php?basketItems="+string, true);
	}
	else if (type == "Credit")
	{	
		var creditCard = document.getElementById("credit_card_form");
		var cardNumber = creditCard.elements[0].value;
		if (cardNumber.length != 16){
			displayMessage('Enter a 16-digit card number');
			return;
		}
		var cardDate = creditCard.elements[1].value;
		if (cardDate.length != 4 ){
			displayMessage('Enter a 4-digit card expiry date');
			return;
		}
		
		xmlhttp.open("GET","makePurchase.php?basketItems="+string + "&cardnumber=" + cardNumber + "&carddate=" + cardDate, true);
	}
	else
	{
		displayMessage('Please select a payment type');
		return;
	}
	
	xmlhttp.send();	
}

//Verify the receipt id for a return
function validateReturn()
{
	if (document.getElementById("return_receipt_id") != null)
	{
		var receiptId = document.getElementById("return_receipt_id").value;
		
		if (isNaN(receiptId) || receiptId === null || receiptId === '')
		{
			displayMessage('Please enter a valid receipt ID');
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
		
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{			
				if (xmlhttp.responseText.trim() === 'Invalid')
				{
					displayMessage('Invalid receiptId');
				}
				else if (xmlhttp.responseText.trim() === 'Not Within 15 Days')
				{
					displayMessage('Not within 15 days');
				}
				else
				{      
					document.getElementById("main_center").innerHTML = xmlhttp.responseText;
				}			
			}
		}
		
		// request to run validateReturn for the given receiptId
		xmlhttp.open("GET","validateReturn.php?receiptId="+receiptId,true);
		xmlhttp.send();
	}
}

//Cancel a return
function cancelReturn()
{
	document.getElementById("main_center").innerHTML="";
	checkOutPopUp(0);
	displayMessage("Return cancelled");
}

//Create a return for the given receiptId
function confirmReturn(receiptId)
{
	var upc_radios = document.getElementsByName("refund_radio");
	var upc = 0;
	
	for (var i=0; i < upc_radios.length; i++)
	{
		if (upc_radios[i].checked)
		{
			upc = upc_radios[i].value;
			break;
		}
	}
	
	var qty = document.getElementById("refund_qty_" + upc).value;
	var amt = document.getElementById("refund_amt_" + upc).value;
	
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("main_center").innerHTML="";
			var string = document.getElementById("checkout_popup_display").innerHTML;
			string += xmlhttp.responseText;
			checkOutPopUp(0);
			document.getElementById('receipt_text').innerHTML = string;
			document.getElementById('receipt_popup').style.display = 'inline';
			if (document.getElementById("return_receipt_id") != null)
			{
				document.getElementById("return_receipt_id").value = "";
			}
		}
	}
	
	// request to run createReturn for the given receiptId
	var args = "rid=" + receiptId + "&upc=" + upc + "&qty=" + qty + "&amt=" + amt;
	xmlhttp.open("GET","createReturn.php?" + args,true);
	xmlhttp.send();
}

//Calculate the refundable amount based on the quantity to be refunded
function updateRefundQtyAmount(qty, qtyRemain, price, upc)
{
	if (qty > qtyRemain)
	{
		document.getElementById("refund_qty_" + upc).value = qtyRemain;
		qty = qtyRemain;
	}
	else if (qty < 1)
	{
		document.getElementById("refund_qty_" + upc).value = 1;
		qty = 1;
	}

	var total = (qty * (price/100)).toFixed(2);
	document.getElementById("refund_amt_" + upc).value = total;
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
