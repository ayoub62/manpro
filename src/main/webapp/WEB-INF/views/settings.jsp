<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
	<spring:url value="/res/css/style.css" var="cssLink"/>
	<spring:url value="/res/css/animate.css" var="cssAnimateLink"/>
	<spring:url value="/res/js/script.js" var="scriptLink"/>
	<spring:url value="/res/js/jquery-3.1.0.min.js" var="jqueryLink"/>
	<spring:url value="/res/js/wow.min.js" var="wowLink"/>
		
	<meta charset="UTF-8">
	<title>${user.name }</title>
	
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
	<section id="settings">
		<div>
			<p><span>Man</span>Pro</p>
			<spring:url value="/res/images/userPdp/${user.pdpURL }?m=${user.pdpURL }" var="pdp"/>
			
			<div class="camera-change">
				<img src="${pdp }">
				<span class="fa fa-camera"></span>
			</div>
			<span class="user-name">${user.name }</span>
		</div>
	</section>
	<section id="param-gen">
		<p class="debut-phrase">Paramètres généraux du compte</p>
		<div>
			<span class="component">Nom</span>
			<span class="changeNameSpan">${user.name }</span>
			<span class="fa fa-pencil-square-o"></span>
		</div>
		<div>
			<span class="component">Pseudo</span>
			<span class="changePseudoSpan">${user.pseudo }</span>
			<span class="fa fa-pencil-square-o"></span>
		</div>
		<div>
			<span class="component">Email</span>
			<span class="changeEmailSpan">${user.email }</span>
			<span class="fa fa-pencil-square-o"></span>
		</div>
		<div>
			<span class="component">Mot de passe</span>
			<span>************</span>
			<span class="fa fa-pencil-square-o"></span>
		</div>
		<div>
			<span class="component">Telephone</span>
			<span class="changeTelephoneSpan">${user.phoneNumber }</span>
			<span class="fa fa-pencil-square-o"></span>
		</div>
	</section>
	
	
	<div id="changeNameDiv">
		<p>
			<span>Changer</span> le nom
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/changeName" var="changeName"/>
		<form action="${changeName }" method="post" id="changeNameForm">
			<input name="nom" type="text" placeholder="Entrez le nouveau nom"/>
			<button id="changeNameSub">Changer le nom</button>
		</form>
	</div>
	<div id="changePseudoDiv">
		<p>
			<span>Changer</span> le pseudo
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/changePseudo" var="changePseudo"/>
		<form action="${changePseudo }" method="post" id="changePseudoForm">
			<input name="pseudo" type="text" placeholder="Entrez le nouveau pseudo"/>
			<button id="changePseudoSub">Changer le pseudo</button>
		</form>
	</div>
	<div id="changeEmailDiv">
		<p>
			<span>Changer</span> l'email
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/changeEmail" var="changeEmail"/>
		<form action="${changeEmail }" method="post" id="changeEmailForm">
			<input name="email" type="text" placeholder="Entrez le nouveau email"/>
			<button id="changeEmailSub">Changer l'email</button>
		</form>
	</div>
	<div id="changeTelephoneDiv">
		<p>
			<span>Changer</span> le numéro du théléphone
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/changeTelephone" var="changeTelephone"/>
		<form action="${changeTelephone }" method="post" id="changeTelephoneForm">
			<input name="telephone" type="text" placeholder="Entrez le nouveau numéro du théléphone"/>
			<button id="changeTelephoneSub">Changer le numéro du théléphone</button>
		</form>
	</div>
	<div id="changeMotDePasseDiv">
		<p>
			<span>Changer</span> le mot de passe
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/changeMotDePasse" var="changeMotDePasse"/>
		<form action="${changeMotDePasse }" method="post" id="changeMotDePasseForm">
			<input name="ancien" type="text" placeholder="Entrez l'ancien mot de passe"/>
			<input name="nouveau" type="text" placeholder="Entrez le nouveau mot de passe"/>
			<input name="confirmer" type="text" placeholder="Confirmez le nouveau mot de passe"/>
			<button id="changeMotDePasseSub">Changer le mot de passe</button>
		</form>
	</div>
	<div id="changePdpDiv">
		<p>
			<span>Changer</span> la photo de profile
			<span class="fa fa-times"></span>
		</p>
		<spring:url value="/upload" var="changePdp"/>
		<form action="${changePdp }" method="post" id="changePdpForm" enctype="multipart/form-data">
			<spring:url value="/res/images/userPdp/${user.userId }.jpg" var="uploadImg"/>
			<img src="${uploadImg }">
			<input name="fichier" type="file" class="fileBtn" />
			<button class="myTestBtn">Choisissez votre photo  <span class="fa fa-upload"></span></button>
			<button id="changePdpSub">Changer la photo de profile</button>
		</form>
	</div>
</body>
</html>