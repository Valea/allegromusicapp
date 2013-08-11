var less = 1;
function add(open){
	if (open ==1){
		document.getElementById('add_popup').style.display = 'inline';
	}
	else{
		document.getElementById("add_title").value = '';
		document.getElementById("add_type").value = '';
		document.getElementById("add_cate").value = '';
		document.getElementById("add_comp").value = '';
		document.getElementById("add_year").value = '';
		document.getElementById("add_price").value = '';
		document.getElementById("add_stock").value = '';
		document.getElementById('add_popup').style.display = 'none';
	}
}
function itemAdded(){
	var addItemValues = document.getElementById("add_item");
	var title = addItemValues.elements[0].value;
	if (title == ""){
		displayMessage("Add a title");
		return;
	}
	var diskType = addItemValues.elements[1].value;
	var category= addItemValues.elements[2].value;
	var company = addItemValues.elements[3].value;
	var year = addItemValues.elements[4].value;
	var price= addItemValues.elements[5].value;
	if (price == "" || isNaN(price)){
		displayMessage("Add a Price");
		return;
	}
	var stock= addItemValues.elements[6].value;
	if (stock== "" || isNaN(stock)){
		displayMessage("Add a Stock");
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
			displayMessage(xmlhttp.responseText);
			add(0);
			displayAllItem();
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","addItem.php?title="+ title+ "&disk_type=" + diskType+ "&category=" + category+ "&company=" + company+ "&pub_year=" + year + "&price=" + price + "&stock=" + stock,true);

	// excecute the request
	xmlhttp.send();
}

function stock(open){
	if (open ==1){
		document.getElementById('stock_popup').style.display = 'inline';
	}
	else{
		document.getElementById("stock_upc").value = '';
		document.getElementById("stock_stock").value = '';
		document.getElementById("stock_price").value = '';
		document.getElementById('stock_popup').style.display = 'none';
	}
}

function sales(open){
	if (open ==1){
		document.getElementById('sales_popup').style.display = 'inline';
	}
	else{
		document.getElementById("sales_day").value = '';
		document.getElementById("sales_month").value = '';
		document.getElementById("sales_year").value = '';
		document.getElementById('sales_popup').style.display = 'none';
	}
}

function pop(open){
	if (open ==1){
		document.getElementById('popularity_popup').style.display = 'inline';
	}
	else{
		document.getElementById("top_day").value = '';
		document.getElementById("top_month").value = '';
		document.getElementById("top_year").value = '';
		document.getElementById("top_num").value = '';
		document.getElementById('popularity_popup').style.display = 'none';
	}
}


function stockAdded(){
	var addStockValues = document.getElementById("stock_item");
	var upc = addStockValues.elements[0].value;
	if(upc == ""){
		displayMessage("Please Enter a UPC");
		return;
	}
	var stock = addStockValues.elements[1].value;
	if (stock == ""){
		displayMessage("Please Enter a New Stock");
		return;
	}
	
	var price = addStockValues.elements[2].value;
	if (price == ""){
		price = 0;
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
			
			displayMessage(xmlhttp.responseText);
			stock(0);
			displayAllItem();
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","updateStock.php?upc="+ upc+ "&stock=" + stock+ "&price=" + price,true);

	// excecute the request
	xmlhttp.send();
}

function checkDate(){
	var addStockValues = document.getElementById("report_sales");
	var d = addStockValues.elements[0].value;
	var m = addStockValues.elements[1].value;
	var y = addStockValues.elements[2].value;
	var date = y + "-" + m + "-" + d;
	//var sqldate = new Date(date);
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
			document.getElementById('report_text').innerHTML = xmlhttp.responseText;
			document.getElementById('report_popup').style.display = "inline";
			sales(0);
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","checkDate.php?date="+ date,true);

	// excecute the request
	xmlhttp.send();
}

function printTop(){
	var topReportValues = document.getElementById("report_top");
	var d = topReportValues.elements[0].value;
	var m = topReportValues.elements[1].value;
	var y = topReportValues.elements[2].value;
	var num = topReportValues.elements[3].value;
	var date = y + "-" + m + "-" + d;
	//var sqldate = new Date(date);
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
			document.getElementById('report_text').innerHTML = xmlhttp.responseText;
			document.getElementById('report_popup').style.display = "inline";
			pop(0);
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","topSellingReport.php?date="+ date+ "&num=" + num,true);

	// excecute the request
	xmlhttp.send();
}

function displayLessItem() {
 if (less == 0){
	displayAllItem();
	less = 1;
	return;
	}
	
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
			document.getElementById("main_center").innerHTML="<div id='container' class='masonry'></div>";	
    document.getElementById("container").innerHTML=xmlhttp.responseText;
	var container = document.querySelector('.masonry');
	var msnry = new Masonry( container, {
    columnWidth: 40, isFitWidth: true});
	less = 0;
    }
  }

  // request to run getAllItem.php without query strings  
  xmlhttp.open("GET","getLessItem.php",true);
  // excecute the request
  xmlhttp.send();
}

function displayAllItem()
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
			// everything the php script returns goes inside the main_center tag
			document.getElementById("main_center").innerHTML="<div id='container' class='masonry'></div>";		
			document.getElementById("container").innerHTML=xmlhttp.responseText;
			var container = document.querySelector('.masonry');
			var msnry = new Masonry( container, {
				columnWidth: 40, isFitWidth: true
			});
		}
	}

	// request to run getAllItem_Manager.php without query strings  
	xmlhttp.open("GET","getAllItem_Manager.php",true);
	xmlhttp.send();
}

function displayTable(open)
{
	if (open == 1)
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
				// everything the php script returns goes inside the table_names tag
				document.getElementById("table_name").innerHTML=xmlhttp.responseText;
				document.getElementById('table_popup').style.display = 'inline';
			}
		}

		// request to run getTableNames.php without query strings  
		xmlhttp.open("GET","getTableNames.php",true);
		xmlhttp.send();
	}
	else
	{
		document.getElementById("table_name").selectedIndex = 0;
		document.getElementById('table_popup').style.display = 'none';
	}
}

function displayAllRows(table)
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
	
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			// everything the php script returns goes inside the main_center tag
			document.getElementById("main_center").innerHTML=xmlhttp.responseText;
			document.getElementById('table_popup').style.display = 'none';
		}
	}

	// request to run getAllRows.php
	xmlhttp.open("GET","getAllRows.php?table="+table,true);
	xmlhttp.send();
}

// USE THIS METHOD TO DISPLAY A MESSAGE TO A USER!!!!!!!  
function displayMessage(message){
  document.getElementById("message_box_text").innerHTML = message;
  document.getElementById('message_popup').style.display = 'inline'
}