$(function () {
	//------------------------ VARIABLES ------------------------\\
	var btnNext = $(".btn-right"),
		btnPrev = $(".btn-left"),
		lastBanner = $(".slide3"),
		currentBanner = $(".slide2"),
		firstBanner = $(".slide1"),
		help,
		toHide,
		toShow,
		index = true;
	//------------------------ WOW SCRIPT ------------------------\\
	new WOW().init();
	//------------------------ SLIDE SCRIPT ------------------------\\
	btnNext.click(slideNext);

	btnPrev.click(function() {
		btnPrev.attr('disabled', 'disabled');

		toLeft(firstBanner,"0",btnPrev);
		toLeft(currentBanner,"100%",btnPrev);
		lastBanner.css('left', '-100%');

		help = lastBanner;
		lastBanner = currentBanner;
		currentBanner = firstBanner;
		firstBanner = help;
	});
	setInterval(slideNext,5000);

	function toLeft(ele,leftValue,button){
		ele.animate({
			left: leftValue
		},500, function(){
			button.removeAttr('disabled');
		});
	}
	function slideNext(){
		btnNext.attr('disabled', 'disabled');

		toLeft(lastBanner,"0",btnNext);
		toLeft(currentBanner,"-100%",btnNext);
		firstBanner.css('left', '100%');

		help = firstBanner;
		firstBanner = currentBanner;
		currentBanner = lastBanner;
		lastBanner = help;

	}
//------------------------ Menu SLIDE SCRIPT ------------------------\\

	$(".sign-up > .fa-bars").click(function() {
		$(this).fadeOut(200,function(){
				$(".sign-up nav").animate({
				right: 0
			}, 500);
		});
	});

	$(".sign-up .menu").click(function() {
		$(".sign-up nav").animate({
			right: "-225px"
		}, 500,function () {
			$(".sign-up > .fa-bars").fadeIn(200);
		});
	});

	$(".user-slide").click(function() {
		$(this).siblings('ul').slideToggle(400);
	});
	//------------------------ ALL ADMIN SCRIPT ------------------------\\
	$(".tools ul li").click(function () {

		if(!($(this).attr('class') =='active')){

			toShow = "."+$(this).data('file');
			toHide = "."+$(".tools ul li.active").data('file');	

			if(index){
				$(this).addClass("active");
				index = false;
				$(toShow).fadeIn(400);
			}
			else{
				$(toHide).fadeOut(400,function(){
					$(toShow).fadeIn(400);
				});
				
				$(".tools ul li.active").removeClass("active");
				$(this).addClass("active");					
			}		
		}
	});
	
	//------------------------ Incription validation ------------------------\\
	var inputNom = $(".nom");
	var inputEmail = $(".email");
	var inputPseudo = $(".pseudo");
	var inputPass = $(".password");
	var inputPassConf = $(".passConfirm");
	var inputPhone = $(".phone");
	var emailPattern = new RegExp('[1-9]*[A-Za-z]+[0-9]*.@(gmail|yahoo).(com|fr)$');
	var phonePattern = new RegExp('06[0-9]{8}$');
	var pseudoPattern = new RegExp('[a-z]{1}[0-9A-Za-z]+\\.[0-9A-Za-z]+$');
	var passPattern = new RegExp('[A-Z]{1}[0-9A-Za-z]+$');
	var isChecked = false;
	var a = 0;
	var emailExist = "false";
	
	var valid = [false, false, false, false, false, false];
	
	
	
	$(".sub").click(function(){
		
		a = 0;
		
		$.get("/manpro/emailExist?email="+inputEmail.val(),function(data){
			
			if(data == "true" || !emailPattern.test(inputEmail.val())){
				valid[1] = false;
				inputEmail.siblings(".fa-exclamation-triangle").fadeIn(250);
			}
			else{
				valid[1] = true;
				inputEmail.siblings(".fa-exclamation-triangle").fadeOut(250);
			}
		});
		
		
		if(inputNom.val() == ""){
			valid[0] = false;
			inputNom.siblings(".fa-exclamation-triangle").fadeIn(250);
		}
		else{
			valid[0] = true;
			inputNom.siblings(".fa-exclamation-triangle").fadeOut(250);
		}		
		
		if(!phonePattern.test(inputPhone.val())){
			valid[2] = false;
			inputPhone.siblings(".fa-exclamation-triangle").fadeIn(250);
		}
		else{
			valid[2] = true;
			inputPhone.siblings(".fa-exclamation-triangle").fadeOut(250);
		}			
		
		if(!pseudoPattern.test(inputPseudo.val()) || inputPseudo.val().includes(" ")){
			valid[3] = false;
			inputPseudo.siblings(".fa-exclamation-triangle").fadeIn(250);
		}
		else{
			valid[3] = true;
			inputPseudo.siblings(".fa-exclamation-triangle").fadeOut(250);
		}			

		if(!passPattern.test(inputPass.val()) || inputPass.val().length < 7){
			valid[4] = false;
			inputPass.siblings(".fa-exclamation-triangle").fadeIn(250);
		}
		else{
			valid[4] = true;
			inputPass.siblings(".fa-exclamation-triangle").fadeOut(250);
		}		
			
		if(inputPassConf.val() != inputPass.val()){
			valid[5] = false;
			inputPassConf.siblings(".fa-exclamation-triangle").fadeIn(250);
		}
		else{
			valid[5] = true;
			inputPassConf.siblings(".fa-exclamation-triangle").fadeOut(250);
		}			

		for(i = 0;i < 6;i++){
			if(!valid[i])
				return false;
			else
				a++;
		}
		if(a == 6){
			return true;
		}
	});
	
	//------------------------ Incription validation ------------------------\\
	var pseudoLogIn = $(".pseudoLogIn");
	var res;
	
	
	$(".submitLogIn").click(function (e){
		e.preventDefault();
		$.get("/manpro/pseudoExist?pseudo="+pseudoLogIn.val(),function(response){
			if(response == "true")
				$("#logInForm").submit();
		});
	});	
	
	//------------------------ change Name Script ------------------------\\
	var changeNameInput = $("#changeNameDiv input");
	var changePseudoInput = $("#changePseudoDiv input");
	var changeEmailInput = $("#changeEmailDiv input");
	var changeTelephoneInput = $("#changeTelephoneDiv input");
	
	$("#param-gen > div span:nth-child(3)").click(function() {
		if($(this).siblings(".component").text() == "Nom"){
			changeNameInput.val($(".changeNameSpan").text());
			$("body").css('backgroundColor', 'rgba(0,0,0,.3)');
			$("#changeNameDiv").slideDown(250);
			changeNameInput.focus();
		}
		else if($(this).siblings(".component").text() == "Pseudo"){
			changePseudoInput.val($(".changePseudoSpan").text());
			$("body").css('backgroundColor', 'rgba(0,0,0,.3)');
			$("#changePseudoDiv").slideDown(250);
			changePseudoInput.focus();
		}
		else if($(this).siblings(".component").text() == "Email"){
			changeEmailInput.val($(".changeEmailSpan").text());
			$("body").css('backgroundColor', 'rgba(0,0,0,.3)');
			$("#changeEmailDiv").slideDown(250);
			changeEmailInput.focus();
		}
		else if($(this).siblings(".component").text() == "Telephone"){
			changeTelephoneInput.val($(".changeTelephoneSpan").text());
			$("body").css('backgroundColor', 'rgba(0,0,0,.3)');
			$("#changeTelephoneDiv").slideDown(250);
			changeTelephoneInput.focus();
		}
		else if($(this).siblings(".component").text() == "Mot de passe"){
			$("body").css('backgroundColor', 'rgba(0,0,0,.3)');
			$("#changeMotDePasseDiv").slideDown(250);
			changeMotDePasseInput.focus();
		}
	});
	
	$("#changeNameDiv .fa-times").click(function() {
		$("#changeNameDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
		changeNameInput.val("");
	});
	
	$("#changeNameSub").click(function(e) {
		e.preventDefault();
		if(changeNameInput.val() !="" && changeNameInput.val().length > 5){
			$.get("/manpro/changeName?newName="+changeNameInput.val());
			$(".changeNameSpan").text(changeNameInput.val());
			$(".user-name").text(changeNameInput.val());
			$("#changeNameDiv").fadeOut(250);
			$("body").css('backgroundColor', '#fff');
			changeNameInput.val("");
		}
			
	});
	//------------------------ change Pseudo Script ------------------------\\
	
	$("#changePseudoDiv .fa-times").click(function() {
		$("#changePseudoDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
		changePseudoInput.val("");
	});
	
	$("#changePseudoSub").click(function(e) {
		e.preventDefault();
		if(pseudoPattern.test(changePseudoInput.val())){
			$.get("/manpro/changePseudo?newPseudo="+changePseudoInput.val());
			$(".changePseudoSpan").text(changePseudoInput.val());
			$("#changePseudoDiv").fadeOut(250);
			$("body").css('backgroundColor', '#fff');
			changePseudoInput.val("");
		}
			
	});
	//------------------------ change Email Script ------------------------\\
	
	$("#changeEmailDiv .fa-times").click(function() {
		$("#changeEmailDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
		changeEmailInput.val("");
	});
	
	$("#changeEmailSub").click(function(e) {
		e.preventDefault();
		if(emailPattern.test(changeEmailInput.val())){
			$.get("/manpro/changeEmail?newEmail="+changeEmailInput.val());
			$(".changeEmailSpan").text(changeEmailInput.val());
			$("#changeEmailDiv").fadeOut(250);
			$("body").css('backgroundColor', '#fff');
			changeEmailInput.val("");
		}
		
	});
	//------------------------ change Telephone Script ------------------------\\
	
	$("#changeTelephoneDiv .fa-times").click(function() {
		$("#changeTelephoneDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
		changeTelephoneInput.val("");
	});
	
	$("#changeTelephoneSub").click(function(e) {
		e.preventDefault();
		if(phonePattern.test(changeTelephoneInput.val())){
			$.get("/manpro/changeTelephone?newTelephone="+changeTelephoneInput.val());
			$(".changeTelephoneSpan").text(changeTelephoneInput.val());
			$("#changeTelephoneDiv").fadeOut(250);
			$("body").css('backgroundColor', '#fff');
			changeTelephoneInput.val("");
		}
		
	});
	//------------------------ change Mot de passe Script ------------------------\\
	var userPassword;
	var ancien = $("#changeMotDePasseDiv input:nth-child(1)");
	var nouveau = $("#changeMotDePasseDiv input:nth-child(2)");
	var confirmer = $("#changeMotDePasseDiv input:nth-child(3)");
	$("#changeMotDePasseDiv .fa-times").click(function() {
		$("#changeMotDePasseDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
		ancien.val("");
		nouveau.val("");
		confirmer.val("");
	});
	
	$("#changeMotDePasseSub").click(function(e) {
		$.get("/manpro/getPasswordUser",function(data){
			userPassword = data;
		});
		e.preventDefault();
		if(passPattern.test(ancien.val()) && passPattern.test(nouveau.val()) && passPattern.test(confirmer.val())
			&& ancien.val() == userPassword && nouveau.val() == confirmer.val() && nouveau.val().length > 7){
			$.get("/manpro/changeMotDePasse?newMotDePasse="+nouveau.val());
			$("#changeMotDePasseDiv").fadeOut(250);
			$("body").css('backgroundColor', '#fff');
			ancien.val("");
			nouveau.val("");
			confirmer.val("");
		}	
	});
	//------------------------ change photo de profile Script ------------------------\\
	var target;
	d = new Date();
	
	$("#changePdpDiv .fa-times").click(function() {
		$("#changePdpDiv").slideUp(250);
		$("body").css('backgroundColor', '#fff');
	});
	$("#settings .fa-camera").click(function() {
		$("#changePdpDiv").slideDown(250);
	});
	
	$(".myTestBtn").click(function(e) {
		e.preventDefault();
		$("#changePdpDiv .fileBtn").trigger('click');
	});
	
	
	$(".fileBtn").change(function() {
		
		if(typeof (FileReader) != "undefined"){
			var reader = new FileReader();
			reader.onload = function(e){
				target = e.target.result;
				$("#changePdpDiv img").attr('src', e.target.result);
				
			}
			reader.readAsDataURL($(this)[0].files[0]);
		}		
	});
//	$("#changePdpSub").click(function(e) {
//		e.preventDefault();
//		setTimeout(function() {
//			alert("ok");
//			$("#changePdpForm").submit();
//		},10000);
//	});
	
	//------------------------ Cache problem Script ------------------------\\
	

});