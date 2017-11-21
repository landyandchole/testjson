<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>json test</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/json2.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/json/testRequestBody",
			dataType:"json",
			contentType:"application/json",
			data:JSON.stringify({id:1,name:"test"}),
			success:function(data){
				console.log(data);
				$("#id").html(data.id);
				$("#name").html(data.name);
				$("#author").html(data.author);
				console.log("later",data);
			},
			
			error:function(){
				alert("error");
			}
		});
	})
</script>
</head>
<body>
<!-- <form action="testRequestBody.do">
	<table>
		<tr>
			<th>编号</th>
			<td><input type="text"></td>
		</tr>
		<tr>	
			<th>书名</th>
			<td><input type="text"></td>
		</tr>
		<tr>	
			<th>作者</th>
			<td><input type="text"></td>
		</tr>
		<tr><td><input type="submit"></td></tr>
	</table>
</form> -->
	编号：<span id="id"></span><br>
	书名：<span id="name"></span><br>
	作者：<span id="author"></span><br>
</body>
</html>