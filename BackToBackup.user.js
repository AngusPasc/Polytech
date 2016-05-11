// ==UserScript==
// @name           Back to the Backup 
// @version        1.6.6
// @updateURL	     https://github.com/NikitaCartes/Tabun/raw/master/BackToBackup.user.js
// @downloadURL    https://github.com/NikitaCartes/Tabun/raw/master/BackToBackup.user.js
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
newHTML.innerHTML   = '<a id="myLink" href="'+ url +'" target="_blank">Бэкап</a>';
ttb.parentNode.insertBefore(newHTML, ttb.nextSibling);
