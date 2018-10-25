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
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
            <!-- Open Graph -->
            <meta property="og:locale" content="zh_CN"/>
            <meta property="og:type" content="article"/>
            <meta property="og:title" content="${article.articleTitle}"/>
            <meta property="og:description" content="${article.articleAbstract?html}"/>
            <meta property="og:image" content="${article.authorThumbnailURL}"/>
            <meta property="og:url" content="${servePath}${article.articlePermalink}"/>
            <meta property="og:site_name" content="Solo"/>
            <!-- Twitter Card -->
            <meta name="twitter:card" content="summary"/>
            <meta name="twitter:description" content="${article.articleAbstract?html}"/>
            <meta name="twitter:title" content="${article.articleTitle}"/>
            <meta name="twitter:image" content="${article.authorThumbnailURL}"/>
            <meta name="twitter:url" content="${servePath}${article.articlePermalink}"/>
            <meta name="twitter:site" content="@DL88250"/>
            <meta name="twitter:creator" content="@DL88250"/>
    </head>
    <body>
        <#include "header-nav.ftl">

        <header class="intro-header" style="background-image: url('${bannerImageUrl}')">
            <div class="container">
                <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>${article.articleTitle}</h1>
                        <span class="meta">
                            @${article.authorName} &nbsp;
                            ${article.articleCreateDate?string("yyyy-MM-dd")} &nbsp;
                            <div class="comments-view" style="display: inline-block">
                                <a href="${servePath}${article.articlePermalink}#comments" class="article-comments">${article.articleCommentCount} ${commentLabel}</a> &nbsp;
                                ${article.articleViewCount} ${viewLabel}
                            </div>
                            </span>
                        <div class="tags post-tags">
                            <#list article.articleTags?split(",") as articleTag>
                                <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                    ${articleTag}</a>&nbsp;
                            </#list>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="am-g am-g-fixed blog-fixed">
                <div class="am-u-lg-12 am-u-sm-12">
                    <article class="am-article blog-article-p article-trigger">
                        <div id="post-content" class="am-article-bd article-body">
                            ${article.articleContent}
                            <#if "" != article.articleSign.signHTML?trim>
                                <div>
                                    ${article.articleSign.signHTML}
                                </div>
                            </#if>


                            <#if nextArticlePermalink?? || previousArticlePermalink??>
                                <aside class="fn-clear">
                                    <#if previousArticlePermalink??>

                                    <a class="am-u-lg-6 am-u-sm-12 fn-left" rel="prev" href="${servePath}${previousArticlePermalink}">
                                        <strong>&lt;</strong> ${previousArticleTitle}
                                    </a>
                                    <#else>
                                    <div class="am-u-lg-6 am-u-sm-12 fn-left"></div>
                                    </#if>

                                    <#if nextArticlePermalink??>
                                    <a class="am-u-lg-6 am-u-sm-12 fn-right"  style="text-align: right;" rel="next" href="${servePath}${nextArticlePermalink}">
                                        ${nextArticleTitle} <strong>&gt;</strong>
                                    </a>
                                    <#else>
                                        <div class="am-u-lg-6 am-u-sm-12 fn-right"></div>
                                    </#if>
                                </aside>
                            </#if>

                        </div>
                    </article>
                    <hr>
                </div>
            </div>

            <div class="comment-container">
                <div class="comments-container-inner">
                    <@comments commentList=articleComments article=article></@comments>
                </div>
            </div>
        </div>
        
        <#include "footer.ftl">
        <@comment_script oId=article.oId>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
        <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
        </#if>
        <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>"
            , "<header class='title'><h2>${externalRelevantArticlesLabel}</h2></header>");
        </#if>
        <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticlesLabel}</h4>');
        </#if>
        </@comment_script>    
    </body>
</html>
