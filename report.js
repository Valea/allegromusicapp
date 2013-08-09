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

function checkDate2(){
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
			document.getElementById("hullahs4").innerHTML=xmlhttp.responseText;
			//displayMessage(xmlhttp.responseText);
		//add(0)
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","checkDate.php?date="+ date,true);

	// excecute the request
	xmlhttp.send();
}

function menuopen(element){
				document.getElementById(element).style.opacity = "1";
				document.getElementById(element).style.zIndex = "10";
				
			}
			function menuclose(element){
				document.getElementById(element).style.opacity = "0";
				document.getElementById(element).style.zIndex = "-2";
				
			}

