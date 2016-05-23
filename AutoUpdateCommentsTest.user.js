// ==UserScript==
// @name           AutoUpdateCommentsTest
// @version        4.2
// @updateURL	   
// @downloadURL    
// @grant none
// @author         NikitaCartes, Tevssar и ультрапуся Farxial
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
        $( "#content" ).append(  '</br>'  );
        $( "#content" ).append('<div id="au_up_opt" class="wrapper-content"><h2 class="page-header">Настройки автообновления комментариев</h2></div>');   
        var NewButtonNCS = document.createElement('button');
        NewButtonNCS.className ="button button-primary";
        NewButtonNCS.id="PictureNCS";
		NewButtonNCS.innerHTML='Изменить картинку';
        $( "#au_up_opt" ).append(NewButtonNCS);
        document.getElementById("PictureNCS").onclick = function(e) {
            localStorage.setItem('PictureNCS',prompt('Введите адрес картинки в кавычках:', 'https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png'));
            return false;
        };
        $( "#au_up_opt" ).append(  '&nbsp;&nbsp;'  );
        var NewButtonNCS2 = document.createElement('button');
        NewButtonNCS2.className ="button button-primary";
        NewButtonNCS2.id="TimeNCS";
		NewButtonNCS2.innerHTML='Изменить интервал';
        $( "#au_up_opt" ).append(NewButtonNCS2);
        document.getElementById("TimeNCS").onclick = function(e) {
           localStorage.setItem('TimeNCS',1000*prompt('Установить интревал обновления, секунд:', '10'));
            return false;
        };

    }
    else{
    if(localStorage.getItem('updateNCS') == null) {
        localStorage.setItem('updateNCS', true);
        alert('Скрипт был обновлён. Описание в посту от Nikitoz. Если видите надпись больше одного раза — пишите ему, как и по остальным проблемам');
    }
    if(localStorage.getItem('PictureNCS') == null) {
        localStorage.setItem('PictureNCS', 'https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png'); 
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
		NewButtonNCS.innerHTML='<img src=\"' + localStorage.getItem('PictureNCS') +'\" width="20">';
		update.insertBefore(NewButtonNCS, update.children[0]);
		if(updateCommentsButton != null) {
			updateCommentsButton.onclick = function(e) {
				ls.comments.load(targetID, targetType, false);
				return false;
			};
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
				tmpNCS.getElementsByTagName("img")[0].src=localStorage.getItem('PictureNCS');
				clearTimeout(timeoutIdNCS);
				timerIdNCS = setInterval(function() {LoadButtonNCS.click();}, localStorage.getItem('TimeNCS'));
				flagNCS=false;
				flag2NCS=true;
				return false;
			}
		}
	};
    }
})();
