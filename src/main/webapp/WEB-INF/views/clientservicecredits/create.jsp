<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientservicecredit" modelAttribute="clientservicecredit" path="/clientservicecredits" render="${empty dependencies}" z="user-managed"> 
        <div id="c_com_mihausik_bil_Clientservicecredit_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"></c:out>
</div>
<br/>
 
 <div id="c_com_mihausik_bil_Clientservicecredit_credit">
<label><c:out value="Кредит:"></c:out></label><input type="hidden" name="credit" value="${curcredit}"/>  
<c:out value="${curcredit}"></c:out>
</div>
<br/>
   
   
        
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_telebil_Clientservicecredit" render="${not empty dependencies}" z="00y65RNIXpl6v+5QueI5FrJqKp8="/>
</html>