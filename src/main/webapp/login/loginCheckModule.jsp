<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" %>

<!-- loginCheckModule.jsp -->
<%
	// 로그인 여부 체크하는 모듈
	UserVO member = (UserVO)session.getAttribute("loginUser");

	if (member == null) {
		%>
		<script>
			alert('로그인 해야 이용 가능합니다.');
			location.href='<%= request.getContextPath() %>/login/login.jsp';
		</script>
		<%
		return;
	}
	
	if (member.getMstate() == -1) {
		%>
		<form name="frm" action="modify.jsp" method="post">
			<input type="hidden" name="idx" value="<%= member.getIdx() %>">
		</form>
		<script>
			alert('정지회원 입니다. 활동회원으로 전환 후, 다시 로그인 해야 서비스 이용 가능합니다.');
			<%-- location.href='<%= request.getContextPath() %>/member/modify.jsp'; 
					=> get 방식이라 안됨. --%>
			frm.submit();
		</script>
		<%
		return;
	}
%>

