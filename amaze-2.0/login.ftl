<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-2018, b3log.org & hacpai.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<#include "macro-head.ftl">
<!DOCTYPE html>
<html>
    <head>
       <@head title="${blogTitle}">
           <meta name="keywords" content="${metaKeywords},${archiveLabel}"/>
            <meta name="description" content="${metaDescription},${archiveLabel}"/>
        </@head>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/default-init${miniPostfix}.css" charset="utf-8"/>
        <script type="text/javascript" src="${cdnjQueryJS}" charset="utf-8"></script>
    </head>
    <body>
        <#include "header.ftl">


        <div class="wrap">
            <div class="content">
                <div class="logo">
                    <a href="${servePath}" target="_blank">
                        <img width="128" border="0" alt="${blogTitle}" title="${blogTitle}" src="${staticServePath}/images/logo.png"/>
                    </a>
                </div>
                <div class="main">
                        <h2>Welcome to Login ${blogTitle}!</h2>
                        <div id="github" class="none"">
                            <div class="github__icon"
                                 onclick="window.location.href = '${servePath}/oauth/github/redirect';$('#github').addClass('github--loading')">
                                <img src="${staticServePath}/images/github-init.gif"/>
                            </div>
                            <button class="hover" onclick="window.location.href = '${servePath}/oauth/github/redirect';$('#github').addClass('github--loading')">${useGitHubAccountLoginLabel}</button>
                            <br>
                            <span onclick="$('#github').hide();$('.form').show()">${useLocalAccountLabel}</span>
                        </div>
                    <div class="form">
                        <label for="userEmail">
                        ${userLabel}
                        </label>
                        <input id="userEmail" tabindex="1" />
                        <label for="userPassword">
                        ${userPasswordLabel} <!--a href="${servePath}/forgot">(${forgotLabel})</a-->
                        </label>
                        <input type="password" id="userPassword" tabindex="2" />
                        <div style="text-align: center">
                            <button class="hover" onclick='login();'>  ${loginLabel}  </button>

                            <button onclick="$('#github').show();$('.form').hide()">${useGitHubAccountLoginLabel} </button>
                        </div>
                        <!--span class="clear"></span-->
                    </div>
                    <span id="tip">${resetMsg}</span>
                </div>
            </div>
        </div>
        <span class="clear"></span>
        <#include "footer.ftl">
    </body>
</html>


    <script type="text/javascript">
        (function() {
            $("#userEmail").focus();

            $("#userPassword, #userEmail").keypress(function(event) {
                if (13 === event.keyCode) { // Enter pressed
                    login();
                }
            });

            // if no JSON, add it.
            try {
                JSON
            } catch (e) {
                document.write("<script src=\"${staticServePath}/js/lib/json2.js\"><\/script>");
            }
        })();

        var login = function() {
            if ($("#userPassword").val() === "") {
                $("#tip").text("${passwordEmptyLabel}");
                $("#userPassword").focus();
                return;
            }

            var requestJSONObject = {
                "userEmail": $("#userEmail").val(),
                "userPassword": $("#userPassword").val()
            };

            $("#tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...")

            $.ajax({
                url: "${servePath}/login",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(requestJSONObject),
                error: function() {
                    // alert("Login error!");
                },
                success: function(data, textStatus) {
                    if (!data.isLoggedIn) {
                        $("#tip").text(data.msg);
                        return;
                    }

                    window.location.href = data.to;
                }
            });
        };
    </script>
