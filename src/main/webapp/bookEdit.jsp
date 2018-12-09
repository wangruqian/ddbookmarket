<%@ page import="com.oracle.ddbook.model.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍修改</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
<link href="bower_components/bootswatch/dist/sketchy/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "浏览"
}
</style>
</head>
<body>
	<div class="container-fluid" style="width: 80%">
		<div class="row">
			<div class="col-md-12">
				<div class="card text-white bg-success mb-3" style="max-width: 100rem;">
					<div class="card-body">

						<form method="post" action="dobookEdit" autocomplete="off" enctype="multipart/form-data">
							<%
								Book booktype= (Book) request.getAttribute("book");
							%>
							<input type="hidden" name="id" value="<%=booktype.getId()%>">
							<h3 class="text-center">分类添加</h3>
							<br> <br>
							<div class="form-group row">
								<label for="inputbid" class="col-sm-2 col-form-label text-right ">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputbid" >
									<option value="-1">--请选择--</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputsid" class="col-sm-2 col-form-label text-right ">小类名</label>
								<div class="col-sm-10">
									<select name="sid" class="form-control" id="inputsid" >
									
									</select>
								</div>
							</div>
							<div class="form-group row">
								<%--@declare id="inputheader"--%><label for="inputName" class="col-sm-2 col-form-label text-right ">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%=booktype.getName()%>">
								</div>
								<label for="inputprice" class="col-sm-2 col-form-label text-right ">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputprice" placeholder="价格" name="price" value="<%=booktype.getPrice()%>">
								</div>
								<label for="inputpub" class="col-sm-2 col-form-label text-right ">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputpub" placeholder="出版社" name="pub" value="<%=booktype.getPub()%>">
								</div>
								<label for="inputpescr" class="col-sm-2 col-form-label text-right ">描述</label>
								<div class="col-sm-10">
									<textarea rows="" cols="" type="text" class="form-control" id="inputpescr" placeholder="描述" name="pescr">
									<%=booktype.getPescr()%>
									</textarea>
								</div>
								<label for="inputday" class="col-sm-2 col-form-label text-right ">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputday" placeholder="出版日期" name="day" readonly="readonly" value="<%=booktype.getDay()%>">
								</div>
								
								<label for="inputHeader" class="col-sm-2 col-form-label text-right">封面</label>
								<div class="col-sm-10">

									<div class="custom-file">
										<%--@declare id="inputgroupfile03"--%><input type="file" class="custom-file-input" id="inputphoto" aria-describedby="inputGroupFileAddon03" name="photo"> <label class="custom-file-label"for="inputGroupFile03">上传封面</label>
									</div>
									<img src="upload/<%=booktype.getPhoto()%>">
								</div>

							
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
	/*var xml=new XMLHttpRequest();
	xml.open("GET","findAllBigtype");
	xml.send();
	xml.onreadystatechange=function(){
		if(xml.readyState==4){//请求已完全接收
			if(xml.status==200){
				eval(xml.responseText);
			}
		}
	}*/
	function findsel(types){
		//获得所有  循环
		for (var i = 0; i < types.length; i++) {
			var ls=new Option(types[i].name,types[i].id);//添加选项
			document.getElementById("inputbid").appendChild(ls);//找到位置添加
		}
        $("#inputbid").val('<%=request.getAttribute("bid")%>');
		console.log('<%=request.getAttribute("bid")%>'+"-------------");

        $("#inputbid").trigger("change");
	}
	/*var script=document.createElement("script");
	script.src="findAllBigtype";
	document.body.appendChild(script);*/
	//console.dir($)
	$.ajax({
		url:"findAllBigtype",
	    dataType:"jsonp",
		jsonpCallback:"findsel"
	})
	function findsmallsel(types){
		//获得所有  循环
		document.getElementById("inputsid").innerHTML="";
		for (var i = 0; i < types.length; i++) {
			var ls=new Option(types[i].name,types[i].id);//添加选项
			document.getElementById("inputsid").appendChild(ls);//找到位置添加
		}
        $("#inputsid").val('<%=booktype.getSid()%>');
	}

	
	$("#inputbid").change(function (){
	$.ajax({
		url:"findAllsmallbook",
	    dataType:"jsonp",
	    data:"bid="+$(this).val(),//发送key/value参数值
		jsonpCallback:"findsmallsel"
	})	
	})
	
	</script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript">
		$("#inputday").datepicker({
			language : 'zh-CN',
			format : "yyyy-mm-dd",			
			autoclose : true,
			defaultViewDate : {
				year : new Date().getFullYear() - 18
			}
		});
	</script>
</body>
</html>