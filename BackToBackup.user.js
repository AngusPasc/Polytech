// ==UserScript==
// @name           Back to the Backup 
// @version        1.7
// @updateURL	   https://goo.gl/KI6FSz
// @downloadURL    https://goo.gl/KI6FSz
// @grant none
// @author         NikitaCartes & alex_f_k
// @description    Просмотр удалённой страницы в бэкапе andreymal'а
// @include        https://tabun.everypony.ru/*
// @include        http://tabun.everypony.ru/*
// ==/UserScript==



var ttb = document.getElementById('logolink');

var newHTML         = document.createElement ('li');
var url = "https://tabun.andreymal.org";
url = url + location.pathname;
newHTML.innerHTML   = '<a id="myLink" href="'+ url +'" target="_blank" rel="noopener noreferrer">Бэкап</a>';
ttb.parentNode.insertBefore(newHTML, ttb.nextSibling);
