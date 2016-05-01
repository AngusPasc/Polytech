// ==UserScript==
// @name           VideoUpdate
// @version        2.0
// @updateURL	   https://goo.gl/BwU6wu
// @downloadURL    https://goo.gl/BwU6wu
// @grant none
// @author         NikitaCartes
// @description    Обновление видео в комментах
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==

var script = document.createElement('script');
script.setAttribute("type", "application/javascript");
script.textContent = "satr = function() {var video = document.getElementsByTagName('iframe');for(var t=0;t<video.length;t++){tmp=video[t].src;if(tmp.substring(0, 23) == 'http://www.youtube.com/'){video[t].src= 'https://www.youtube.com/' + tmp.substring(23);}}}";
document.body.appendChild(script);

$(".update-comments").remove();
var updateVid = document.createElement('a');
var arr = location.pathname.split('/');
if (arr[1]=="talk"){
		var url =arr[3].substring(0,6) + ", 'talk'";
	}
else{
		var url =arr[3].substring(0,6) + ", 'topic'";
	}
updateVid.innerHTML='<a href="#" class="update-comments" id="update-comments" onclick="setTimeout(satr, 1000); ls.comments.load(' + url + '); return false;"><i></i></a>'
update.insertBefore(updateVid, update.children[0]);

$("#comment-button-submit").remove();
var butt = document.createElement('a');
butt.innerHTML='<button type="submit" name="submit_comment" id="comment-button-submit" onclick="ls.comments.add(\'form_comment\','+ url + '); setTimeout(satr, 1000); return false;" class="button button-primary">добавить</button>';
form_comment.insertBefore(butt, form_comment.children[1]);
