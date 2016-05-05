// ==UserScript==
// @name           ImageUpload
// @version        0.1
// @updateURL	   https://goo.gl/LKriiH
// @downloadURL    https://goo.gl/LKriiH
// @author         NikitaCartes
// @description    Изменение загрузки пикчи
// @description    Загрузка картинок из буфера обмена
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
script2.textContent = 'imgupld = function(text) {var arr = text.split(\' \'); var txt=\'<span class="spoiler"><span class="spoiler-title">Картинки</span><span class="spoiler-body">\'; for(var t=0;t<arr.length;t++){txt=txt+\'<img src="\'+arr[t]+\'"><br>\';} txt=txt+"</span></span>"; return txt; }';
document.body.appendChild(script2);

var script3 = document.createElement('script');
script3.setAttribute("type", "application/javascript");
script3.textContent = 'ShowSelection = function() {  var textComponent = document.getElementById(\'form_comment_text\');  var selectedText;  if (document.selection != undefined)  {    textComponent.focus();    var sel = document.selection.createRange();    selectedText = sel.text;  }  else if (textComponent.selectionStart != undefined)  {    var startPos = textComponent.selectionStart;   var endPos = textComponent.selectionEnd;   selectedText = textComponent.value.substring(startPos, endPos)  } selectedText=imgupld(selectedText); textComponent.value=textComponent.value.substring(0, startPos)+selectedText+textComponent.value.substring(endPos);}';
document.body.appendChild(script3);



$(document).ready(function(){
	document.getElementById('comment_id_0').click();
	var tmp=document.getElementsByClassName("markItUpHeader");
	var firsttmp = $('.markItUpHeader')[0].getElementsByTagName('ul')[0];
	
	var butt = document.createElement('li');
	butt.setAttribute("class", "markItUpButton markItUpButton155 edit-image");
	butt.innerHTML='<a href="#" onclick="ShowSelection(); return false;">Добавить изображение</a>';
	firsttmp.insertBefore(butt, firsttmp.children[20]);

	

});
