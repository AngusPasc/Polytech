// ==UserScript==
// @name           AutoUpdateComments
// @version        4.4.2
// @updateURL	   https://goo.gl/85Hx1B
// @downloadURL    https://goo.gl/85Hx1B
// @grant none
// @author         NikitaCartes, Tevssar и Farxial
// @description    Автоматическое обновление комментариев
// @include        https://tabun.everypony.ru/talk/read/*
// @include        http://tabun.everypony.ru/talk/read/*
// @include        https://tabun.everypony.ru/blog/*
// @include        http://tabun.everypony.ru/blog/*
// @include        https://tabun.everypony.ru/settings/tuning/
// @require        http://code.jquery.com/jquery.min.js
// ==/UserScript==
(function() {
    // Добавление кнопок в настройках сайта
    if (location.pathname == '/settings/tuning/') {

        // Адрес картинки
        $("#content").append('</br>');
        $("#content").append('<div id="au_up_opt" class="wrapper-content"><h2 class="page-header">Настройки автообновления комментариев</h2></div>');
        var NewButtonNCS1 = document.createElement('button');
        NewButtonNCS1.className = "button button-primary";
        NewButtonNCS1.id = "PictureNCS";
        NewButtonNCS1.innerHTML = 'Изменить картинку';
        $("#au_up_opt").append(NewButtonNCS1);
        document.getElementById("PictureNCS").onclick = function(e) {
            localStorage.setItem('PictureNCS', prompt('Введите адрес картинки:', 'https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png'));
            return false;
        };

        // Интервал обновления
        $("#au_up_opt").append('&nbsp;&nbsp;');
        var NewButtonNCS2 = document.createElement('button');
        NewButtonNCS2.className = "button button-primary";
        NewButtonNCS2.id = "TimeNCS";
        NewButtonNCS2.innerHTML = 'Изменить интервал';
        $("#au_up_opt").append(NewButtonNCS2);
        document.getElementById("TimeNCS").onclick = function(e) {
            localStorage.setItem('TimeNCS', 1000 * prompt('Установить интревал обновления, секунд:', '10'));
            return false;
        };

        // Скрытие стандартной кнопки
        $("#au_up_opt").append('&nbsp;&nbsp;');
        var NewButtonNCS3 = document.createElement('button');
        NewButtonNCS3.className = "button button-primary";
        NewButtonNCS3.id = "UpdateNCS";
        NewButtonNCS3.title = "Стандартная кнопка обновления комментриев";
        $("#au_up_opt").append(NewButtonNCS3);
        if (localStorage.getItem('UpdateNCS') == 'true') {
            document.getElementById("UpdateNCS").innerHTML = 'Показывать кнопку';
        } else {
            document.getElementById("UpdateNCS").innerHTML = 'Скрыть кнопку';
        }
        document.getElementById("UpdateNCS").onclick = function(e) {
            if (localStorage.getItem('UpdateNCS') == 'true') {
                document.getElementById("UpdateNCS").innerHTML = 'Скрыть кнопку';
                localStorage.setItem('UpdateNCS', 'false');
            } else {
                document.getElementById("UpdateNCS").innerHTML = 'Показывать кнопку';
                localStorage.setItem('UpdateNCS', 'true');
            }
            return false;
        };
    } else {

        // Если каких-либо настроек нет
        if (localStorage.getItem('updateNCS') === null) {
            localStorage.setItem('updateNCS', true);
            alert('Скрипт был обновлён. Описание в посту от Nikitoz. Если видите надпись больше одного раза — пишите ему, как и по остальным проблемам');
        }
        if (localStorage.getItem('PictureNCS') === null) {
            localStorage.setItem('PictureNCS', 'https://cdn.everypony.ru/storage/00/44/24/2016/05/11/09c85c66fa.png');
        }
        if (localStorage.getItem('TimeNCS') === null) {
            localStorage.setItem('TimeNCS', '10000');
        }
        if (localStorage.getItem('UpdateNCS') === null) {
            localStorage.setItem('UpdateNCS', 'true');
        }

        // Парсер адреса страницы и добавление кнопки прочитывания всех новых комментриев
        var loc = location.pathname.match(/^\/(blog|talk)(\/([\w\-]+)|read)?\/(\d+)/);
        if (loc !== null) {
            var targetType = loc[1] === "blog" ? "topic" : loc[1];
            var targetID = loc[4];
            var updateCommentsButton = document.getElementById("update-comments");
            var NewButtonNCS = document.createElement('a');
            NewButtonNCS.id = "NewButtonNCS";
            NewButtonNCS.innerHTML = '<img src=\"' + localStorage.getItem('PictureNCS') + '\" width="20">';
            update.insertBefore(NewButtonNCS, update.children[0]);
            if (updateCommentsButton !== null) {
                updateCommentsButton.onclick = function(e) {
                    ls.comments.load(targetID, targetType, false);
                    return false;
                };
            }
        }

        // Отображать ли стандартную кнопку
        var LoadButtonNCS = document.getElementById("update-comments");
        if (localStorage.getItem('UpdateNCS') == 'true') {
            LoadButtonNCS.style.display = "none";
        }

        // Обновление комментариев
        var timerIdNCS = setInterval(function() {
            LoadButtonNCS.click();
        }, localStorage.getItem('TimeNCS'));

        // Обработка даблклика
        var flagNCS = false;
        var flag2NCS = true;
        function LoadCommentFunction() {
            ls.comments.load(targetID, targetType);
            flagNCS = false;
        }
        var tmpNCS = document.getElementById("NewButtonNCS");
        var timeoutIdNCS;
        document.getElementById("NewButtonNCS").onclick = function(e) {
            if (!flagNCS) {
                flagNCS = true;
                timeoutIdNCS = setTimeout(LoadCommentFunction, 500);
            } else {
                if (flag2NCS) {
                    tmpNCS.getElementsByTagName("img")[0].src = "https://cdn.everypony.ru/storage/00/44/24/2016/05/10/1745cecf7d.png";
                    clearTimeout(timeoutIdNCS);
                    clearTimeout(timerIdNCS);
                    flagNCS = false;
                    flag2NCS = false;
                    return false;
                } else {
                    tmpNCS.getElementsByTagName("img")[0].src = localStorage.getItem('PictureNCS');
                    clearTimeout(timeoutIdNCS);
                    timerIdNCS = setInterval(function() {
                        LoadButtonNCS.click();
                    }, localStorage.getItem('TimeNCS'));
                    flagNCS = false;
                    flag2NCS = true;
                    return false;
                }
            }
        };
    }
})();
