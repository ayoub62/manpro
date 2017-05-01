<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<spring:url value="/res/css/style.css" var="cssLink"/>
	<spring:url value="/res/css/animate.css" var="cssAnimateLink"/>
	<spring:url value="/res/js/script.js" var="scriptLink"/>
	<spring:url value="/res/js/jquery-3.1.0.min.js" var="jqueryLink"/>
	<spring:url value="/res/js/wow.min.js" var="wowLink"/>
	
	<spring:url value="/res/images/team/abdsamad.jpg" var="abdsamad"/>
	<spring:url value="/res/images/team/achraf.jpg" var="achraf"/>
	<spring:url value="/res/images/team/ayoub.jpg" var="ayoub"/>
	<spring:url value="/res/images/team/soufiane.jpg" var="soufiane"/>
	
	
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
	<header class="clearFix">
		<ul class="clearFix">
			<li><a href="#"><span class="fa fa-facebook"></span></a></li>
			<li><a href="#"><span class="fa fa-twitter"></span></a></li>
			<li><a href="#"><span class="fa fa-google-plus"></span></a></li>
			<li><a href="#"><span class="fa fa-instagram"></span></a></li>
		</ul>
		<p>
			Bienvenue sur ManPro,Contrôlez votre projet
		</p>
	</header>
	<section class="banner-slide">
		<a href="#" class="brand">Man <span>Pro</span></a>
		<nav>
			<ul class="clearFix">
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
		<div class="slide slide1">
			<h1>Se connecter, Communiquer, Et réussir</h1>
			<p>
				Un chef de projet est quelqu'un qui se jette dans une falaise et construit un avion dans le chemain de la descente. nous sommes votre parachute
			</p>
			<a href="sign_up.php">S'inscrire</a>
		</div>
		<div class="slide slide2">
			<h1>Notre vision</h1>
			<p>
				le succés dans le business dépend de votre aptitude à vous faire des amis. nous sommes dès maintenant vos amis et nous sommes là pour vous accompagner de bout en bout dans votre affaire.
			</p>
			<a href="sign_up.php">S'inscrire</a>
		</div>
		<div class="slide slide3">
			<h1>Rêver n'est pas un crime</h1>
			<p>
				Pour les startup, les jeunes entrepreneur ainsi que les petites entrepises, notre programme vous réserve un départ en ordre, vous évite les erreurs, le déboussolement et vous garantie une facilité de travail qu'on en trouve nul part.
			</p>
			<a href="sign_up.php">S'inscrire</a>
		</div>
		<button class="btn btn-left"><span class="fa fa-angle-left"></span></button>
		<button class="btn btn-right"><span class="fa fa-angle-right"></span></button>
	</section>
	<section class="about-us">
		<h1 class="clear">About Us</h1>
		<section class="gray-line">
			<div class="green-line"></div>
		</section>
		<section class="about-us-section">
			<h1 class="wow fadeInLeft">Nous sommes Man Pro</h1>
			<p class="wow fadeInRight">
				Vous êtes le chef de votre projet et vous cherchez un moyen efficace qui va vous permettre d'être en contact avec votre équipe et de s'échanger vos progrès en temps rèel et tout ça sans sortir de chez vous , alors vous êtes dans le bon endroit ...
			</p>
			<button class="wow fadeInLeft">Lire la suite</button>
			<div class="lire-vid wow flash">
				<span class="fa fa-play"></span>
				<h5>Lire la vidéo</h5>				
			</div>

		</section>
		
	</section>
	<section class="our-team clearFix">
		<h1 class="clear">Notre Équipe</h1>
		<section class="gray-line">
			<div class="green-line"></div>
		</section>
		<div class="wow fadeInDown">
			<div class="img-scale">
				<img src="${ayoub }">
			</div>
			<h1><span>A</span>youb <span>A</span>it <span>L</span>ahcen</h1>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium sequi quibusdam sunt, delectus officiis ipsum impedit
			</p>
			<div class="fa-a">
				<a href="#"><span class="fa fa-facebook"></span></a>
				<a href="#"><span class="fa fa-google-plus"></span></a>	
			</div>
		</div>
		<div class="wow fadeInRight">
			<div class="img-scale">
				<img src="${achraf }">
			</div>
			<h1><span>A</span>chraf <span>R</span>hariss</h1>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium sequi quibusdam sunt, delectus officiis ipsum impedit
			</p>
			<div class="fa-a">
				<a href="#"><span class="fa fa-facebook"></span></a>
				<a href="#"><span class="fa fa-google-plus"></span></a>	
			</div>	
		</div>
		<div class="wow fadeInUp">
			<div class="img-scale">
				<img src="${soufiane }">
			</div>
			<h1><span>S</span>oufiane <span>K</span>hamlach</h1>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium sequi quibusdam sunt, delectus officiis ipsum impedit
			</p>
			<div class="fa-a">
				<a href="#"><span class="fa fa-facebook"></span></a>
				<a href="#"><span class="fa fa-google-plus"></span></a>	
			</div>	
		</div>
		<div class="wow fadeInLeft">
			<div class="img-scale">
				<img src="${abdsamad }">
			</div>
			<h1><span>A</span>bdessamad <span>H</span>midache</h1>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium sequi quibusdam sunt, delectus officiis ipsum impedit
			</p>
			<div class="fa-a">
				<a href="#"><span class="fa fa-facebook"></span></a>
				<a href="#"><span class="fa fa-google-plus"></span></a>	
			</div>
					
		</div>
	</section>
	<section class="contact-us">
		<h1 class="clear">Contactez nous</h1>
		<section class="gray-line">
			<div class="green-line"></div>
		</section>
		<h1 class="doute">Encore des doutes ? <span>Contactez nous</span></h1>
		<p>Toute question sera rèpondue</p>
		<div class="center-contact clearFix">
			<div class="input-contact wow bounceInLeft">
				<input type="text" placeholder="Votre nom">
				<input type="text" placeholder="Votre émail">
				<input type="text" placeholder="Le sujet">
			</div>
			<div class="textarea-contact wow bounceInRight">
				<textarea placeholder="Message"></textarea>
				<button>Envoyer</button>
			</div>			
		</div>
	</section>
<footer>
	<h1>Man <span>Pro</span></h1>
	<div class="footer-line"></div>
	<div>
		<a href="#"><span class="fa fa-facebook"></span></a>
		<a href="#"><span class="fa fa-twitter"></span></a>
		<a href="#"><span class="fa fa-instagram"></span></a>
		<a href="#"><span class="fa fa-google-plus"></span></a>
		<a href="#"><span class="fa fa-linkedin"></span></a>
		<a href="#"><span class="fa fa-youtube"></span></a>
	</div>
</footer>
</body>
</html>