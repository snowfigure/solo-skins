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
<div class="am-u-lg-4 am-u-sm-12 am-u-lg-offset-0 am-u-sm-offset-0 sidebar-container">
    <section>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    搜索文章
                </span>
            </div>
            <div class="sidebar-search">
                <!--div id="bdcs"></div-->
                <form action="${servePath}/search">
                    <div class="search-input">
                        <input type="text" name="keyword" placeholder="输入关键字搜索">
                        <button type="submit" class="search-submit"></button>
                    </div>
                </form>
            </div>
        </section>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    关于博主
                </span>
            </div>
            <main class="sidebar-user">
                <img src="${adminUser.userAvatar}" aria-label="${adminUser.userName}"/>
                <div class="fn-right">
                    <a href="${servePath}/archives.html">
                        ${statistic.statisticPublishedBlogArticleCount}
                        <span class="ft-gray">${articleLabel}</span></a><br/>
                    <a href="${servePath}/dynamic.html">
                        ${statistic.statisticPublishedBlogCommentCount}
                        <span class="ft-gray">${commentLabel}</span></a><br/>
                    ${statistic.statisticBlogViewCount} <span class="ft-gray">${viewLabel}</span><br/>
                    ${onlineVisitorCnt} <span class="ft-gray">${onlineVisitorLabel}</span>
                </div>
            </main>
        </section>
        <#if 0 != mostUsedTags?size>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    ${allTagsLabel}
                </span>
            </div>
            <div class="tags ">
                <#list mostUsedTags as tag>
                    <a rel="tag"
                        href="${servePath}/tags/${tag.tagTitle?url('UTF-8')}"
                        aria-label="${tag.tagPublishedRefCount} ${countLabel}${articleLabel}">
                            ${tag.tagTitle}</a>
                </#list>
            </div>
        </section>
        </#if>

        <#if 0 != archiveDates?size>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    ${archiveLabel}
                </span>
            </div>
            <main class="sidebar-lists">
                <ul>
                    <#list archiveDates as archiveDate>
                        <li>
                            <#if "en" == localeString?substring(0, 2)>
                                <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                                   title="${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})">
                                    ${archiveDate.monthName} ${archiveDate.archiveDateYear}(${archiveDate.archiveDatePublishedArticleCount})</a>
                            <#else>
                                <a href="${servePath}/archives/${archiveDate.archiveDateYear}/${archiveDate.archiveDateMonth}"
                                    title="${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})">
                                    ${archiveDate.archiveDateYear} ${yearLabel} ${archiveDate.archiveDateMonth} ${monthLabel}(${archiveDate.archiveDatePublishedArticleCount})</a>
                            </#if>
                        </li>
                    </#list>
                </ul>
            </main>
        </section>
        </#if>

        <#if 0 != mostUsedCategories?size>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    分类列表
                </span>
            </div>
            <div class="sidebar-list">
                <ul class="sidebar-list-body sidebar-list-items">
                <#list mostUsedCategories as category>
                    <li class="sidebar-list-item">
                    <a href="${servePath}/category/${category.categoryURI}"
                        aria-label="${category.categoryTagCnt} ${cntLabel}${tagsLabel}"
                        class="tag tooltipped tooltipped-n">
                            ${category.categoryTitle}</a>
                    </li>
                </#list>
                </ul>
            </div>
        </section>
        </#if>

        <#if 0 != mostCommentArticles?size>
        <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    ${mostCommentArticlesLabel}
                </span>
            </div>
            <main class="sidebar-lists">
                <ul>
                    <#list mostCommentArticles as article>
                        <li>
                            <a rel="nofollow" aria-label="${article.articleCommentCount} ${commentLabel}"
                                class="tooltipped tooltipped-e"
                                href="${servePath}${article.articlePermalink}">
                                ${article.articleTitle}
                            </a>
                        </li>
                    </#list>
                </ul>
            </main>
        </section>
        </#if>

        <#if 0 != mostViewCountArticles?size>
         <section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    ${mostViewCountArticlesLabel}
                </span>
            </div>
            <main class="sidebar-lists">
                <ul>
                    <#list mostViewCountArticles as article>
                        <li>
                            <a rel="nofollow" aria-label="${article.articleCommentCount} ${commentLabel}"
                                class="tooltipped tooltipped-e"
                                href="${servePath}${article.articlePermalink}">
                                ${article.articleTitle}
                            </a>
                        </li>
                    </#list>
                </ul>
            </main>
        </section>
        </#if>


        <#if 0 != recentComments?size>
        <!--section>
            <div class="sidebar-header">
                <span class="sidebar-header-title">
                    ${dynamicLabel}
                </span>
            </div>
        <ul class="comments" id="comments">
            <#list recentComments as comment>
                <li id="${comment.oId}">
                    <div>
                        <div class="avatar tooltipped tooltipped-n" aria-label="${comment.commentName}"
                             style="background-image: url(${comment.commentThumbnailURL})"></div>
                        <main>
                            <div class="fn-clear">
                                <#if "http://" == comment.commentURL>
                                    ${comment.commentName}
                                <#else>
                                        <a class="user-name" href="${comment.commentURL}" target="_blank">${comment.commentName}</a>
                                </#if>
                                <time class="ft-gray">${comment.commentDate?string("yyyy-MM-dd HH:mm")}</time>
                                <a class="reply-btn" href="${servePath}${comment.commentSharpURL}">${viewLabel}»</a>
                            </div>
                            <div class="content-reset">
                                ${comment.commentContent}
                            </div>
                        </main>
                    </div>
                </li>
            </#list>
        </ul>
        </section-->
        </#if>


    </section>
</div>