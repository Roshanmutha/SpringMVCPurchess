<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Puneri Fashion- New Transaction</title>
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid Sans">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<SCRIPT language="javascript">
<!--
	function addRow(tableID) {

		var table = document.getElementById(tableID);

		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);

		var cell1 = row.insertCell(0);
		var element1 = document.createElement("input");
		element1.type = "checkbox";
		element1.name = "chkbox[]";
		cell1.appendChild(element1);

		/* var cell2 = row.insertCell(1);
		cell2.innerHTML = rowCount + 1; */

		var cell3 = row.insertCell(1);
		var element2 = document.createElement("input");
		element2.type = "text";
		var length = (table.rows.length) - 1;
		element2.name = "operationParameterses[" + length + "].name";
		element2.placeholder = "Enter Product Name!";
		cell3.appendChild(element2);

		/* var cell4 = row.insertCell(2);
		var element3 = document.createElement("input");
		element3.type = "text";
		element3.placeholder="Enter Number Of Items!";
		var length = (table.rows.length) - 1;
		element3.name = "operationParameterses[" + length + "].items";
		cell4.appendChild(element3); */
		var cell4 = row.insertCell(2)
		var selectList = document.createElement("select");
		selectList.id = "mySelect";
		var length = (table.rows.length) - 1;
		selectList.name = "operationParameterses[" + length + "].items";
		cell4.appendChild(selectList);

		//Create and append the options
		for (var i = 1; i < 101; i++) {
			var option = document.createElement("option");
			option.value = i;
			option.text = i;
			selectList.appendChild(option);
		}
		var cell5 = row.insertCell(3);
		var element4 = document.createElement("input");
		element4.type = "text";
		element4.placeholder = "Enter Product Price!";
		var length = (table.rows.length) - 1;
		element4.name = "operationParameterses[" + length + "].price";
		cell5.appendChild(element4);

	}

	function deleteRow(tableID) {
		try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for (var i = 0; i < rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if (null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}
			}
		} catch (e) {
			alert(e);
		}
	}
	
</SCRIPT>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style: none;
	font-family: 'Droid Sans';
}

*, ::after, ::before {
	box-sizing: border-box;
	-webkit-box-sizing: border-box
}

