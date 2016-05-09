// ==UserScript==
// @name           AutoUpdateComments
// @version        0.2
// @updateURL	   
// @downloadURL    
// @grant none
// @author         NikitaCartes
// @description    Автоматическое комментах
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==


window.LoadFunctionNCS = function (LoadButtonNCS) {
	LoadButtonNCS.click();
	setTimeout(LoadFunctionNCS2, 2000);	
}

window.LoadFunctionNCS2 = function () {
	var NewComScrNCS=document.getElementsByClassName('comment-new-scriptNCS');
	for(var t=0; t<NewComScrNCS.length;t++) {		
		NewComScrNCS[t].classList.add("comment-new");
	}
	var NewComNCS=document.getElementsByClassName('comment-new');
	for(var t=0; t<NewComNCS.length;t++) {		
		NewComNCS[t].classList.add("comment-new-scriptNCS");
	}
}


window.NextCommentNCS = function () {
	var tmpNCS=document.getElementsByClassName('comment-current');
	for(var t=0; t<tmpNCS.length;t++) {		
		tmpNCS[t].classList.remove('comment-current');
	}
	var idComNCS=document.getElementsByClassName('comment-new-scriptNCS');
	var hrefNCS = '#comment'+(idComNCS[0].id).substring(11,19);
	idComNCS[0].classList.add("comment-current");
	idComNCS[0].classList.remove('comment-new-scriptNCS', 'comment-new');
	alert(idComNCS.length);
	return location.href = hrefNCS;
	
}
$(document).ready(function(){
	var LoadButtonNCS=document.getElementById('update-comments');
	var FirstComNCS=document.getElementsByClassName('comment-new');
	for(var t=0; t<FirstComNCS.length;t++) {		
		FirstComNCS[t].classList.add("comment-new-scriptNCS");
	}
	var NewButtonNCS = document.createElement('div');
	NewButtonNCS.id="NewButtonNCS";
	NewButtonNCS.innerHTML='<div onclick="NextCommentNCS(); return false;"><img src="https://cdn.everypony.ru/storage/00/44/24/2016/05/08/dbb49ab87d.png"></div>';
	update.insertBefore(NewButtonNCS, update.children[2]);
	setTimeout(function run() {LoadFunctionNCS(LoadButtonNCS);setTimeout(run, 10000);}, 10000);
});
