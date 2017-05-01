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
	<section class="information">
		<a href="index.php"><h1>Man <span>Pro</span></h1></a>
		<ul>
			<li><span class="fa fa-envelope-o"></span></li>
			<li><span class="fa fa-bell-o"></span></li>
			<li class="divider">
				<span class="fa fa-user user-slide"></span>
				<ul>
					<li><span class="fa fa-user"></span>  Profile</li>
					<spring:url value="/settings" var="settings"/>
					<li><span class="fa fa-cog"></span>  <a href="${settings }">Parametre</a></li>
					<li>
						<form action="test-log-out.php" method="POST">
							<span class="fa fa-lock"></span><input type="submit" name="log-out" value="Log out">
						</form>
					</li>
				</ul>
			</li>
		</ul>
	</section>
	<div class="all-admin">
		<section class="tools">
			<ul>
				<li>
					<span class="nom">${user.name }</span>
					<span class="email">${user.email }</span>
					<spring:url value="/res/images/userPdp/${user.pdpURL }?m=${user.pdpURL }" var="pdp"/>
					<spring:url value="/${user.pseudo }" var="linkToProfile"/>
					<a href="${linkToProfile }"><img src="${pdp }"></a>
				</li>
				<li data-file="taches"><a href="#"><span class="fa fa-tasks"></span>Tâches </a></li>
				<li data-file="discussion"><a href="#"><span class="fa fa-commenting-o"></span>Discussions</a></li>
				<li data-file="document"><a href="#"><span class="fa fa-book"></span>Documents</a></li>
				<li data-file="wiki"><a href="#"><span class="fa fa-file"></span>Wiki</a></li>
				<li data-file="membres"><a href="#"><span class="fa fa-users"></span>Membres</a></li>
				<li data-file="historique"><a href="#"><span class="fa fa-history"></span>Historiques</a></li>
			</ul>
		</section>
		<section class="taches">
			<div class="taches-tools">
				<span class="fa fa-plus"></span>
				<span class="fa fa-pencil-square-o"></span>
				<span class="fa fa-trash-o"></span>
			</div>
			<img class="img-admin" src="images/notaches.png">
			<h1 class="titre-admin">Aucune tâche pour ce projet</h1>
			<button class="admin-btn">Créer une tâche</button>
		</section>
		<section class="discussion">
			<div class="add-discussion">
				<div class="rechercher">
					<input type="text" placeholder="Rechercher une discussion...">
					<span class="fa fa-search"></span>

				</div>
				<p>Aucune discussion. Commencez par en créer une !</p>
				<img src="images/handArrow.png">
				<button class="admin-btn">Ajouter une discussion</button>
			</div>
			<div class="discussion-vide">
				<img class="img-admin" src="images/notaches.png">
				<h1 class="titre-admin">Commencez par sélectionner une discussion</h1>
			</div>
		</section>
		<section class="document">
			<div class="taches-tools">
				<span class="fa fa-plus"></span>
			</div>
			<img class="img-admin" src="images/notaches.png">
			<h1 class="titre-admin">Aucun document pour ce projet</h1>
			<button class="admin-btn">Commencez par en ajouter un</button>			
		</section>	
		<section class="wiki">
			<h1 class="art">Articles</h1>
			<div class="taches-tools">
				<span class="fa fa-search"></span>
				<span class="fa fa-plus"></span>
			</div>
			<img class="img-admin" src="images/notaches.png">
			<h1 class="titre-admin">Aucun article n'a pu être récupéré</h1>			
		</section>
		<section class="membres">
			<div class="membres-tool">
				<div class="user">
					<span class="fa fa-users"></span>
				</div>
				<ul>
					<li><a href="#">Tri par nom</a></li>
					<li><a href="#">Tri par mail</a></li>
				</ul>
				<button class="admin-btn">Ajouter un membre</button>
				<button class="admin-btn sec">Inviter un membre</button>
			</div>
			<div class="membres-list">
				<h1>Liste des membres</h1>
				<div class="list">
					<img src="images/default.jpg">
					<div class="user-info">
						<h1>${user.name }   <span>Créateur</span></h1>
						<h1>${user.email }</h1>
					</div>
				</div>
			</div>
		</section>
		<section class="historique">
			<div>
				<h1>Historique</h1>
				<button>Supprimer tout l'historique</button>
			</div>
			<img class="img-admin" src="images/notaches.png">
			<h1 class="titre-admin">Il n'y a aucun historique à afficher</h1>
		</section>	
	</div>
</body>

