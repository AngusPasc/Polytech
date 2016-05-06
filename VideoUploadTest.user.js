// ==UserScript==
// @name           VideoUploadTest
// @version        0.1
// @updateURL	     https://goo.gl/bAh1M2
// @downloadURL    https://goo.gl/bAh1M2
// @grant none
// @author         NikitaCartes
// @description    Изменение загрузки видео
// @include        https://tabun.everypony.ru/talk/*
// @include        http://tabun.everypony.ru/talk/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @include        https://tabun.everypony.ru/topic/*
// @include        http://tabun.everypony.ru/topic/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==


var script2 = document.createElement('script');
script2.setAttribute("type", "application/javascript");
script2.textContent = 'vidupld = function(text) {var txt=\'<span class="spoiler"><span class="spoiler-title">Видео</span><span class="spoiler-body"><iframe width="560" height="315" src="\';var t= text.indexOf("youtube.com"); if (t>=0)	{	txt=txt+\'https://www.youtube.com/embed/\'+text.substring(t+20,t+32)+\'" frameborder="0" allowfullscreen></iframe></span></span>\';	return txt;}else{	t=text.indexOf("youtu.be");	if (t>=0)	{	txt=txt+\'https://www.youtube.com/embed/\'+text.substring(t+9,t+21)+\'" frameborder="0" allowfullscreen></iframe></span></span>\';	return txt;}	else{		txt=\'<video>\'+text+\'</video>\';	return txt;	}}}';
document.body.appendChild(script2);

var script3 = document.createElement('script');
script3.setAttribute("type", "application/javascript");
script3.textContent = 'NormalYouTube = function() {  var textComponent = document.getElementById(\'form_comment_text\');  var selectedText;  if (document.selection != undefined)  {    textComponent.focus();    var sel = document.selection.createRange();    selectedText = sel.text;  }  else if (textComponent.selectionStart != undefined)  {    var startPos = textComponent.selectionStart;   var endPos = textComponent.selectionEnd;   selectedText = textComponent.value.substring(startPos, endPos)  } selectedText=vidupld(selectedText); textComponent.value=textComponent.value.substring(0, startPos)+selectedText+textComponent.value.substring(endPos);}';
document.body.appendChild(script3);



$(document).ready(function(){
	document.getElementById('comment_id_0').click();
	var tmp=document.getElementsByClassName("markItUpHeader");
	var firsttmp = $('.markItUpHeader')[0].getElementsByTagName('ul')[0];
	$(".markItUpButton16").remove();
	
	var butt = document.createElement('li');
	butt.setAttribute("class", "markItUpButton markItUpButton165 edit-video");
	butt.innerHTML='<a href="#" onclick="NormalYouTube(); return false;">Добавить видео</a>';
	firsttmp.insertBefore(butt, firsttmp.children[19]);
});
