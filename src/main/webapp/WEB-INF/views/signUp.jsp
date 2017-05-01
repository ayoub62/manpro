<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

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
<body class="e">
	<section class="sign-up">
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
		<div class="clear">
			 <h1 class="wow bounceInUp">Man <span>Pro</span></h1>
			 <p class="para wow bounceInRight">Se connecter, Communiquer, Et réussir</p>
			 <div class="sign-up-form wow bounceInLeft">
			 	<spring:url value="/signUp" var="signUpLink"/>
			 	<f:form action="${signUpLink }" method="POST" modelAttribute="user" id="myForm">
					<div class="form-div1">
						<div class="warning-div">
					 		<f:input placeholder="Votre nom" path="name" cssClass="nom"/>
					 		<span class="fa fa-exclamation-triangle"></span>
						</div>
						<div class="warning-div">
					 		<f:input type="text" placeholder="Votre email" path="email" cssClass="email" />
					 		<span class="fa fa-exclamation-triangle"></span>
					 	</div>
					 	<div class="warning-div">
					 		<f:input type="text" placeholder="Votre pseudo" path="pseudo" cssClass="pseudo"/>
					 		<span class="fa fa-exclamation-triangle"></span>
					 	</div>				
					</div>
					<div class="form-div2">
						<div class="warning-div">				 	
						 	<f:input type="password" placeholder="Votre mot de passe" path="password" cssClass="password"/>
						 	<span class="fa fa-exclamation-triangle"></span>
					 	</div>
					 	<div class="warning-div">
					 		<input type="password" placeholder="Confirmez votre mot de passe" class="passConfirm"/>
					 		<span class="fa fa-exclamation-triangle"></span>
					 	</div>
					 	<div class="warning-div">
						 	<f:input placeholder="Votre numéro de téléphone" path="phoneNumber" cssClass="phone" />
						 	<span class="fa fa-exclamation-triangle"></span>
					 	</div>			
					</div>
					<input class="sub" type="submit" value="Rejoindre" name="submit">
				 	<a href="log_in.php" class="or"><span>Ou</span> Log in</a>
				 	<p>
				 		En cliquant sur Inscription, vous acceptez nos <a href="#">Conditions</a>.
				 	</p>
			 	</f:form>
			 </div>			
		</div>
	</section>
</body>