body {
	font: 12px/16px normal arial;
	width: 100%;
	height: 100%;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f3e2c7+23,b68d4c+78,c19e67+94,c19e67+94 */
	background: #f3e2c7; /* Old browsers */
	background: -moz-linear-gradient(top, #f3e2c7 23%, #b68d4c 78%, #c19e67 94%, #c19e67
		94%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(23%, #f3e2c7),
		color-stop(78%, #b68d4c), color-stop(94%, #c19e67),
		color-stop(94%, #c19e67)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #f3e2c7 23%, #b68d4c 78%, #c19e67 94%,
		#c19e67 94%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #f3e2c7 23%, #b68d4c 78%, #c19e67 94%, #c19e67
		94%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #f3e2c7 23%, #b68d4c 78%, #c19e67 94%, #c19e67
		94%); /* IE10+ */
	background: linear-gradient(to bottom, #f3e2c7 23%, #b68d4c 78%, #c19e67 94%,
		#c19e67 94%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f3e2c7',
		endColorstr='#c19e67', GradientType=0); /* IE6-9 */
}

input[type="checkbox"] {
	width: 20px; /*Desired width*/
	height: 20px; /*Desired height*/
}

.wrapper {
	width: 1000px;
	margin: 0 auto;
	position: relative;
}

.wrapper header {
	position: relative
}

.wrapper header h3, .total-balance {
	background-color: #422D82;
	color: #f9f9f9;
	padding: 12px 20px;
	font-size: 53px;
	font-weight: 800;
	padding: 20px;
	line-height: 1
}

.wrapper header h3 .dateTime {
	padding: 5px;
	font-size: 12pt;
	display: block;
	position: absolute;
	top: 30%;
	right: 0
}

.content form {
	margin-bottom: 20px;
	font-size: 12pt;
}

.content form:nth-child(1) {
	margin-top: 10px;
}

.content fieldset {
	border: 1px 606060 solid;
	width: 100%;
	padding: 10px;
	margin-top: 10px;
}

.content fieldset a {
	text-decoration: none;
	color: #0066FF
}

.content fieldset a:hover {
	text-decoration: underline
}

.content fieldset legend {
	font-weight: bold;
	font-size: 12pt;
	font-family: 'Droid Sans';
}

.content label {
	
}

.content ol li {
	clear: both;
	display: inline-block;
	padding: 5px;
	width: 100%;
}

.content ol li label {
	padding-right: 5px;
	min-width: 200px;
	display: inline-block;
}

.content ol li:last-child {
	margin-top: 10px;
}

.content table {
	border-collapse: collapse;
	width: 100%;
	border: 1px #E8E8E8 solid;
	margin-bottom: 10px;
}

.content table thead tr {
	background: #006699;
}

.content table thead tr th {
	padding: 5px;
	color: #fff;
}

.content table td {
	padding: 5px;
	border: 1px #f3f3f3 solid;
}

.content input[type=text], .content input[type=date] {
	width: 550px;
	padding: 8px 5px;
	border: 1px #D0D0D0 solid
}

.content table td input[type=text], .content input[type=date] {
	width: 200px
}
/*button style */
.content input[type=button], .content input[type=submit], .content button[type=submit]
	{
	cursor: pointer;
	border: 0;
	color: #fff;
	padding: 10px;
	line-height: 1;
	font-size: 12pt;
	background: #1e5799; /* Old browsers */
	background: -moz-linear-gradient(top, #1e5799 0%, #2989d8 50%, #399ae5 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e5799),
		color-stop(50%, #2989d8), color-stop(100%, #399ae5));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #1e5799 0%, #2989d8 50%, #399ae5 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #1e5799 0%, #2989d8 50%, #399ae5 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #1e5799 0%, #2989d8 50%, #399ae5 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #1e5799 0%, #2989d8 50%, #399ae5 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799',
		endColorstr='#399ae5', GradientType=0); /* IE6-9 */
}

.content input[type=submit], .content button[type=submit] {
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#b5bdc8+0,828c95+36,28343b+100;Grey+Black+3D */
	background: #b5bdc8; /* Old browsers */
	background: -moz-linear-gradient(top, #b5bdc8 0%, #828c95 36%, #28343b 100%);
	/* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #b5bdc8),
		color-stop(36%, #828c95), color-stop(100%, #28343b));
	/* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #b5bdc8 0%, #828c95 36%, #28343b 100%);
	/* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #b5bdc8 0%, #828c95 36%, #28343b 100%);
	/* Opera 11.10+ */
	background: -ms-linear-gradient(top, #b5bdc8 0%, #828c95 36%, #28343b 100%);
	/* IE10+ */
	background: linear-gradient(to bottom, #b5bdc8 0%, #828c95 36%, #28343b 100%);
	/* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b5bdc8',
		endColorstr='#28343b', GradientType=0); /* IE6-9 */
}

.footer {
	background-color: #422D82;
	color: #f9f9f9;
	padding: 12px 20px;
	font-size: 15px;
	font-weight: 800;
	margin: 13px 0;
}

.CSSTableGenerator {
	margin: 0px;
	padding: 0px;
	width: 100%;
	box-shadow: 10px 10px 5px #888888;
	border: 1px solid #000000;
	-moz-border-radius-bottomleft: 0px;
	-webkit-border-bottom-left-radius: 0px;
	border-bottom-left-radius: 0px;
	-moz-border-radius-bottomright: 0px;
	-webkit-border-bottom-right-radius: 0px;
	border-bottom-right-radius: 0px;
	-moz-border-radius-topright: 0px;
	-webkit-border-top-right-radius: 0px;
	border-top-right-radius: 0px;
	-moz-border-radius-topleft: 0px;
	-webkit-border-top-left-radius: 0px;
	border-top-left-radius: 0px;
}

.CSSTableGenerator table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.CSSTableGenerator tr:last-child td:last-child {
	-moz-border-radius-bottomright: 0px;
	-webkit-border-bottom-right-radius: 0px;
	border-bottom-right-radius: 0px;
}

.CSSTableGenerator table tr:first-child td:first-child {
	-moz-border-radius-topleft: 0px;
	-webkit-border-top-left-radius: 0px;
	border-top-left-radius: 0px;
}

.CSSTableGenerator table tr:first-child td:last-child {
	-moz-border-radius-topright: 0px;
	-webkit-border-top-right-radius: 0px;
	border-top-right-radius: 0px;
}

.CSSTableGenerator tr:last-child td:first-child {
	-moz-border-radius-bottomleft: 0px;
	-webkit-border-bottom-left-radius: 0px;
	border-bottom-left-radius: 0px;
}

.CSSTableGenerator tr:hover td {
	background-color: #ffffff;
}

.CSSTableGenerator td {
	vertical-align: middle;
	background: -o-linear-gradient(bottom, #ffd4aa 5%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffd4aa
		), color-stop(1, #ffffff));
	background: -moz-linear-gradient(center top, #ffd4aa 5%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffd4aa",
		endColorstr="#ffffff");
	background: -o-linear-gradient(top, #ffd4aa, ffffff);
	background-color: #ffd4aa;
	border: 1px solid #000000;
	border-width: 0px 1px 1px 0px;
	text-align: center;
	padding: 12px;
	font-size: 14px;
	font-family: Arial;
	font-weight: bold;
	color: #000000;
}

.CSSTableGenerator tr:last-child td {
	border-width: 0px 1px 0px 0px;
}

.CSSTableGenerator tr td:last-child {
	border-width: 0px 0px 1px 0px;
}

.CSSTableGenerator tr:last-child td:last-child {
	border-width: 0px 0px 0px 0px;
}

.CSSTableGenerator tr:first-child td {
	background: -o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ff7f00
		), color-stop(1, #bf5f00));
	background: -moz-linear-gradient(center top, #ff7f00 5%, #bf5f00 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00",
		endColorstr="#bf5f00");
	background: -o-linear-gradient(top, #ff7f00, bf5f00);
	background-color: #ff7f00;
	border: 0px solid #000000;
	text-align: center;
	border-width: 0px 0px 1px 1px;
	font-size: 14px;
	font-family: Arial;
	font-weight: bold;
	color: #ffffff;
}

.CSSTableGenerator tr:first-child:hover td {
	background: -o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ff7f00
		), color-stop(1, #bf5f00));
	background: -moz-linear-gradient(center top, #ff7f00 5%, #bf5f00 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00",
		endColorstr="#bf5f00");
	background: -o-linear-gradient(top, #ff7f00, bf5f00);
	background-color: #ff7f00;
}

.CSSTableGenerator tr:first-child td:first-child {
	border-width: 0px 0px 1px 0px;
}

.CSSTableGenerator tr:first-child td:last-child {
	border-width: 0px 0px 1px 1px;
}
</style>
</head>
<body onload="startTime()">
	<div class="wrapper">
		<header>
		<h3 class="total-balance">
			Puneri Fashion
			
			<div id="dateTime" class="dateTime">
				<span id="time"></span>
			</div>
		</h3>
		</header>
		<article class="content"> <form:form action="loadCustomer"
			method="post">
			<fieldset>
				<legend>Search Customer</legend>
				<ol>
					<li><label>Load by Mobile :</label> <input id="mobileSearch"
						type="text" name="mobileSearch"> <input type="submit"
						name="Search" value="Search Customer" /></li>
				</ol>
				<c:if test="${not empty mobileErrorMessage}">
					<ol>
					<li><h3 style="color: red">${mobileErrorMessage}</h3></li>
					</ol>
				</c:if>
			</fieldset>
		</form:form> <form:form action="loadTransaction" method="post">
			<fieldset>
				<legend>Load Invoice</legend>
				<ol>
					<li><label>Invoice ID :</label> <input id="transactionid"
						type="text" name="transactionid"> <input type="submit"
						name="Search" value="Search Invoice" /></li>
				</ol>
				<c:if test="${not empty transactionErrorMessage}">
					<ol>
					<li><h3 style="color: red">${transactionErrorMessage}</h3></li>
					</ol>
				</c:if>
			</fieldset>
		</form:form> <form:form commandName="transactionHolder" action="newTransaction"
			method="post">
			
			<fieldset>
				<legend>New Transaction</legend>
				<ol>
					<li><label for=name>Customer Name: </label> <form:input
							path="name" type="text" required="true"
							placeholder="Enter First Name and last Name!" /></li>

					<li><label for=name>Customer Area: </label> <form:input
							path="area" type="text" required="true"
							placeholder="Cutomer Address!" /></li>

					<li><label for=name>Customer BirthDate :</label> <form:input
							path="dob" type="date" required="false" /><label>&nbsp;&nbsp;
							Enter in format 'MM-DD-YYYY'</label></li>

					<li><label for=email>Customer Email :</label> <form:input
							path="email" type="text" required="false"
							placeholder="Enter Email address!" /></li>

					<li><label for=phone>Customer Phone :</label> <form:input
							path="phone" type="text" required="true"
							placeholder="Enter Phone number!" /></li>

					<li><legend>Purchess details : </legend>
					<c:if test="${not empty transactionSaveErrorMessage}">
					<br>
					<h3 style="color: red">${transactionSaveErrorMessage}</h3>
					<br>
				</c:if>
					<br>
						<div class="CSSTableGenerator">
						
							<div class="CSSTableGenerator">
							
								<table id="dataTable">
									<tr bgcolor="Grey">
										<td>Select</td>
										<td>Product Name</td>
										<td>Quantity</td>
										<td>Price (Rs.)</td>

									</tr>
									<TR>
										<td><INPUT type="checkbox" name="chk" /></td>
										<!-- <td>1</td> -->
										<td><INPUT type='text'
											name="operationParameterses[0].name"
											placeholder="Enter Product Name!" /></td>
										<td>
											<!-- <INPUT type='text'
									name="operationParameterses[0].items"
									placeholder="Enter Number Of Items!"/> --> <select
											name="operationParameterses[0].items" style="width: 50px">
												<%
													for (int i = 1; i < 101; i++) {
												%>
												<option value="<%=i%>"><%=i%></option>
												<%
													}
												%>
										</select>
										</td>
										<td><INPUT type='text'
											name="operationParameterses[0].price"
											placeholder="Enter Product Price!" /></td>
									</TR>
								</table>
							</div>
						</div>
						<br> <INPUT type="button" value="+  Add Item      "
						onclick="addRow('dataTable')" /> <INPUT type="button"
						value=" - Delete Item    " onclick="deleteRow('dataTable')" /></li>

				</ol>


			</fieldset>
			<fieldset>
				<c:set var="contextPath" value="${pageContext.request.contextPath}" />
				<button type=submit>Save Current Transaction</button>

				<input type="button"
					onclick="location.href='${contextPath}/transaction/list'"
					value="See todays transactions" /> <input type="button"
					onclick="location.href='${contextPath}/transaction/newTransaction'"
					value="New Transaction" />
			</fieldset>

		</form:form> </article>

		<div class="footer">
			<p>Puneri Fashion, Porwal Rd, Kutwal Colony, Lohgaon, Pune,
				Maharashtra 411047,Contact : 9552807811</p>
		</div>
		<script type="text/javascript">
			var d = new Date();

			function startTime() {
				var today = new Date();
				var h = today.getHours();
				var m = today.getMinutes();
				var s = today.getSeconds();
				m = checkTime(m);
				s = checkTime(s);
				document.getElementById('time').innerHTML = d.toDateString()
						+ " " + h + ":" + m + ":" + s;
				var t = setTimeout(startTime, 500);
			}
			function checkTime(i) {
				if (i < 10) {
					i = "0" + i
				}
				; // add zero in front of numbers < 10
				return i;
			}
		</script>

	</div>
</body>
</html>