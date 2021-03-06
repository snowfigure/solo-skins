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
            <h2>
            ${articleTitle}
            </h2>
    <#if msg??>
    <div>${msg}</div>
    </#if>
            <form class="form" method="POST" action="${servePath}/console/article-pwd">
                <label for="pwdTyped">访问密码：</label>
                <input type="password" id="pwdTyped" name="pwdTyped" />
                <input type="hidden" name="articleId" value="${articleId}" />
                <button id="confirm" type="submit">${confirmLabel}</button>
            </form>
        </div>

    </div>
</div>
<span class="clear"></span>
        <#include "footer.ftl">
</body>