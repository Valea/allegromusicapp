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
		document.getElementById("add_title").style.display = 'none';
		document.getElementById("add_type").style.display = 'none';
		document.getElementById("add_cate").style.display = 'none';
		document.getElementById("add_comp").style.display = 'none';
		document.getElementById("add_year").style.display = 'none';
		document.getElementById("add_price").style.display = 'none';
		document.getElementById("add_stock").style.display = 'none';

}
}
function itemAdded(){

	var addItemValues = document.getElementById("add_item");
	var title = addItemValues.elements[0].value;
	var diskType = addItemValues.elements[1].value;
	var category= addItemValues.elements[2].value;
	var company = addItemValues.elements[3].value;
	var year = addItemValues.elements[4].value;
	var price= addItemValues.elements[5].value;
	var stock= addItemValues.elements[6].value;

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
			document.getElementById("hullahs").innerHTML=xmlhttp.responseText;
			//displayMessage(xmlhttp.responseText);
		//add(0)
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","addItem.php?title="+ title+ "&disk_type=" + diskType+ "&category=" + category+ "&company=" + company+ "&pub_year=" + year + "&price=" + price + "&stock=" + stock,true);

	// excecute the request
	xmlhttp.send();
}

function stockAdded(){
	var addStockValues = document.getElementById("stock_item");
	var upc = addStockValues.elements[0].value;
	var stock = addStockValues.elements[1].value;
	var price = addStockValues.elements[2].value;
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
			document.getElementById("hullahs2").innerHTML=xmlhttp.responseText;
			//displayMessage(xmlhttp.responseText);
		//add(0)
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","addStock.php?upc="+ upc+ "&stock=" + stock+ "&price=" + price,true);

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
			document.getElementById("hullahs3").innerHTML=xmlhttp.responseText;
			//displayMessage(xmlhttp.responseText);
		//add(0)
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
			document.getElementById("hullahs4").innerHTML=xmlhttp.responseText;
			//displayMessage(xmlhttp.responseText);
		//add(0)
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","topSellingReport.php?date="+ date+ "&num=" + num,true);

	// excecute the request
	xmlhttp.send();
}

// USE THIS METHOD TO DISPLAY A MESSAGE TO A USER!!!!!!!  
function displayMessage(message){
  document.getElementById("message_box_text").innerHTML = message;
  document.getElementById('message_popup').style.display = 'inline'
}