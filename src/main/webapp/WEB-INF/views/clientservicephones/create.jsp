<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientservicephone" modelAttribute="clientservicephone" path="/clientservicephones" render="${empty dependencies}" z="user-managed"> 
        <div id="c_com_mihausik_bil_Clientservicephone_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
</div>
<br/>
<field:input field="phonenum" id="c_com_mihausik_bil_Clientservicephone_phonenum" z="ntn1DxYJfuOW4FZ/OyNC8NJNMxA="/>
 <field:datetime dateTimePattern="${clientservicephone_datavklucheniya_date_format}" field="datavklucheniya" id="c_com_mihausik_bil_Clientservicephone_datavklucheniya" z="PU9R0GbRlCq9hzvPpvTrLQ21ZAs="/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientservicephone" render="${not empty dependencies}" z="00y65RNIXpl6v+5QueI5FrJqKp8="/>
</html>