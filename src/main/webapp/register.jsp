<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Feasto Sign Up</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap"
	rel="stylesheet">

<style>
/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* MATCH RESTAURANT.JSP BACKGROUND */
body {
	background: #fafafa;
	font-family: 'Poppins', sans-serif;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

/* MAIN CARD */
.container {
	width: 900px; /* smaller width */
	min-height: 480px; /* reduced height */
	height: auto;
	display: flex;
	border-radius: 18px;
	background: rgba(255, 255, 255, 0.75);
	backdrop-filter: blur(12px);
	box-shadow: 0 10px 28px rgba(0, 0, 0, 0.08);
	overflow: hidden;
	animation: fadeIn 0.8s ease-out forwards;
}

/* FADE-IN ANIMATION */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* LEFT IMAGE PANEL */
.welcome-section {
	width: 60%;
	position: relative;
	overflow: hidden;
	perspective: 1000px;
}

.welcome-section img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	filter: brightness(70%);
	transform: scale(1.1);
	transition: transform 1s ease, filter 0.4s ease;
}

/* 3D PARALLAX HOVER EFFECT */
.welcome-section:hover img {
	transform: scale(1.18) rotateY(6deg);
	filter: brightness(80%);
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

/* RIGHT FORM AREA */
.form-section {
	width: 56%; /* reduced */
	padding: 28px 32px; /* smaller padding */
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

@
keyframes slideRight {from { opacity:0;
	transform: translateX(60px);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
.form-section h2 {
	font-size: 1.6rem;
}

.subtitle {
	font-size: 0.85rem;
	color: #666;
	margin-bottom: 15px;
}

/* FORM GROUP */
.form-group {
	position: relative;
	margin-bottom: 15px;
}

/* Input box */
.form-input {
	width: 100%;
	padding: 14px 14px 10px 12px;
	font-size: 15px;
	border: 1.7px solid #ddd;
	border-radius: 12px;
	background: rgba(255, 255, 255, 0.8);
	outline: none;
	transition: 0.25s ease;
}

/* Glow on focus */
.form-input:focus {
	border-color: #111;
	background: #fff;
}

/* Floating label — initial position */
.floating-label {
	position: absolute;
	left: 18px;
	top: 30%;
	transform: translateY(-10%);
	font-size: 15px;
	color: #777;
	pointer-events: none;
	transition: 0.25s ease;
}

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

/* Floating effect — final position */
.form-input:focus+.floating-label, .form-input:not(:placeholder-shown)+.floating-label
	{
	top: -8px; /* Moves ABOVE the border */
	left: 14px;
	font-size: 13px; /* Bigger than before */
	background: #fafafa; /* Smooth background to avoid overlap */
	padding: 0 6px; /* Makes it clean */
	color: #111;
}

/* BUTTON */
.submit-btn {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border-radius: 10px;
	border: none;
	background: #111;
	color: white;
	font-weight: 600;
	border-radius: 12px;
	cursor: pointer;
	margin-top: 5px;
	transition: 0.3s ease;
}

.submit-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

/* SMALL TEXT */
.toggle-text {
	text-align: center;
	font-size: 13px;
	margin-top: 15px;
	color: #555;
}

.toggle-link {
	color: black;
	text-decoration: underline;
	font-weight: 600;
}

/* RESPONSIVE */
@media ( max-width : 900px) {
	.container {
		flex-direction: column;
		width: 92%;
		height: auto;
	}
	.welcome-section {
		height: 260px;
		width: 100%;
	}
	.form-section {
		width: 100%;
		padding: 30px;
	}
}

#confetti-canvas {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
	z-index: 9999;
}
</style>
</head>

<body>
	<canvas id="confetti-canvas"></canvas>

	<div class="container">

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
			<div style="width: 100%;">
				<h2>Create Account</h2>
				<p class="subtitle">Join and explore a world of flavors</p>

				<form action="Register" method="POST">

					<div class="form-group">
						<input type="text" name="name" class="form-input" placeholder=" "
							required> <label class="floating-label">Full Name</label>
					</div>

					<div class="form-group">
						<input type="text" name="username" class="form-input"
							placeholder=" " required> <label class="floating-label">Username</label>
					</div>

					<div class="form-group">
						<input type="email" name="email" class="form-input"
							placeholder=" " required> <label class="floating-label">Email
							Address</label>
					</div>

					<div class="form-group">
						<input type="tel" name="phone" class="form-input" placeholder=" "
							required> <label class="floating-label">Phone
							Number</label>
					</div>

					<div class="form-group">
						<input type="text" name="address" class="form-input"
							placeholder=" " required> <label class="floating-label">Address</label>
					</div>

					<div class="form-group password-container">
						<input id="password" type="password" name="password"
							class="form-input" placeholder=" " required> <label
							class="floating-label">Password</label> <span class="eye-icon"
							onclick="togglePassword()"> <img id="eye-icon-img"
							src="https://cdn-icons-png.flaticon.com/512/709/709612.png">
						</span>
					</div>


					<input type="hidden" name="role" value="customer">

					<button class="submit-btn">Create Account</button>

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
						Already have an account? <a href="Login.jsp" class="toggle-link">Login</a>
					</p>
				</form>
			</div>
		</div>

	</div>
	<script>
// -------- CONFETTI EFFECT --------
const confettiCanvas = document.getElementById("confetti-canvas");
const confettiCtx = confettiCanvas.getContext("2d");
confettiCanvas.width = window.innerWidth;
confettiCanvas.height = window.innerHeight;

let confettiPieces = [];

function randomRange(min, max) {
  return Math.random() * (max - min) + min;
}

class Confetti {
  constructor() {
    this.x = Math.random() * confettiCanvas.width;
    this.y = Math.random() * -50;
    this.size = randomRange(6, 12);
    this.color = "hsl(" + randomRange(0, 360) + ", 70%, 60%)";
    this.speedY = randomRange(2, 6);
    this.speedX = randomRange(-2, 2);
    this.rotation = randomRange(0, Math.PI * 2);
    this.rotationSpeed = randomRange(-0.05, 0.05);
  }

  update() {
    this.y += this.speedY;
    this.x += this.speedX;
    this.rotation += this.rotationSpeed;
  }

  draw() {
    confettiCtx.save();
    confettiCtx.translate(this.x, this.y);
    confettiCtx.rotate(this.rotation);
    confettiCtx.fillStyle = this.color;
    confettiCtx.fillRect(-this.size / 2, -this.size / 2, this.size, this.size);
    confettiCtx.restore();
  }
}

function initConfetti() {
  for (let i = 0; i < 150; i++) {
    confettiPieces.push(new Confetti());
  }
  animateConfetti();

  setTimeout(() => {
    confettiPieces = [];
    clearCanvas();
  }, 4000);
}

function animateConfetti() {
  clearCanvas();

  confettiPieces.forEach((piece, index) => {
    piece.update();
    piece.draw();
    if (piece.y > confettiCanvas.height) confettiPieces.splice(index, 1);
  });

  requestAnimationFrame(animateConfetti);
}

function clearCanvas() {
  confettiCtx.clearRect(0, 0, confettiCanvas.width, confettiCanvas.height);
}

window.addEventListener("resize", () => {
  confettiCanvas.width = window.innerWidth;
  confettiCanvas.height = window.innerHeight;
});

// Trigger this after successful signup
function triggerSuccessConfetti() {
  initConfetti();
}
</script>

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


</body>
</html>


