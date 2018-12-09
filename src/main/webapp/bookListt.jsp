<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/5
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>

<%@page import="java.util.List"%>
<%@ page import="com.oracle.ddbook.model.Book" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css" />
    <link rel="stylesheet" type="text/css" id="qxmr" />
    <script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
    <script type="text/javascript">
        //浏览器加载
        if ($.cookie("bootstraptheme")) {
            //如果浏览器里有值，改主题
            $("#qxmr").attr("href","bower_components/bootswatch/dist/"+ $.cookie("bootstraptheme") + "/bootstrap.css");
        } else {
            //如果浏览器里没有值，就是默认值
            $("#qxmr").attr("href","bower_components/bootswatch/dist/darkly/bootstrap.css");
            $("#themestyle").val("darkly");
        }
    </script>

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img src="bower_components/bootstrap/site/docs/4.1/assets/img/favicons/tmm.png" style="height: 100px">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"> </a>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="javascript:void(0)">
                            <select id="themestyle" class="custom-select">
                                <option>darkly</option>
                                <option>cosmo</option>
                                <option>journal</option>
                                <option>lux</option>
                                <option>minty</option>
                            </select>
                        </a></li>


                    </ul>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="text" />
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active" style="color: #0a6ebd">退出</li>
                        <li class="nav-item dropdown"><a class="nav-link fa fa-window-close fa-2x" href="exit.jsp" id="navbarDropdownMenu" ></a>

                           </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="card-header" style="padding: 0px; border: 0px">
        <form class="form-inline" action="bookList" method="post" id="formsearch">

            <label class="sr-only" for="inputbid">大类</label>
            <div class="input-group mb-2 mr-sm-2">

                <select name="bid" class="form-control" id="inputbid" >
                    <option value="-1">--请选择--</option>
                </select>
            </div>

            <div class="form-check mb-2 mr-sm-2">
                <label class="sr-only" for="inputsid">小类</label>
                <select name="sid" class="form-control" id="inputsid" >
                    <option value="-1">--请选择--</option>
                </select>

            </div>
            <label class="sr-only" for="inputname">书名</label>
            <input type="text" class="form-control mb-2 mr-sm-2" id="inputname"  name="name" placeholder="书名" value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>" >
            <button type="submit" class="btn btn-primary mb-2">搜索</button>
        </form>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12" style="padding-left: 0px; padding-right: 0px">
                <table class="table table-hover table-bordered table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>书名</th>
                        <th>价格</th>
                        <th>出版社</th>
                        <th style="width:300px!important;">简介</th>
                        <th>出版日期</th>
                        <th>小类</th>
                        <th>操作</th>
                        <th>封面</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 用list把书拿过来 -->
                    <%
                        List<Book> ls = (List<Book>) request.getAttribute("ls");

                        for (Book booktype : ls) {
                    %>
                    <tr>
                        <td><%=booktype.getId()%></td>
                        <td><%=booktype.getName()%></td>
                        <td><%=booktype.getPrice()%></td>
                        <td><%=booktype.getPub()%></td>
                        <td><%=booktype.getPescr()%></td>
                        <td><%=booktype.getDay()%></td>
                        <td><%=booktype.getSid()%></td>
                        <td>
                            <a href="#modal-container-984785" data-toggle="modal" class="fa fa-trash fa-1x" onclick="window.delid='<%=booktype.getId()%>'"  title="删除"></a>
                            &nbsp; &nbsp; &nbsp; &nbsp;<a class="fa fa-edit fa-1x" title="修改" href="tobookEdit?id=<%=booktype.getId()%>"></a>
                        </td>
                        <td><img src="upload/<%=booktype.getPhoto()%>"></td>
                    </tr>
                    <%
                        }
                    %>

                    </tbody>
                </table>
            </div>
            <div class="card-footer" style="padding: 0px">
                <nav>
                    <ul class="pagination">
                        <%
                            int totalPage = (Integer) request.getAttribute("totalPage");
                            int currontPage = (Integer) request.getAttribute("currontPage");
                            if (currontPage == 1) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">前一页</a></li>
                        <%
                        } else {
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=currontPage - 1%>">前一页</a></li>
                        <%
                            }
                        %>

                        <%
                            //判断
                            if (totalPage <= 5) {//总页数小于等于5
                                for (int i = 1; i <= totalPage; i++) {
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=i%>"><%=i%></a></li>
                        <%
                            }
                        } else if (currontPage <= 3) {//当前写小于等于3
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=1">1</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=2">2</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=3">3</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=4">4</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage%>">...<%=totalPage%></a></li>
                        <%
                        } else if (currontPage <= totalPage - 3) {//当前页小于等于总页数-3
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=1">1...</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=currontPage - 1%>"><%=currontPage - 1%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=currontPage%>"><%=currontPage%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=currontPage + 1%>"><%=currontPage + 1%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage%>">...<%=totalPage%></a></li>
                        <%
                        } else {
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=1">1...</a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage - 3%>"><%=totalPage - 3%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage - 2%>"><%=totalPage - 2%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage - 1%>"><%=totalPage - 1%></a></li>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=totalPage%>"><%=totalPage%></a></li>
                        <%
                            }
                            //如果是最后一页点击无效
                            if (currontPage == totalPage) {
                        %>
                        <li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
                        <%
                        } else {
                        %>
                        <li class="page-item"><a class="page-link" href="bookList?currontPage=<%=currontPage + 1%>">下一页</a></li>
                        <%
                            }
                        %>

                    </ul>
                </nav>
            </div>
            <p class="text-center">
                小熊猫&copy<a class="btn" href="mailto:分享@qq.com">分享>></a>
            </p>

        </div>
    </div>
