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

<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header page-scroll">
      <button type="button" class="navbar-toggle">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">
        ${blogTitle}
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div id="huxblog_navbar">
      <div class="navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <#list pageNavigations as page>
          <li>
            <a href="${page.pagePermalink}" target="${page.pageOpenTarget}" rel="section">
                ${page.pageTitle}
            </a>
          </li>
          </#list>
          <li>
            <a href="${servePath}/tags.html" rel="section">
                ${allTagsLabel}
            </a>
          </li>
          <li>
            <a href="${servePath}/archives.html">
                ${archiveLabel}
            </a>
          </li>
          <li>
            <a rel="links" href="${servePath}/links.html">
              <i class="icon-link"></i> ${linkLabel}
            </a>
          </li>
            <li>
                <a rel="links" href="${servePath}/dynamic.html">
                    <i class="icon-link"></i> ${dynamicLabel}
                </a>
            </li>
          <#if isLoggedIn>
            <li>
              <a href="${servePath}/admin-index.do#main" title="${adminLabel}">
                ${adminLabel}
              </a>
            </li>
            <li>
              <a href="${logoutURL}">
                ${logoutLabel}
              </a>
            </li>
              <#else>
            <li>
              <a href="${loginURL}">
                ${loginLabel}
              </a>
            </li>
          </#if>
        </ul>
      </div>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>

