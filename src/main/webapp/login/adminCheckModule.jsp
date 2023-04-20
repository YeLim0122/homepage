<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- adminCheckModule.jsp -->
<%-- 
	관리자 여부를 체크하는 모듈 (관리자는 mstate = 9)
	1. 로그인이 되어 있어야 함.
	2. 정지회원은 아니어야 함.	    => 두 가지는 loginCheckModule.jsp에서 함.
	3. mstate 값은 9여야 함.
--%>
<%@ include file="/login/loginCheckModule.jsp" %>

<%
	if (member.getMstate() != 9) {
		%>
		<script>
			alert('관리자만 이용할 수 있어요.');
			history.back();
		</script>
		<%
		return;
	}
%>