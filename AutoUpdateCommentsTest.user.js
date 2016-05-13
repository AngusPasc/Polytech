// ==UserScript==
// @name           AutoUpdateCommentsTest
// @version        3.0
// @updateURL	   
// @downloadURL    
// @grant none
// @author         NikitaCartes и ультрапуся Farxial
// @description    Автоматическое обновление комментариев
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==

(function() {
	var loc = location.pathname.match(/^\/(blog|talk)(\/([\w\-]+)|read)?\/(\d+)/);
	if(loc !== null) {
		var targetType = loc[1] === "blog" ? "topic" : loc[1];
		var targetID = loc[4];
		var updateCommentsButton = document.getElementById("update-comments");
		
		var NewButtonNCS = document.createElement('a');
		NewButtonNCS.id="NewButtonNCS";
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
	var timerIdNCS = setInterval(function() {LoadButtonNCS.click();}, 2000);
	var flagNCS=false;
	var flag2NCS=true;
	function LoadCommentFunction() {ls.comments.load(targetID, targetType); flagNCS=false;}
	var tmpNCS = document.getElementById("NewButtonNCS");
	document.getElementById("NewButtonNCS").onclick = function(e) {
		if(!flagNCS){
			flagNCS=true;
			var timeoutIdNCS = setTimeout(LoadCommentFunction, 500);
		}
		else{
			if(flag2NCS){
				tmpNCS.getElementsByTagName("img")[0].src="https://cdn.everypony.ru/storage/00/44/24/2016/05/10/1745cecf7d.png";
				clearTimeout(timeoutIdNCS);
				clearTimeout(timerIdNCS);
				flagNCS=false;
				flag2NCS=false;
				return false;
			}
			else{
				tmpNCS.getElementsByTagName("img")[0].src="https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png";
				clearTimeout(timeoutIdNCS);
				timerIdNCS = setInterval(function() {LoadButtonNCS.click();}, 2000);
				flagNCS=false;
				flag2NCS=true;
				return false;
			}
		}
	}
})();
