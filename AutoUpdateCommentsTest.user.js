// ==UserScript==
// @name           AutoUpdateCommentsTest
// @version        4.0
// @updateURL	   
// @downloadURL    
// @grant none
// @author         NikitaCartes и ультрапуся Farxial
// @description    Автоматическое обновление комментариев
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @include        https://tabun.everypony.ru/settings/tuning/
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==

(function() {
    if(location.pathname=='/settings/tuning/'){
        var NewButtonNCS = document.createElement('a');
        NewButtonNCS.id="PictureNCS";
		NewButtonNCS.innerHTML='Изменить картинку <br>';
        content.appendChild(NewButtonNCS);
        document.getElementById("PictureNCS").onclick = function(e) {
            localStorage.setItem('PictureNCS', '"' + prompt('Введите адрес картинки в кавычках:', 'https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png') + '"');
            return false;
        }
        var NewButtonNCS2 = document.createElement('a');
        NewButtonNCS2.id="TimeNCS";
		NewButtonNCS2.innerHTML='Изменить интервал';
        content.appendChild(NewButtonNCS2);
        document.getElementById("TimeNCS").onclick = function(e) {
            localStorage.setItem('TimeNCS', prompt('Установить интревал обновления:', '10000'));
            return false;
        }
    }
    else{
    if(localStorage.getItem('updateNCS') == null) {
        localStorage.setItem('updateNCS', true);
        alert('Скрипт был обновлён. Описание в посту от Nikitoz. Если видите надпись больше одного раза — пишите ему, как и по остальным проблемам');
    }
    if(localStorage.getItem('PictureNCS') == null) {
        localStorage.setItem('PictureNCS', '"https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png"'); 
    }
    if(localStorage.getItem('TimeNCS') == null) {
        localStorage.setItem('TimeNCS', '10000'); 
    }
	var loc = location.pathname.match(/^\/(blog|talk)(\/([\w\-]+)|read)?\/(\d+)/);
	if(loc !== null) {
		var targetType = loc[1] === "blog" ? "topic" : loc[1];
		var targetID = loc[4];
		var updateCommentsButton = document.getElementById("update-comments");
		var NewButtonNCS = document.createElement('a');
		NewButtonNCS.id="NewButtonNCS";
		NewButtonNCS.innerHTML='<img src=' + localStorage.getItem('PictureNCS') + 'width="20">';
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
	var timerIdNCS = setInterval(function() {LoadButtonNCS.click();}, localStorage.getItem('TimeNCS'));
	var flagNCS=false;
	var flag2NCS=true;
	function LoadCommentFunction() {ls.comments.load(targetID, targetType); flagNCS=false;}
	var tmpNCS = document.getElementById("NewButtonNCS");
    var timeoutIdNCS;
	document.getElementById("NewButtonNCS").onclick = function(e) {
		if(!flagNCS){
			flagNCS=true;
			 timeoutIdNCS= setTimeout(LoadCommentFunction, 500);
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
				timerIdNCS = setInterval(function() {LoadButtonNCS.click();}, localStorage.getItem('TimeNCS'));
				flagNCS=false;
				flag2NCS=true;
				return false;
			}
		}
	}
    }
})();
