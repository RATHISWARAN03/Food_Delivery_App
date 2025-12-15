<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Feasto - Login</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Playfair+Display:wght@700&display=swap"
	rel="stylesheet">

<style>

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #fafafa;
	display: flex;
	justify-content: center;
	min-height: 100vh;
	font-family: 'Poppins', sans-serif;
}

/* MAIN CONTAINER (Same as Signup Page) */
.container {
	width: 900px;
	min-height: 520px;
	height: auto;
	margin: 40px auto;
	border-radius: 20px;
	background: rgba(255, 255, 255, 0.75);
	backdrop-filter: blur(12px);
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

/* FLEX LAYOUT */
.auth-wrapper {
	display: flex;
	width: 100%;
	height: 100%;
}

/* LEFT SIDE IMAGE */
.welcome-section {
	width: 52%;
	height: 100%;
	position: relative;
	overflow: hidden;
}

.login-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.welcome-overlay {
	position: absolute;
	bottom: 35px;
	left: 30px;
	text-align: left;
	color: white;
}

.welcome-overlay h1 {
	font-family: 'Playfair Display', serif;
	font-size: 42px;
	font-weight: 700;
}

.welcome-overlay p {
	font-size: 16px;
	margin-top: 6px;
	opacity: 0.95;
}

/* RIGHT SIDE FORM */
.form-section {
	width: 50%;
	padding: 40px 45px;
	display: flex;
	justify-content: flex-start;
	align-items: flex-start;
}

.form-container {
	width: 100%;
}

/* TITLES */
.form-container h2 {
	margin-top: 6rem;
	font-size: 30px;
	font-weight: 700;
}

.subtitle {
	font-size: 14px;
	color: #666;
	margin-bottom: 22px;
}

/* FLOATING LABEL INPUTS */
.form-group {
	position: relative;
	margin-bottom: 18px;
}

.form-input {
	width: 100%;
	padding: 12px 15px;
	height: 48px;
	font-size: 15px;
	border: 1.6px solid #ddd;
	border-radius: 12px;
	background: white;
	outline: none;
	transition: 0.25s ease;
}

.form-input:focus {
	border-color: black;
}

.floating-label {
	position: absolute;
	top: 50%;
	left: 18px;
	transform: translateY(-50%);
	color: #777;
	font-size: 15px;
	pointer-events: none;
	transition: 0.25s ease;
}

/* CENTERED TEXT */
.welcome-overlay {
	position: absolute;
	bottom: 40px;
	left: 40px;
	color: white;
	animation: textFadeUp 1.4s ease-out forwards;
}

@
keyframes slideIn {from { opacity:0;
	transform: translate(-50%, -40%);
}

to {
	opacity: 1;
	transform: translate(-50%, -50%);
}

}
.welcome-overlay h1 {
	font-family: 'Playfair Display', serif;
	font-size: 2.6rem;
	margin: 0;
	color: #FF6B29; /* bright scooter-orange */
	font-weight: 700;
}

.welcome-overlay p {
	font-size: 1rem;
	margin-top: 6px;
	color: #3B2F2F; /* deep readable brown */
	opacity: 0.95;
	margin-bottom: 32rem;
}

.welcome-overlay {
	animation: fadeInText 1.2s ease-out forwards;
}

@
keyframes fadeInText {from { opacity:0;
	
}

to {
	opacity: 1;
}

}

/* FLOATING EFFECT */
.form-input:focus+.floating-label, .form-input:not(:placeholder-shown)+.floating-label
	{
	top: -2px;
	left: 14px;
	background: #fafafa;
	padding: 0 6px;
	font-size: 12px;
	color: black;
	font-weight: 500;
}

/* PASSWORD EYE ICON */
.password-container {
	position: relative;
}

.eye-icon {
	position: absolute;
	top: 50%;
	right: 14px;
	transform: translateY(-50%);
	cursor: pointer;
}

.eye-icon img {
	width: 20px;
	opacity: 0.75;
}

/* BUTTON */
.submit-btn {
	width: 100%;
	padding: 12px;
	background: #111;
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	margin-top: 10px;
	transition: 0.25s;
}

.submit-btn:hover {
	transform: translateY(-2px);
}

/* BOTTOM TEXT */
.toggle-text {
	text-align: center;
	margin-top: 15px;
	font-size: 14px;
}

.toggle-link {
	color: #FF5E1A;
	font-weight: 600;
	text-decoration: none;
}
</style>

<!-- PASSWORD TOGGLE JS -->
<script>
	function togglePassword() {
		let passwordField = document.getElementById("password");
		let eyeIcon = document.getElementById("eye-icon-img");

		if (passwordField.type === "password") {
			passwordField.type = "text";
			eyeIcon.src = "https://cdn-icons-png.flaticon.com/512/159/159604.png";
		} else {
			passwordField.type = "password";
			eyeIcon.src = "https://cdn-icons-png.flaticon.com/512/709/709612.png";
		}
	}
</script>

</head>
<body>



	<!-- MAIN UI -->
	<div class="container">


		<div class="auth-wrapper">


			<!-- LEFT IMAGE PANEL -->
			<div class="welcome-section">

				<!-- Background Video -->
				<video autoplay loop muted playsinline id="login-video"
					style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
					<source src="Image/front.mp4" type="video/mp4">
				</video>

				<div class="welcome-overlay">
					<h1>Feasto</h1>
					<p>Your food, delivered fresh.</p>
				</div>

			</div>


			<!-- RIGHT FORM -->
			<div class="form-section">
				<div class="form-container">
					<!-- ERROR MESSAGE -->
					<%
					if (request.getAttribute("error") != null) {
					%>
					<div
						style="background: #FF6B29; padding: 15px; color: white; border-radius: 10px; text-align: center; position: absolute; top: 45px; right: 75px; font-size: 16px; display: flex; align-items: center; gap: 10px;">
						<span style="font-size: 20px;">⚠</span>
						<%=request.getAttribute("error")%>
					</div>
					<%
					}
					%>
					<h2>Welcome Back</h2>
					<p class="subtitle">Sign in to continue your culinary journey.</p>

					<form action="login" method="POST">

						<!-- EMAIL -->
						<div class="form-group">
							<input type="email" id="email" name="email" class="form-input"
								placeholder=" " required> <label class="floating-label">Email
								Address</label>
						</div>

						<!-- PASSWORD -->
						<div class="form-group password-container">
							<input type="password" id="password" name="password"
								class="form-input" placeholder=" " required> <label
								class="floating-label">Password</label> <span class="eye-icon"
								onclick="togglePassword()"> <img id="eye-icon-img"
								src="https://cdn-icons-png.flaticon.com/512/709/709612.png">
							</span>
						</div>

						<button type="submit" class="submit-btn">Sign In</button>
					</form>

					<!-- SOCIAL SIGN-IN SECTION -->
					<div style="text-align: center; margin-top: 25px;">

						<!-- Divider with text -->
						<div
							style="display: flex; align-items: center; justify-content: center; gap: 12px;">
							<div style="height: 1px; width: 34%; background: #d8d8d8;"></div>
							<span style="font-size: 14px; color: #666;">Sign in with</span>
							<div style="height: 1px; width: 34%; background: #d8d8d8;"></div>
						</div>

						<!-- Social icons -->
						<div
							style="margin-top: 18px; display: flex; justify-content: center; gap: 28px;">
							<img src="https://cdn-icons-png.flaticon.com/512/733/733547.png"
								width="34" style="cursor: pointer; transition: 0.3s;"
								onmouseover="this.style.transform='scale(1.15)'"
								onmouseout="this.style.transform='scale(1)'" /> <img
								src="https://cdn-icons-png.flaticon.com/512/300/300221.png"
								width="34" style="cursor: pointer; transition: 0.3s;"
								onmouseover="this.style.transform='scale(1.15)'"
								onmouseout="this.style.transform='scale(1)'" /> <img
								src="https://cdn-icons-png.flaticon.com/512/733/733579.png"
								width="34" style="cursor: pointer; transition: 0.3s;"
								onmouseover="this.style.transform='scale(1.15)'"
								onmouseout="this.style.transform='scale(1)'" />
						</div>

					</div>

					<p class="toggle-text">
						Don't have an account? <a href="register.jsp" class="toggle-link">Sign
							Up</a>
					</p>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
