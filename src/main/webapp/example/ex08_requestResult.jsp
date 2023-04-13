<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp" />

<div class="container">
	<h1>사용자가 입력한 값 받기</h1>
	<%
		// 단일 값 받기: String getParameter("파라미터명")
		// 다중 값 받기: String[] getParameterValues("파라미터명") 
		// request: HttpServletRequest 타입
		
		String name = request.getParameter("userName");
		String id = request.getParameter("userid");
		String gender = request.getParameter("gender");
		String photo = request.getParameter("photo");
		String job = request.getParameter("job");
		
		// null 체크 해야 함
		String [] hobbies = request.getParameterValues("hobby");
		String [] langs = request.getParameterValues("lang");
		
	%>
	<hr color='red'>
	
	<ul style="text-align: left; padding: 2em;">
		<li>이름: <%= name %></li>
		<li>아이디: <%= id %></li>
		<li>성별: <%= gender %></li>
		<li>첨부파일명: <%= photo %> </li>		
		<li>직업: <%= job %></li>		

		<li>취미: 
		<% 
			if (hobbies != null) {
				for(String hobby:hobbies) { 
					out.println(hobby+", ");
				}
			}
		%>
		</li>
				
		<li>사용 언어: 
		<% 
			if (langs != null) {
				for(String lang:langs) {
					out.println(lang+", ");
				}
			}
		%></li>		
	</ul>
	
</div>

<jsp:include page="/foot.jsp" />