</div>

<div class="modal fade" id="modal-container-984785" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">
                    删除书本
                </h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                你确定删除吗
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-primary"  onclick="exeDel(event)">
                    确定
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    取消
                </button>
            </div>
        </div>

    </div>

</div>

<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function() {
        $("#themestyle").change(
            function(evt) {//改变选择
                //在指定位置改变主题   target事件的目标节点
                $("#qxmr").attr("href","bower_components/bootswatch/dist/"+ $(evt.target).val()+ "/bootstrap.css");
                //更改主题保留时间  jQuery下cookie（“name”,"vule",时间周期）
                $.cookie('bootstraptheme', $(evt.target).val(), {expires : 30});
            });
        //主题名和主题保持一致
        $("#themestyle").val($.cookie("bootstraptheme"));
        $('a[href="bookList?currontPage=<%=currontPage%>"]').parent("li").addClass("active");


    });
    function findsel(types){
        //获得所有  循环
        for (var i = 0; i < types.length; i++) {
            var ls=new Option(types[i].name,types[i].id);//添加选项
            document.getElementById("inputbid").appendChild(ls);//找到位置添加
        }
        $("#inputbid").val('<%=request.getAttribute("bid")%>');
        $("#inputbid").trigger("change");
    }

    //$("#inputbid").trigger("change");
    /*var script=document.createElement("script");
    script.src="findAllBigtype";
    document.body.appendChild(script);*/

    function findsmallsel(types){
        //获得所有  循环
        document.getElementById("inputsid").innerHTML='<option value="-1">--请选择--</option>';
        for (var i = 0; i < types.length; i++) {
            var ls=new Option(types[i].name,types[i].id);//添加选项
            document.getElementById("inputsid").appendChild(ls);//找到位置添加
        }
        $("#inputsid").val('<%=request.getAttribute("sid")%>');
    }

    //console.dir($)
    $.ajax({
        url : "findAllBigtype",
        dataType : "jsonp",
        jsonpCallback : "findsel"
    })
    $("#inputbid").change(function() {
        $.ajax({
            url : "findAllsmallbook",
            dataType : "jsonp",
            data : "bid=" + $(this).val(),//发送key/value参数值
            jsonpCallback : "findsmallsel"
        })
    });
    $('a[class="page-link"][href^="bookList?currontPage="]').click(function () {
        $(this).attr("href",$(this).attr("href")+"&"+$("#formsearch").serialize());
    });
    function exeDel(event) {
        window.location.href="bookDel?id="+window.delid;
    }


</script>
</body>
</html>
