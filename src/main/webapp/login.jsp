<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.oracle.ddbook.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>小鸟</title>
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
						<%--
							Map<String,String> error= (Map<String, String>) request.getAttribute("error");
							if(error!=null){
								Set<String> keyset=error.keySet();
								for (String key:keyset) {
									out.print(key+"----->"+error.get(key));
								}
							}

						--%>


						<form method="post" action="login" autocomplete="off" id="loginform">
							<%
								Map<String,String> error= (Map<String, String>) request.getAttribute("error");
								Admin admin = (Admin) request.getAttribute("admin");
								if (admin != null) {

							%>
							<h3 class="text-center">登录</h3>
							<br> <br>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right ">用户名</label>
								<div class="col-sm-10">
									<%
									if (error!=null&&error.get("name")!=null){
									    %>
									<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<div class="invalid-feedback">
										<%=error.get("name")%>
									</div>
									<%
									}else{
									%>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()==null?"":admin.getName()%>">
									<%
									}
									%>

								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<%
									if (error!=null&&error.get("pwd")!=null){
									    %>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" >
									<div class="invalid-feedback">
										<%=error.get("pwd")%>
									</div>
									<%
									}else {
									    %>
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd" >
									<%
									}
									%>

								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<%
									if (error!=null&&error.get("vcode")!=null){
									    %>
									<input  class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=error.get("vcode")%>
									</div>
									<%
									}else{
									   %>
									   <input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
									<%
									}
									%>

								</div>
								<div class="col-sm-5">
									<img src="vcode.png" id="yanZheng">

                                         <%
										 if(request.getAttribute("msg")!=null){
											 %>
										<h3><%=request.getAttribute("msg")%></h3>
										<%
										 }
										 %>

								</div>

							</div>

							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>

						</form>   
						<%
							} else {
						%>
						<h3 class="text-center">登录</h3>
						<br>
						<br>
						<div class="form-group row">
							<label for="inputName" class="col-sm-2 col-form-label text-right ">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
							<div class="col-sm-5">
								<input  class="form-control" id="inputVcode" placeholder="验证码" name="vcode">
							</div>
							<div class="col-sm-5">
								<img src="vcode.png" id="yanZheng">

									<%
										if(request.getAttribute("msg")!=null){
									%>
									<h3><%=request.getAttribute("msg")%></h3>
									<%
										}
									%>

							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-2"></div>
							<div class="col-sm-10">
								<button type="submit" class="btn btn-primary">登录</button>
							</div>
						</div>

						</form>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function () {
		$("#yanZheng").click(function () {
			$(this).attr("src","vcode.png?t="+Math.random());
        })
    });
</script>
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
	<script type="text/javascript">
        $(function () {
            $("#loginform").validate({
                rules:{//必填规则
                    name:{
                        required:true,
						minlength:1,
						maxlength:10
					},
                    pwd:{
                        required:true,
                        minlength:1,
                        maxlength:11
					},
                    vcode:{
                        required:true,
                        minlength:4,
                        maxlength:4
					}

                },
                messages:{//错误显示信息

                },
                errorElement:"div",//错误显示的块
                errorClass:"invalid-feedback",
                highlight: function(element, errorClass, validClass) {//未填时报错高亮
                    $(element).addClass("is-invalid").removeClass(validClass);

                },
                unhighlight: function(element, errorClass, validClass) {///填过之后高亮消失
                    $(element).removeClass("is-invalid").addClass(validClass);

                },
                validClass:"is-valid"

            });
        });
	</script>
</body>
</html>