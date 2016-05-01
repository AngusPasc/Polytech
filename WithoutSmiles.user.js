// ==UserScript==
// @name           WithoutSmile
// @version        1.5.1
// @updateURL	   https://goo.gl/J9q8eb
// @downloadURL    https://goo.gl/J9q8eb
// @grant none
// @author         NikitaCartes
// @description    Вырезает смайлы
// @include        https://tabun.everypony.ru/*
// @include        http://tabun.everypony.ru/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==

$(".smp").remove();

var tmp=document.getElementsByTagName("img");
    for(var t=0;t<tmp.length;t++){
		if ((tmp[t].height>=50)&&(tmp[t].height<=80)&&((tmp[t].width/tmp[t].height)>=0.75)&&((tmp[t].width/tmp[t].height)<=1.25)) {
		    tmp[t].remove();
		}
  }
