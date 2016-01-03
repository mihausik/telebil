<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:update id="fu_com_mihausik_bil_ClientComments" modelAttribute="clientcomments" path="/clientcomments" versionField="Version" z="6han5yqIsvt6wkeG3yNEsO2M7GI=">
        <div id="c_com_mihausik_bil_Clientcomments_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        <field:input field="comment" id="c_com_mihausik_bil_ClientComments_comment" z="cC/B87ihZtJoSHk4ycEdzcpZLe8="/>
    </form:update>
</body>
</html>