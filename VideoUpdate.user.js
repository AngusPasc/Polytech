// ==UserScript==
// @name           VideoUpdate
// @version        1.2
// @updateURL	   https://goo.gl/BwU6wu
// @downloadURL    https://goo.gl/BwU6wu
// @grant none
// @author         NikitaCartes
// @description    Обновление видео в комментах
// @include        https://tabun.everypony.ru/talk/add/*
// @include        http://tabun.everypony.ru/talk/add/*
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @include        https://tabun.everypony.ru/topic/*
// @include        http://tabun.everypony.ru/topic/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==

var script = document.createElement('script');
script.setAttribute("type", "application/javascript");
script.textContent = "satr = function() {var video = document.getElementsByTagName('iframe');for(var t=0;t<video.length;t++){tmp=video[t].src;if(tmp.substring(0, 23) == 'http://www.youtube.com/'){video[t].src= 'https://www.youtube.com/' + tmp.substring(23);}}}";
document.body.appendChild(script);

var obj         = document.createElement ('a');
obj.innerHTML   = '<a style="position: relative; top: 10px;" onClick="satr()"><img src="https://cdn.everypony.ru/storage/00/44/24/2016/05/01/d271fdca88.png"></a>';
widemode.insertBefore(obj, widemode.children[2]);
