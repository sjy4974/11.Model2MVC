<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.net.URLDecoder" %>


<html>
<head>

<title>��� ��ǰ ����</title>

</head>
<body>
	����� ��� ��ǰ�� �˰� �ִ�
<br>
<br>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	String history = null;
	Cookie[] cookies = request.getCookies();
	if (cookies!=null && cookies.length > 0) {
		for (int i = 1; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName() != null && cookie.getName().startsWith("history")) {
				history = cookie.getValue();
				%>
				<a href="/product/getProduct?prodNo=<%=history%>&menu=search" target="rightFrame"><%=URLDecoder.decode(cookie.getName().substring(7), "UTF-8")%></a>
				<br>
				<%
			}
		}
	}
%>

</body>
</html>