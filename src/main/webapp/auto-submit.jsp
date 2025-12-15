<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String mode = request.getParameter("paymentMode");
String address = request.getParameter("address");
String total = request.getParameter("totalAmount");

if (mode == null)
	mode = "";
if (address == null)
	address = "";
if (total == null)
	total = "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submitting…</title>
</head>
<body>

	<form id="autoForm" action="checkout" method="post">
		<input type="hidden" id="pm" name="paymentMode" value="<%=mode%>">
		<input type="hidden" id="addr" name="address" value="<%=address%>">
		<input type="hidden" id="tot" name="totalAmount" value="<%=total%>">
		<input type="hidden" name="status" value="Pending">
	</form>

	<script>
		// If JSP gave empty values, override with sessionStorage
		if (document.getElementById("pm").value.trim() === "") {
			document.getElementById("pm").value = sessionStorage
					.getItem("paymentMode");
		}

		if (document.getElementById("addr").value.trim() === "") {
			document.getElementById("addr").value = sessionStorage
					.getItem("address");
		}

		if (document.getElementById("tot").value.trim() === "") {
			document.getElementById("tot").value = sessionStorage
					.getItem("totalAmount");
		}

		// Auto submit
		document.getElementById("autoForm").submit();
	</script>

</body>
</html>
