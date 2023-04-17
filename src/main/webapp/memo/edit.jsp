<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="memo.app.*" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		function check(){
			// window.document.mf.submit();
			if(mf.name.value == ""){
				alert('작성자를 입력하세요.');
				mf.name.focus();
				return;
			}
			if(mf.msg.value == ""){
				alert('메모내용을 입력하세요.');
				mf.msg.focus();
				return;
			}
			let len = mf.msg.value.length;
			if(len > 100){
				alert('메모 내용은 100자 까지만 가능해요');
				mf.msg.select();
				return;
			}
			
			mf.submit();
		}
	</script>
	<meta charset="UTF-8">
	<title>메모 수정</title>
	<!-- memo.css 참조 -------------- -->
	<link rel="stylesheet" type="text/css" href="css/memo.css">
	
</head>
<body>
	<div id="wrap">
	<%
		Object obj = request.getAttribute("memo");
		MemoVO vo = (MemoVO)obj;
		if (vo==null) {
	%>
			<script>
				alert('존재하지 않는 글입니다.');
				location.href='MemoList';	// 웹 브라우저의 url을 변경해서 이동한다.
			</script>
	<%
			return;
		}	// if-----------------
	%>
	
		<form name="mf" action="MemoEdit" method="post">
			<table border="1">
				<tr>
					<th colspan="2">::한줄 메모장 글 수정::</th>
				</tr>
				<tr>
					<td>글 번호</td>
					<td><input type="text" name="no" value="<%= vo.getNo() %>" 
						placeholder="No" readonly style="width:40%"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" value="<%= vo.getName() %>"
						placeholder="Name"></td>
				</tr>
				
				<tr>
					<td>메모 내용</td>
					<td><input type="text" name="msg" value="<%= vo.getMsg() %>"
						placeholder="Message"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="check()">글 수정하기</button>
						<button type="reset">다시 쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>