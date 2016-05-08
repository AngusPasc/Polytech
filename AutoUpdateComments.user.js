// ==UserScript==
// @name           AutoUpdateComments
// @version        0.1
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




var arr = location.pathname.split('/');
if (arr.length==3)	{
	var num = parseInt(arr[2].substring(0,6));
	var url = 'topic';
}
else {
	if (arr[1]=="talk"){
		var num = parseInt(arr[3].substring(0,6));
		var url ='talk';
	}
	else{
		var num = parseInt(arr[3].substring(0,6));
		var url = 'topic';
	}
}

window.SomeFun2 = function () {
	var NewCom=document.getElementsByClassName('comment-new');
	for(var t=0; t<NewCom.length;t++) {		
		NewCom[t].className ="comment  comment-new comment-new-script";
	}
	var arr2=document.getElementsByClassName('comment-new-script');
	for(var t=0; t<arr2.length;t++) {		
		arr2[t].className ="comment  comment-new comment-new-script";
	}
}

window.SomeFun = function (num,url) {
	var arr2=document.getElementsByClassName('comment-new');
	for(var t=0; t<arr2.length;t++) {		
		arr2[t].className ="comment   comment-new-script";
	}
	ls.comments.load(num,url);
	setTimeout(SomeFun2, 2000);	
}
window.NextComment = function () {
	var tmp=document.getElementsByClassName('comment-current');
	for(var t=0; t<tmp.length;t++) {		
		tmp[t].className ="comment";
	}
	var idhref=document.getElementsByClassName('comment-new-script');
	var temp = '#comment'+(idhref[0].id).substring(11,19);
	idhref[0].className ="comment comment-current";
	return location.href = temp;
	
}

var arr=document.getElementsByClassName('comment-new');
for(var t=0; t<arr.length;t++) {		
		arr[t].className ="comment  comment-new comment-new-script";
}
var but = document.createElement('a');
but.innerHTML='<div id="SomeId" onclick="NextComment(); return false;"><img src="https://cdn.everypony.ru/storage/00/44/24/2016/05/08/dbb49ab87d.png"></div>';
update.insertBefore(but, update.children[2]);
setTimeout(function run() {SomeFun(num, url);setTimeout(run, 10000);}, 10000);
