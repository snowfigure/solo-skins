
## 前言

> Solo 博客系统是一个很赞的博客系统，感谢D大以及其团队的无私开源。

 在使用Solo博客系统的Skin皮肤组件中，amaze的皮肤组件刚开始用起来还是挺不错的，但是长时间时候后发现有一些问题，问题如下：
 
## ftl模板问题
 * 首页各个文章简介之前区分不明朗，在小屏幕电脑上（如Mac Air），翻页较多，边界不清晰。
 * 当前Solo所有的皮肤组件中，search、login、article-pwd、error-page（404、500等），使用的是solo原始的ftl模板页面，在processor中也可以看见是直接render根目录下的ftl模板，导致：
	 * 该几个页面与文章、tag、achive等页面风格不匹配
 
 进过一段时间的魔改之后，当前amaze-2.0的显示信息如下面图所示。
 
	1 文章页面

 ![imagepng](https://img.791211.com/file/2018/10/5f4446bbcd5c404c96b5c9d7a18f0c95_image.png) 

	2 分类页面
	
 ![imagepng](https://img.791211.com/file/2018/10/3cfcf2de8193430ca5c74c25bafe5cfa_image.png) 


	3 搜索页面
 
 ![imagepng](https://img.791211.com/file/2018/10/719ab193aa6848c5a57b7a31f0723e72_image.png) 


 
	 4 登录页面
 ![imagepng](https://img.791211.com/file/2018/10/f06abfa36d674ff5ba7cdfcd87e5d159_image.png) 


	5 404 页面

![imagepng](https://img.791211.com/file/2018/10/d8c8b6d371c84133986ae84db8ee602c_image.png) 


 
 
## 源码问题

  * 管理员登录后，刷新首页，日志中有空指针异常调用栈。
  * 该问题修改信息如下：


### showLogin
> 函数 `showLogin` 进行如下修改

![imagepng](https://www.791211.com:443/upload/2018/11/c9c5fd18b668416a8451163a03073b0d_image.png) 


``` java
    /**
     * Shows login page.
     *
     * @param context the specified context
     * @throws Exception exception
     */
    @RequestProcessing(value = "/login", method = HTTPRequestMethod.GET)
    public void showLogin(final HTTPRequestContext context) throws Exception {
        final HttpServletRequest request = context.getRequest();

        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
        context.setRenderer(renderer);
        renderer.setTemplateName("login.ftl");


        String destinationURL = request.getParameter(Common.GOTO);
        if (StringUtils.isBlank(destinationURL)) {
            destinationURL = Latkes.getServePath() + Common.ADMIN_INDEX_URI;
        } else if (!isInternalLinks(destinationURL)) {
            destinationURL = "/";
        }

        final HttpServletResponse response = context.getResponse();
        if (null != Solos.getCurrentUser(request, response)) { // User has already logged in
            response.sendRedirect(destinationURL);

            return;
        }

        final Map<String, Object> dataModel = renderer.getDataModel();

        try {
            final JSONObject preference = preferenceQueryService.getPreference();
            Skins.fillLangs(preference.optString(Option.ID_C_LOCALE_STRING), (String) request.getAttribute(Keys.TEMAPLTE_DIR_NAME), dataModel);
            dataModel.put("resetMsg", "");
            statisticMgmtService.incBlogViewCount(request, response);
            dataModelService.fillCommon(request, response, dataModel, preference);
        }
        catch (final ServiceException e) {
            LOGGER.log(Level.ERROR, e.getMessage(), e);

            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        //renderPage(context, "login.ftl", destinationURL, request, response);
    }
```


### showErrorPage

> `showErrorPage`进行如下修改

![imagepng](https://www.791211.com:443/upload/2018/11/61fa202708f040b8821d1cc4aea5d396_image.png) 



```java
    /**
     * Handles the error.
     *
     * @param context  the specified context
     * @param request  the specified HTTP servlet request
     * @param response the specified HTTP servlet response
     * @throws Exception exception
     */
    @RequestProcessing(value = "/error/{statusCode}", method = HTTPRequestMethod.GET)
    public void showErrorPage(final HTTPRequestContext context, final HttpServletRequest request, final HttpServletResponse response,
                              final String statusCode)
            throws Exception {
        if (StringUtils.equals("GET", request.getMethod())) {
            final String requestURI = request.getRequestURI();
            String templateName = StringUtils.substringAfterLast(requestURI, "/");
            templateName = StringUtils.substringBefore(templateName, ".") + ".ftl";

            final AbstractFreeMarkerRenderer renderer = new SkinRenderer(request);
            context.setRenderer(renderer);
            renderer.setTemplateName("error/" + templateName);

            final Map<String, Object> dataModel = renderer.getDataModel();
            try {
                final Map<String, String> langs = langPropsService.getAll(Locales.getLocale(request));
                dataModel.putAll(langs);
                final JSONObject preference = preferenceQueryService.getPreference();
                Skins.fillLangs(preference.optString(Option.ID_C_LOCALE_STRING), (String) request.getAttribute(Keys.TEMAPLTE_DIR_NAME), dataModel);
                dataModelService.fillCommon(request, response, dataModel, preference);
                statisticMgmtService.incBlogViewCount(request, response);
                dataModel.put(Common.LOGIN_URL, userQueryService.getLoginURL(Common.ADMIN_INDEX_URI));
            } catch (final Exception e) {
                LOGGER.log(Level.ERROR, e.getMessage(), e);

                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            context.renderJSON().renderMsg(statusCode);
        }
    }
```


### search

> `search`进行如下修改

![imagepng](https://www.791211.com:443/upload/2018/11/622a3dc4b64c465a9e9ae9dc6357922e_image.png) 


```java
    /**
     * Searches articles.
     *
     * @param context the specified context
     */
    @RequestProcessing(value = "/search", method = HTTPRequestMethod.GET)
    public void search(final HTTPRequestContext context) {
        final AbstractFreeMarkerRenderer renderer = new SkinRenderer(context.getRequest()); //new ConsoleRenderer();
        context.setRenderer(renderer);
        renderer.setTemplateName("search.ftl");

        final Map<String, String> langs = langPropsService.getAll(Latkes.getLocale());
        final Map<String, Object> dataModel = renderer.getDataModel();
        dataModel.putAll(langs);

        final HttpServletRequest request = context.getRequest();

        String page = request.getParameter("p");
        if (!Strings.isNumeric(page)) {
            page = "1";
        }
        final int currentPageNum = Integer.valueOf(page);
        String keyword = request.getParameter(Common.KEYWORD);
        if (StringUtils.isBlank(keyword)) {
            keyword = "";
        }
        keyword = Encode.forHtml(keyword);

        dataModel.put(Common.KEYWORD, keyword);
        final JSONObject result = articleQueryService.searchKeyword(keyword, currentPageNum, 15);
        final List<JSONObject> articles = (List<JSONObject>) result.opt(Article.ARTICLES);

        try {
            final JSONObject preference = preferenceQueryService.getPreference();
            Skins.fillLangs(preference.optString(Option.ID_C_LOCALE_STRING), (String) request.getAttribute(Keys.TEMAPLTE_DIR_NAME), dataModel);
            dataModelService.fillIndexArticles(request, dataModel, currentPageNum, preference);
            dataModelService.fillCommon(request, context.getResponse(), dataModel, preference);
            dataModelService.setArticlesExProperties(request, articles, preference);

            dataModel.put(Article.ARTICLES, articles);


            final JSONObject pagination = result.optJSONObject(Pagination.PAGINATION);
            pagination.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, currentPageNum);
            dataModel.put(Pagination.PAGINATION, pagination);

            /*分页信息*/
            dataModel.put(Pagination.PAGINATION_PAGE_COUNT, pagination.get(Pagination.PAGINATION_PAGE_COUNT));

            final int previousPageNum = currentPageNum > 1 ? currentPageNum - 1 : 0;

            final Integer pageCount = (Integer) pagination.get(Pagination.PAGINATION_PAGE_COUNT);
            final int nextPageNum = currentPageNum + 1 > pageCount ? pageCount : currentPageNum + 1;

            /*分页信息*/
            dataModel.put(Pagination.PAGINATION_CURRENT_PAGE_NUM, currentPageNum);
            dataModel.put(Pagination.PAGINATION_PREVIOUS_PAGE_NUM, previousPageNum);
            dataModel.put(Pagination.PAGINATION_NEXT_PAGE_NUM, nextPageNum);
            dataModel.put(Common.PATH, "");

            statisticMgmtService.incBlogViewCount(request, context.getResponse());

        } catch (final Exception e) {
            LOGGER.log(Level.ERROR, "Search articles failed");

            dataModel.put(Article.ARTICLES, Collections.emptyList());
        }
    }
```

