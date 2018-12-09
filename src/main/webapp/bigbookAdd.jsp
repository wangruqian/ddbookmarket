<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/12/5
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
    <link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="container-fluid" style="width: 80%">
    <div class="row">
        <div class="col-md-12">
            <div class="card text-white bg-success mb-3" style="max-width: 100rem;">
                <div class="card-body">

                    <form method="post" action="BA" autocomplete="off">
                        <h3 class="text-center">分类添加</h3>
                        <br> <br>
                        <div class="form-group row">
                            <label for="inputName" class="col-sm-2 col-form-label text-right ">类名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputName" placeholder="类名" name="name" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
</body>
</html>
