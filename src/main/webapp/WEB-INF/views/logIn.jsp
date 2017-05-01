
 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<spring:url value="/res/css/style.css" var="cssLink"/>
	<spring:url value="/res/css/animate.css" var="cssAnimateLink"/>
	<spring:url value="/res/js/script.js" var="scriptLink"/>
	<spring:url value="/res/js/jquery-3.1.0.min.js" var="jqueryLink"/>
	<spring:url value="/res/js/wow.min.js" var="wowLink"/>
		
	<meta charset="UTF-8">
	<title>MANPRO</title>
	
	<!-- FONTS AWESOME FILE -->
	<script src="https://use.fontawesome.com/b7784e6310.js"></script>
	<!-- JQUERY FILE -->
	<script src="${jqueryLink }"></script>
	<!-- CSS FILE -->
	<link rel="stylesheet" href="${cssAnimateLink }" type="text/css"/>
	<link rel="stylesheet" href="${cssLink }" type="text/css"/>
	<!-- JAVASCRIPT FILE -->
	<script src="${wowLink }"></script>
	<script src="${scriptLink}"></script>
</head>

<body>
<section class="log-in sign-up">
	<span class="fa fa-bars wow wobble"> <span>menu</span></span>
	<nav>
		<ul class="clearFix">
			<li class="menu"><span><span class="fa fa-bars"></span>  menu</span></li>
			<spring:url value="/" var="indexLink"/>
			<li><a href="${indexLink }">home</a></li>
			<spring:url value="/" var="aboutLink"/>
			<li><a href="${aboutLink }">about us</a></li>
			<spring:url value="/" var="contactLink"/>
			<li><a href="${contactLink }">contact us</a></li>
			<spring:url value="/signUp" var="signUPLink"/>
			<li><a href="${signUPLink }">sign up</a></li>
			<spring:url value="/logIn" var="logInLink"/>
			<li><a href="${logInLink }">log in</a></li>
		</ul>
	</nav>
 	<h1 class="wow bounceInUp">Man <span>Pro</span></h1>
 	<p class="para wow bounceInDown">Rêver n'est pas un crime</p>
 	<div class="log-in-div wow bounceInDown">
 		<form action="/manpro/logIn" method="POST" id="logInForm">
 			<div class="span-inside-input">
 				<input type="text" placeholder="Votre email ou pseudo" name="pseudo" class="pseudoLogIn">
 				<span class="fa fa-user"></span>
 			</div>
 			<div class="span-inside-input">
 				<input type="password" placeholder="Votre mot de passe" name="motdepasse" class="motdepasseLogIn">
 				<span class="fa fa-lock"></span>
 			</div>
 			<button class="submitLogIn">Log in</button>
 			<a href="#">Mot de passe oubliè ?</a>
 			<spring:url value="/signUp" var="signUPLink"/>
			<a href="${signUPLink }">sign up</a>
 		</form>
 	</div>
</section>
</body>