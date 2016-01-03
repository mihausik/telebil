<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientcomments" modelAttribute="clientcomments" path="/clientcomments" render="${empty dependencies}" z="A9P2L92rHfm/oO6rIOYLQvuz9Go=">
<div id="c_com_mihausik_bil_Clientcomments_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
<field:textarea field="comment" id="c_com_mihausik_bil_Clientcomments_comment" z="mwVQ1YTZY+uEbtTWgeabKc/ykTA="/>
 </form:create>
 <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientcomments" render="${not empty dependencies}" z="2qQUg8eKMc6TTNCwrEm1X2wrMCY="/>
</body>
</html>