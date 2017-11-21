<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/json2.js"></script>

<script type="text/javascript">
	$(function(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/json/testRequestBody2",
			dataType:"json",
			success:function(data){
				$.each(data,function(){
					var tr = $("<tr align = 'center'/>");
					$("<td/>").html(this.id).appendTo(tr);
					$("<td/>").html(this.name).appendTo(tr);
					$("<td/>").html(this.author).appendTo(tr);
					$("#booktable").append(tr);
				})
			}
		})
	})
</script>
</head>
<body>
	<table id="booktable" border="1" style="border-collapse:collapse;">
		<tr align="center">
			<td>编号</td>
			<td>书名</td>
			<td>作者</td>
		</tr>
	</table>
</body>
</html>