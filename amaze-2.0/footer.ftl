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
<footer class="footer blog-footer">
    <div class="blog-text-center">
        <div style="float: left; text-align: left; margin-left: 30px">

            <span>
                ${viewCount1Label}${statistic.statisticBlogViewCount}
                &nbsp;
                ${articleCount1Label}${statistic.statisticPublishedBlogArticleCount}
                &nbsp;
                ${commentCount1Label}${statistic.statisticPublishedBlogCommentCount}
                &nbsp;
                ${onlineVisitor1Label}${onlineVisitorCnt}
            </span>
            <br/><br/>
            <div class="am-u-lg-3" style="text-align: center;">
                <img style="width: 90px; display:inline" src="https://img.791211.com//file/2018/10/b3f1a7ae76e54dfba3fab2dface6c237_image.png" alt="imagepng">
                <br/>
                <span  stype="text-align: center;"> Email </span>
            </div>
            <div class="am-u-lg-3" style="text-align: center;">
                <img style="width: 90px; display:inline" src="https://img.791211.com//file/2018/10/f89c6bbfdae84dd49201230dcb253e5e_image.png" alt="imagepng">
                <br/>
                <span  stype="text-align: center;">微信 </span>
            </div>
            <div class="am-u-lg-3" style="text-align: center;">
                <img style="width: 90px; display:inline" src="https://img.791211.com//file/2018/10/7a92ae0577ca41a6a960051f08f80755_image.png" alt="imagepng">
                <br/>
                <span  stype="text-align: center;">公众号 </span>
            </div>
            <div class="am-u-lg-3">
            </div>

        </div>
        <div style="float: right; text-align: center; margin-right: 20px">



            <span>
            ${footerContent}
            </span>

            <br/>
            <span>
                &copy 2013-${year}<a href="${servePath}">${blogTitle}</a>  All rights reserved.
            </span>

            <br/>
            <br/>

            <span>
                Run on
                <a href="https://www.aliyun.com/" lang="托管于阿里云"  target="_blank" >
                    <span class="iconfont icon-aliyun01" title="托管于阿里云"></span>
                        Aliyun
                </a>
                &nbsp;&nbsp;

                Storage in
                <a href="https://portal.qiniu.com/signup" lang="存储于七牛云"  target="_blank">
                    <span class="iconfont icon-qiniu1" title="存储于七牛云"></span>
                    Qiniu
                </a>
                &nbsp;&nbsp;

            </span>
            <br/>
            <span>

                Powered by
                <a href="https://solo.b3log.org" target="_blank">
                    <span class="iconfont icon-github" title=" Theme by Amaze-2.0 on GitHub"></span>
                    Solo ${version}
                </a>
                &nbsp;&nbsp;

                Theme by
                <a href="https://github.com/snowfigure/solo-skins/tree/master/amaze-2.0">

                    <span class="iconfont icon-github" title=" Theme by Amaze-2.0 on GitHub"></span>
                    Amaze-2.0
                </a>
                &nbsp;&nbsp;
            </span>
        </div>
        <div style="clear: both"></div>


        <br/>



    </div>
</footer>
<div class="icon-up" onclick="Util.goTop()"></div>

<script type="text/javascript" src="${cdnjQueryJS}" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/skins/${skinDirName}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script type="text/javascript">
    var latkeConfig = {
        "servePath": "${servePath}",
        "staticServePath": "${staticServePath}",
        "isLoggedIn": "${isLoggedIn?string}",
        "userName": "${userName}"
    };

    var Label = {
        "skinDirName": "${skinDirName}",
        "em00Label": "${em00Label}",
        "em01Label": "${em01Label}",
        "em02Label": "${em02Label}",
        "em03Label": "${em03Label}",
        "em04Label": "${em04Label}",
        "em05Label": "${em05Label}",
        "em06Label": "${em06Label}",
        "em07Label": "${em07Label}",
        "em08Label": "${em08Label}",
        "em09Label": "${em09Label}",
        "em10Label": "${em10Label}",
        "em11Label": "${em11Label}",
        "em12Label": "${em12Label}",
        "em13Label": "${em13Label}",
        "em14Label": "${em14Label}"
    };

    Util.parseMarkdown('content-reset');
</script>


<#if "true" = baiduPushEnable>
<script type="text/javascript">
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
</#if>

<#if "true" = baiduHMEnable>
<script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?${baiduHMCode}";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</#if>

${plugins}
