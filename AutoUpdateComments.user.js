// ==UserScript==
// @name           AutoUpdateComments
// @version        2.2.1
// @updateURL	   https://goo.gl/85Hx1B
// @downloadURL    https://goo.gl/85Hx1B
// @grant none
// @author         NikitaCartes и ультрапуся Farxial
// @description    Автоматическое обновление комментариев
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @require        http://code.jquery.com/jquery.min.js
// @run-at		   document-start
// ==/UserScript==


$(document).ready(function(){
	var loc = location.pathname.match(/^\/(blog|talk)(\/([\w\-]+)|read)?\/(\d+)/);
	if(loc !== null) {
		var targetType = loc[1] === "blog" ? "topic" : loc[1];
		var targetID = loc[4];
		var updateCommentsButton = document.getElementById("update-comments");
		
		var NewButtonNCS = document.createElement('a');
		NewButtonNCS.id="NewButtonNCS";
		NewButtonNCS.onclick=updateCommentsButton.onclick;
		NewButtonNCS.innerHTML='<img src="https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png" width="20">';
		update.insertBefore(NewButtonNCS, update.children[0]);
		
		if(updateCommentsButton != null) {
			updateCommentsButton.onclick = function(e) {
				ls.comments.load(targetID, targetType, false);
				return false;
			}
		}
	}
	var LoadButtonNCS = document.getElementById("update-comments");
	//LoadButtonNCS.style.display = "none";
	setTimeout(function run() {LoadButtonNCS.click();setTimeout(run, 10000);}, 10000);
});
