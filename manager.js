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
function itemadded(){

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
			//document.getElementById("hullahs").innerHTML=xmlhttp.responseText;
			displayMessage(xmlhttp.responseText);
		//add(0)
		}
	}
	// request to run signUp.php with query strings  
	xmlhttp.open("GET","addItem.php?title="+ title+ "&disk_type=" + diskType+ "&category=" + category+ "&company=" + company+ "&pub_year=" + year + "&price=" + price + "&stock=" + stock,true);

	// excecute the request
	xmlhttp.send();
}

function stockadded(){
	var signUpValues = document.getElementById("stock_item");

}