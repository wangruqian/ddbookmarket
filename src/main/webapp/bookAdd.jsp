<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书本添加</title>
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

						<form method="post" action="bookAdd" autocomplete="off" enctype="multipart/form-data" id="inputform">
							<h3 class="text-center">分类添加</h3>
							<br> <br>
							<div class="form-group row">
								<label for="inputbid" class="col-sm-2 col-form-label text-right ">大类名</label>
								<div class="col-sm-10">
									<select name="bid" class="form-control" id="inputbid" >
									<option>--请选择--</option>
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
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name">
								</div>
								<label for="inputprice" class="col-sm-2 col-form-label text-right ">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputprice" placeholder="价格" name="price">
								</div>
								<label for="inputpub" class="col-sm-2 col-form-label text-right ">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputpub" placeholder="出版社" name="pub">
								</div>
								<label for="inputpescr" class="col-sm-2 col-form-label text-right ">描述</label>
								<div class="col-sm-10">
									<textarea  class="form-control" id="inputpescr" placeholder="描述" name="pescr"></textarea>
								</div>
								<label for="inputday" class="col-sm-2 col-form-label text-right ">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputday" placeholder="出版日期" name="day" readonly="readonly">
								</div>
								
								<label for="inputHeader" class="col-sm-2 col-form-label text-right">封面</label>
								<div class="col-sm-10">
									<div class="custom-file">
										<%--@declare id="inputgroupfile03"--%><input type="file" class="custom-file-input" id="inputphoto" aria-describedby="inputGroupFileAddon03" name="photo"> <label class="custom-file-label"for="inputGroupFile03">上传封面</label>
									</div>

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
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>
    <script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
    <script type="text/javascript">
	$(function () {
		$("#inputform").validate({
			rules:{//必填规则
                price:{
                    required:true,
                    number:true
				},
                pescr:{
                    required:true,
                    maxlength:400
				},
				name:{
                    required:true,
					minlength:1
				},
                photo:{
                    required:true,
					accept:"image/*"
		}
			},
			messages:{//错误显示信息
                price:{
                    required:"价格必填",
                    number:"必须是阿拉伯数字"
                },
		        photo:{
                    accept:"必须是图片格式"
				}
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