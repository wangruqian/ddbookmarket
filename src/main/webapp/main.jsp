<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/5
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link  rel="stylesheet" type="text/css" id="qxmr"/>
    <script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
    <script type="text/javascript">
        //浏览器加载
        if($.cookie("bootstraptheme")){
            //如果浏览器里有值，改主题
            $("#qxmr").attr("href","bower_components/bootswatch/dist/"+$.cookie("bootstraptheme")+"/bootstrap.css");
        }else{
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
                <img src="bower_components/bootstrap/site/docs/4.1/assets/img/favicons/tmm.png" style="height:100px">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="navbar-toggler-icon"></span>
                </button> <a class="navbar-brand" href="#">

            </a>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="javascript:void(0)">
                                <select id="themestyle" class="custom-select">
                                    <option>darkly</option>
                                    <option>cosmo</option>
                                    <option>journal</option>
                                    <option>lux</option>
                                    <option>minty</option>
                                </select>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown link</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider">
                                </div> <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="text" />
                        <button class="btn btn-primary my-2 my-sm-0" type="submit">
                            Search
                        </button>
                    </form>
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Link <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenu" data-toggle="dropdown">Dropdown link</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider">
                                </div> <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="carousel slide" id="carousel-905338">
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#carousel-905338" class="active">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-905338">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-905338">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                心情
                            </h4>
                            <p>
                                美好的一天要从锻炼身体开始
                            </p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                Second Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
                        <div class="carousel-caption">
                            <h4>
                                Third Thumbnail label
                            </h4>
                            <p>
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                        </div>
                    </div>
                </div> <a class="carousel-control-prev" href="#carousel-905338" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-905338" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img class="card-img-top" alt="Bootstrap Thumbnail First" src="https://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
                        <div class="card-block">
                            <h5 class="card-title">
                                Card title
                            </h5>
                            <p class="card-text">
                                晚霞很美，心情更美，好好学习天天向上
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img class="card-img-top" alt="Bootstrap Thumbnail Second" src="https://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
                        <div class="card-block">
                            <h5 class="card-title">
                                Card title
                            </h5>
                            <p class="card-text">
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img class="card-img-top" alt="Bootstrap Thumbnail Third" src="https://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
                        <div class="card-block">
                            <h5 class="card-title">
                                Card title
                            </h5>
                            <p class="card-text">
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <h2>
                Heading
            </h2>
            <p class="text-center">
                小熊猫&copy<a class="btn" href="mailto:分享@qq.com">分享>></a>
            </p>

        </div>
    </div>
</div>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function(){
        $("#themestyle").change(function(){//改变选择
            //在指定位置改变主题   target事件的目标节点
            $("#qxmr").attr("href","bower_components/bootswatch/dist/"+$(event.target).val()+"/bootstrap.css");
            //更改主题保留时间  jQuery下cookie（“name”,"vule",时间周期）
            $.cookie('bootstraptheme', $(event.target).val(), { expires: 30});
        });
        //主题名和主题保持一致
        $("#themestyle").val($.cookie("bootstraptheme"));
    });
</script>
</body>
</html>