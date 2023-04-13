<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp" />

<div style="padding:2em">
	<h1>request - form</h1>
	<br><br>
	<form name="frm" id="frm" action="ex08_requestResult.jsp" method="get">
        이름: <input type="text" name="userName" placeholder="이름을 입력하세요"><br>
        아이디: <input type="text" name="userid"><br>
        비밀번호: <input type="password" name="password" placeholder="Password"><br>
        사진: <input type="file" name="photo"><br>
        성별: <input type="radio" name="gender" value="M">남자
        <input type="radio" name="gender" value="F" checked>여자
        <br>
        <!-- 
            단일선택: radio 버튼 - 동일한 name일 경우 1개만 선택 가능
            다중선택: checkbox 버튼
         -->

         취미:
         <input type="checkbox" name="hobby" value="sports" checked>운동
         <input type="checkbox" name="hobby" value="book">독서
         <input type="checkbox" name="hobby" value="music">음악감상
         <input type="checkbox" name="hobby" value="movie">영화감상
         <br>

         <!-- 
            select: 기본은 단일 선택
                    multiple 속성 주면 다중 선택 가능
                    size 속성 주면 펼친 형태가 됨
          -->
         드롭다운 리스트:
         <select name="job">
            <option value="">::직업을 선택하세요::</option>
            <option value="developer">개발자</option>
            <option value="designer">디자이너</option>
            <option value="teacher">교사</option>
         </select>
         <br>
         <select name="lang" multiple size="7">
            <option value="">::사용가능 언어::</option>
            <option value="HTML">HTML</option>
            <option value="JAVA">JAVA</option>
            <option value="SQL">SQL</option>
            <option value="JavaScript">JavaScript</option>
         </select>
         <br>

         자기소개:
         <textarea name="intro" cols="70" rows="5" placeholder="100자 이내로"></textarea>
         <br>

         히든 필드:
         <input type="hidden" name="secret" value="TopSecret">
         <br>

         <!-- submit버튼: 서버로 데이터를 전송하는 버튼 
              reset 버튼: 초기화 기능
              button 버튼: 아무기능 없음 -> javascript와 함께 사용하여 기능을 부여
        -->
         <input type="submit" value="회원가입">
         <input type="reset" value="다시 쓰기">
         <input type="button" value="일반버튼" onclick="alert('안녕하세요!')">
         <br>
         <!-- 이미지 버튼 -->
         <a onclick="alert('잘가')"><img src="images/login.png"></a>
         <!-- input type="image" -> submit 기능을 갖는다 -->
         <input type="image" src="images/login.png">

    </form>
	
	
</div>

<jsp:include page="/foot.jsp" />