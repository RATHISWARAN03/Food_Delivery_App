<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>COD – Story Animation</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: "Poppins", sans-serif;
	background: #f7f4ef;
	color: #e5e7eb;
}

/* card */
.card {
	width: 92%;
	max-width: 820px;
	height: 460px;
	border-radius: 26px;
	background: #020617;
	border: 1px solid #1f2937;
	box-shadow: 0 12px 30px rgba(0, 0, 0, .9);
	padding: 24px 26px;
	position: relative;
	overflow: hidden;
}

/* timeline left */
.timeline {
	position: absolute;
	left: 26px;
	top: 40px;
	bottom: 40px;
	width: 210px;
}

.step {
	margin-bottom: 36px;
	opacity: .25;
	transform: translateX(-10px);
	transition: .4s ease;
}

.step.active {
	opacity: 1;
	transform: translateX(0);
}

.step-title {
	font-size: 14px;
	font-weight: 700;
}

.step-text {
	font-size: 12px;
	color: #9ca3af;
}

.dot {
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #4b5563;
	margin-bottom: 6px;
	box-shadow: 0 0 0 0 transparent;
}

.step.active .dot {
	background: #22c55e;
	box-shadow: 0 0 10px #22c55eaa;
}

/* right scene */
.scene {
	position: absolute;
	right: 26px;
	top: 26px;
	bottom: 26px;
	left: 260px;
	border-radius: 20px;
	background: linear-gradient(to bottom, #020618, #111827 60%, #020617 60%, #020617
		100%);
	overflow: hidden;
}

/* top text */
.scene-header {
	padding: 20px 22px 8px;
}

.scene-header h2 {
	font-size: 18px;
	font-weight: 800;
}

.scene-header p {
	font-size: 13px;
	color: #9ca3af;
	margin-top: 4px;
}

/* package → bike → home story layers */
.stage {
	position: absolute;
	inset: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0;
	transform: scale(.9);
	transition: .6s ease;
}

.stage.visible {
	opacity: 1;
	transform: scale(1);
}

/* stage1 box */
.box {
	width: 90px;
	height: 90px;
	border-radius: 20px;
	background: linear-gradient(135deg, #f97316, #fed7aa);
	box-shadow: 0 18px 40px rgba(0, 0, 0, .6);
	position: relative;
}

.box::before {
	content: "";
	position: absolute;
	inset: 10px;
	border-radius: 16px;
	border: 3px solid rgba(255, 255, 255, .6);
}

.box::after {
	content: "PACKED";
	position: absolute;
	bottom: -26px;
	left: 50%;
	transform: translateX(-50%);
	font-size: 11px;
	letter-spacing: 1px;
}

/* stage2 bike (simplified) */
.bike {
	width: 160px;
	height: 70px;
	position: relative;
}

.bike-wheel {
	position: absolute;
	bottom: 0;
	width: 38px;
	height: 38px;
	border-radius: 50%;
	background: radial-gradient(circle, #555 0, #111 60%, #000 100%);
	border: 3px solid #444;
	animation: spin .6s linear infinite;
}

.bike-wheel.left {
	left: 20px;
}

.bike-wheel.right {
	left: 100px;
}

@
keyframes spin {
	to {transform: rotate(360deg);
}

}
.bike-body {
	position: absolute;
	bottom: 18px;
	left: 24px;
	width: 96px;
	height: 28px;
	border-radius: 14px 32px 14px 8px;
	background: linear-gradient(135deg, #3b82f6, #60a5fa);
}

.bike-box {
	position: absolute;
	bottom: 42px;
	left: 15px;
	width: 46px;
	height: 34px;
	border-radius: 10px;
	background: linear-gradient(135deg, #22c55e, #4ade80);
}

/* stage3 home */
.home {
	width: 120px;
	height: 90px;
	position: relative;
}

.roof {
	width: 0;
	height: 0;
	border-left: 60px solid transparent;
	border-right: 60px solid transparent;
	border-bottom: 40px solid #fb923c;
}

.house {
	width: 120px;
	height: 60px;
	background: #111827;
	border-radius: 0 0 18px 18px;
	box-shadow: 0 18px 40px rgba(0, 0, 0, .7);
}

.door {
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 26px;
	height: 40px;
	border-radius: 10px;
	background: #0ea5e9;
}

/* bottom progress bar */
.progress {
	position: absolute;
	left: 260px;
	right: 26px;
	bottom: 18px;
	height: 6px;
	border-radius: 999px;
	background: #020617;
	overflow: hidden;
}

.progress-fill {
	height: 100%;
	width: 0;
	border-radius: inherit;
	background: linear-gradient(90deg, #22c55e, #4ade80);
	animation: fill 4s forwards ease-out;
}

@
keyframes fill {
	to {width: 100%;
}
}
</style>
</head>
<body>
	<div class="card">
		<div class="timeline">
			<div class="step" id="s1">
				<div class="dot"></div>
				<div class="step-title">Order Packed</div>
				<div class="step-text">Restaurant has prepared your items.</div>
			</div>
			<div class="step" id="s2">
				<div class="dot"></div>
				<div class="step-title">Out For Delivery</div>
				<div class="step-text">Delivery partner is on the way.</div>
			</div>
			<div class="step" id="s3">
				<div class="dot"></div>
				<div class="step-title">Arriving Soon</div>
				<div class="step-text">Reaching your doorstep shortly.</div>
			</div>
		</div>

		<div class="scene">
			<div class="scene-header">
				<h2>Cash on Delivery Confirmed</h2>
				<p>Enjoy your meal while we bring it to you.</p>
			</div>

			<div class="stage" id="stage1">
				<div class="box"></div>
			</div>
			<div class="stage" id="stage2">
				<div class="bike">
					<div class="bike-wheel left"></div>
					<div class="bike-wheel right"></div>
					<div class="bike-body"></div>
					<div class="bike-box"></div>
				</div>
			</div>
			<div class="stage" id="stage3">
				<div class="home">
					<div class="roof"></div>
					<div class="house"></div>
					<div class="door"></div>
				</div>
			</div>

			<div class="progress">
				<div class="progress-fill"></div>
			</div>
		</div>
	</div>

	<script>
// show stages + steps sequentially
setTimeout(()=>{ 
  document.getElementById("stage1").classList.add("visible");
  document.getElementById("s1").classList.add("active");
}, 200);

setTimeout(()=>{ 
  document.getElementById("stage2").classList.add("visible");
  document.getElementById("stage1").classList.remove("visible");
  document.getElementById("s2").classList.add("active");
}, 1500);

setTimeout(()=>{ 
  document.getElementById("stage3").classList.add("visible");
  document.getElementById("stage2").classList.remove("visible");
  document.getElementById("s3").classList.add("active");
}, 2800);

// final redirect
setTimeout(() => {
    window.location.href = "auto-submit.jsp";
}, 3500);

</script>
</body>
</html>
