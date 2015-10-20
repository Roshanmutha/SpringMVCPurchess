<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Puneri Fashion- List Transaction</title>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid Sans">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style type="text/css">
*{margin:0; padding:0; list-style:none; font-family: 'Droid Sans';}
*,::after,::before{box-sizing:border-box; -webkit-box-sizing:border-box}
body{font:12px/16px normal arial; width:100%;    height: 1100px;
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f3e2c7+23,b68d4c+78,c19e67+94,c19e67+94 */
background: #f3e2c7; /* Old browsers */
background: -moz-linear-gradient(top,  #f3e2c7 23%, #b68d4c 78%, #c19e67 94%, #c19e67 94%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(23%,#f3e2c7), color-stop(78%,#b68d4c), color-stop(94%,#c19e67), color-stop(94%,#c19e67)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* IE10+ */
background: linear-gradient(to bottom,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f3e2c7', endColorstr='#c19e67',GradientType=0 ); /* IE6-9 */

}
.wrapper{ width:1000px; margin:0 auto; position:relative;
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f3e2c7+23,b68d4c+78,c19e67+94,c19e67+94 */
background: #f3e2c7; /* Old browsers */
background: -moz-linear-gradient(top,  #f3e2c7 23%, #b68d4c 78%, #c19e67 94%, #c19e67 94%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(23%,#f3e2c7), color-stop(78%,#b68d4c), color-stop(94%,#c19e67), color-stop(94%,#c19e67)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* IE10+ */
background: linear-gradient(to bottom,  #f3e2c7 23%,#b68d4c 78%,#c19e67 94%,#c19e67 94%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f3e2c7', endColorstr='#c19e67',GradientType=0 ); /* IE6-9 */
}
.wrapper header{position:relative}
.wrapper header h3, .total-balance {
	background-color: #422D82;
	color: #f9f9f9;
	padding: 12px 20px;
	font-size: 53px;
	font-weight: 800;
	padding:20px;	
	line-height:1
}
.wrapper header h3 .dateTime{padding:5px; font-size:12pt; display:block; position:absolute; top:30%; right:0}
.content form{margin-bottom:20px;font-size:12pt;}
.content form:nth-child(1){ margin-top:10px;}
.content fieldset{border:1px 606060  solid; width:100%; padding:10px; margin-top:10px; }
.content fieldset a{ text-decoration: none; color:#0066FF}
.content fieldset a:hover{text-decoration: underline}
.content fieldset legend{font-weight:bold; font-size:12pt; font-family: 'Droid Sans';}
.content label{}

.content ol li{clear:both; display:inline-block; padding:5px; width:100%;}
.content ol li label{ padding-right:5px; min-width:200px;display:inline-block; }
.content ol li:last-child{ margin-top:10px; border-top:1px #F8F8F8 solid}
.content table{ border-collapse:collapse; width:100%; border:1px #E8E8E8 solid; margin-bottom:10px;}
.content table thead tr{background:#006699;}
.content table thead tr th{ padding:5px; color:#fff;}
.content table td{padding:5px; border:1px #f3f3f3 solid;}
.content input[type=text], .content input[type=date]{width:550px; padding:8px 5px; border:1px #D0D0D0 solid}
.content table td input[type=text], .content input[type=date]{width:200px}
/*button style */
.content input[type=button], .content input[type=submit], .content button[type=submit]
{
cursor:pointer;
border:0; color:#fff;
padding:10px; line-height:1; font-size:12pt;
background: #1e5799; /* Old browsers */
background: -moz-linear-gradient(top,  #1e5799 0%, #2989d8 50%, #399ae5 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#1e5799), color-stop(50%,#2989d8), color-stop(100%,#399ae5)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #1e5799 0%,#2989d8 50%,#399ae5 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #1e5799 0%,#2989d8 50%,#399ae5 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #1e5799 0%,#2989d8 50%,#399ae5 100%); /* IE10+ */
background: linear-gradient(to bottom,  #1e5799 0%,#2989d8 50%,#399ae5 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#399ae5',GradientType=0 ); /* IE6-9 */
}

.content input[type=submit], .content button[type=submit]
{
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#b5bdc8+0,828c95+36,28343b+100;Grey+Black+3D */
background: #b5bdc8; /* Old browsers */
background: -moz-linear-gradient(top,  #b5bdc8 0%, #828c95 36%, #28343b 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#b5bdc8), color-stop(36%,#828c95), color-stop(100%,#28343b)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #b5bdc8 0%,#828c95 36%,#28343b 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #b5bdc8 0%,#828c95 36%,#28343b 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #b5bdc8 0%,#828c95 36%,#28343b 100%); /* IE10+ */
background: linear-gradient(to bottom,  #b5bdc8 0%,#828c95 36%,#28343b 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b5bdc8', endColorstr='#28343b',GradientType=0 ); /* IE6-9 */

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
	margin:0px;padding:0px;
	width:100%;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
	
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
	
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
	
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}.CSSTableGenerator table{
    border-collapse: collapse;
        border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.CSSTableGenerator tr:last-child td:last-child {
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
}
.CSSTableGenerator table tr:first-child td:first-child {
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}
.CSSTableGenerator table tr:first-child td:last-child {
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
}.CSSTableGenerator tr:last-child td:first-child{
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
}.CSSTableGenerator tr:hover td{
	background-color:#ffffff;
		

}
.CSSTableGenerator td{
	vertical-align:middle;
		background:-o-linear-gradient(bottom, #ffd4aa 5%, #ffffff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffd4aa), color-stop(1, #ffffff) ); 
	background:-moz-linear-gradient( center top, #ffd4aa 5%, #ffffff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffd4aa", endColorstr="#ffffff");	background: -o-linear-gradient(top,#ffd4aa,ffffff);

	background-color:#ffd4aa;

	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:center;
	padding:22px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#000000;
}.CSSTableGenerator tr:last-child td{
	border-width:0px 1px 0px 0px;
}.CSSTableGenerator tr td:last-child{
	border-width:0px 0px 1px 0px;
}.CSSTableGenerator tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.CSSTableGenerator tr:first-child td{
		background:-o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff7f00), color-stop(1, #bf5f00) );
	background:-moz-linear-gradient( center top, #ff7f00 5%, #bf5f00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00", endColorstr="#bf5f00");	background: -o-linear-gradient(top,#ff7f00,bf5f00);

	background-color:#ff7f00;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
}
.CSSTableGenerator tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff7f00), color-stop(1, #bf5f00) );
	background:-moz-linear-gradient( center top, #ff7f00 5%, #bf5f00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00", endColorstr="#bf5f00");	background: -o-linear-gradient(top,#ff7f00,bf5f00);

	background-color:#ff7f00;
}
.CSSTableGenerator tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.CSSTableGenerator tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
</style>
</head><body onload="startTime()">
<div class="wrapper">
<header>
<h3 class="total-balance">
		Puneri Fashion
		<div id="dateTime" class="dateTime"> <span id="time"></span></div>
	</h3>
</header>
	<article class="content">
	<div >
		<fieldset>
			<legend>View Reports</legend>
			<form:form commandName="report" action="reports" method="post">
				<div class="CSSTableGenerator" ><table>

					<tr>
						<td>From Date: <form:input path="dateFrom" type="date"
								required="true" /></td>
						<td>To Date: <form:input path="dateTo" type="date"
								required="true" /></td>

					</tr>
					<td colspan="2"><button type=submit>Submit</button></td>
					<tr>
				</table></div>
			</form:form>
		</fieldset>
		<fieldset>
			<legend>View Reports by Mobile Number</legend>
			<form:form commandName="report" action="reportsByMobile" method="post">
				<div class="CSSTableGenerator" ><table>

					<tr>
						<td>Mobile: <form:input path="mobile"/></td>
						

					</tr>
					<td colspan="2"><button type=submit>Submit</button></td>
					<tr>
				</table></div>
			</form:form>
		</fieldset>
	</div>
	<form:form commandName="transactionHolder" action="newTransaction"
		method="get">


		<div >
			<fieldset>
				<legend>Transaction List</legend>

				<c:set var="contextPath" value="${pageContext.request.contextPath}" />
				<div class="CSSTableGenerator" ><table >
					<tr bgcolor="Grey">
						<td>Invoice ID</td>
						<td>Name</td>
						<td>Mobile</td>
						<td>Area</td>
						<td>Total Amount</td>
						<td>Transaction Date</td>
						<td>Detail Link</td>
					</tr>
					<c:forEach var="transaction" items="${transactionList}">
						<tr>
							<td><c:out value="${transaction.id}" /></td>
							<td><c:out value="${transaction.name}" /></td>
							<td><c:out value="${transaction.mobile}" /></td>
							<td><c:out value="${transaction.area}" /></td>
							<td><c:out value="${transaction.totalAmount}" /></td>
							<td><c:out value="${transaction.createdDate}" /></td>
							<td><a
								href="${contextPath}/transaction/detail/${transaction.id}">See
									Details</a></td>
						</tr>
					</c:forEach>
				</table></div>
				<br>
				<input type="button" onclick="location.href='${contextPath}/transaction/newTransaction'" value="New Transaction" />
			</fieldset>


		</div>

	</form:form>
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
		    document.getElementById('time').innerHTML =
		    	d.toDateString() + " "+h + ":" + m + ":" + s;
		    var t = setTimeout(startTime, 500);
		}
		function checkTime(i) {
		    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
		    return i;
		}
	</script>
</div>
</article>
</body>
</html>