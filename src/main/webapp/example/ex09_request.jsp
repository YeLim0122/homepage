<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp" />

<div class="container">
	<h1>request의 주요 메소드</h1>
	
	<%
		String server = request.getServerName();	// 서버 도메인 명
		int port = request.getServerPort();	// 서버에서 열어둔 포트번호
		StringBuffer buf = request.getRequestURL();	//전체 URL 정보
		String url = buf.toString();
		// http://172.30.1.37:9090/MyWeb/example/ex09_request.jsp
		
		String uri = request.getRequestURI();	
		// uri => 컨테스트명 이후 경로를 반환
		// /MyWeb/example/ex09_request.jsp
		
		String ctx = request.getContextPath();	// "/MyWeb"
		String qStr = request.getQueryString();	// query string을 반환
		String clientIp = request.getRemoteAddr();	// 클라이언트 ip 주소 반환
		
		// 실습1: uri 문자열에서 "/example/ex09_request.jsp" 문자열을 추출하여 출력
		// 실습2: uri 문자열에서 "/example/ex09_request" 문자열을 추출하여 출력
		
		String s1 = uri.replace(ctx, "");
					// uri.substring(ctx.length());
		String s2 = s1.replace(".jsp", "");
		/*
		if (s2.equals("example/ex01"))	{
			// ex01.jsp 페이지로 이동
		}
		*/
		
		String path = request.getServletPath();	//컨텍스트명을 포함하지 않는 경로 문자열을 반환
		// "/example/ex09_request.jsp"
		String proto = request.getProtocol();
		
		int index = path.lastIndexOf(".jsp");
		// 검색 문자열을 뒤에서부터 찾아서 해당 인덱스 번호를 반환
		System.out.println(index);
		if (index > 0) {
			//path = path.substring(0, index);
		}
	%>
	
	<h2>서버 도메인 명: <%= server %> </h2>
	<h2>서버 포트번호 : <%= port %> </h2>
	<h2>요청 URL   : <%= url %> </h2>
	<h2>요청 URI   : <%= uri %> </h2>
	<h2>컨텍스트명   : <%= ctx %> </h2>
	<h2>쿼리 스트링  : <%= qStr %> </h2>
	<h2>클라이언트 IP: <%= clientIp %> </h2>
	<h2>프로토콜    :  <%= proto %> </h2>
	<h2>서블릿 패스  :<%= path %> </h2>
	<h2><%= s2 %></h2>
	
</div>

<jsp:include page="/foot.jsp" />