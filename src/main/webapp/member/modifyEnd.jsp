<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" %>
    
<%--
	0) post방식일 때 한글 처리
	1) UserVO 빈을 useBean 액션으로 생성 - page scope
	2) 사용자가 입력한 값 UserVO 빈에 setting - setProperty 액션 사용
	3) 유효성 체크
	4) UserDAO 빈을 useBean액션으로 생성 - session scope
	5) UserDAO 빈 updateMember(vo) 호출
	6) 그 결과 메시지 처리 및 페이지 이동 경로 처리
	==> insert와 update 비슷함
--%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="user" class="user.model.UserVO" scope="page" />

<jsp:setProperty name="user" property="*" />
<%--
	name: VO빈의 id를 기술
	param: html의 input name을 기술
	property: VO빈의 property명을 기술
	property와 param이 같다면 기술하지 않아도 됨.
 --%>

<%
	if (user.getName()==null || user.getUserid()==null || user.getHp1()==null ||
		user.getHp2()==null || user.getHp3()==null) {
		response.sendRedirect("../main.jsp");
		return;
	}
%>

<jsp:useBean id="userDao" class="user.model.UserDAO" scope="session" />

<%
	UserVO member = (UserVO)session.getAttribute("loginUser");
	int mstate = 0;
	if (member != null) {
		mstate = member.getMstate();	// 로그인한 사람의 회원상태 값
	}
	int n = userDao.updateUser(user, mstate);
	response.sendRedirect("list.jsp");
%>
