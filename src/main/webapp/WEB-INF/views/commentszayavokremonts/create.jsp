<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<form:create id="fc_com_mihausik_bil_Commentszayavokremont" modelAttribute="commentszayavokremont" path="/commentszayavokremonts" render="${empty dependencies}" z="gh/IZBTZz7dai6Tz3TP1XMy4mgY=">
        <field:textarea field="comment" id="c_com_mihausik_bil_Commentszayavok_comment" z="user-managed"/>
        <field:select field="manager" id="c_com_mihausik_bil_Commentszayavok_manager" itemLabel="manname" itemValue="id" items="${managers}" path="/managers" z="user-managed"/>

   <div id="c_com_mihausik_bil_Commentszayavok_zayavkanaremont">
<label><c:out value="Заявка на ремонт по адресу:"></c:out></label><input type="hidden" name="zayavkanaremont" value="${zayavkanaremonts.id}"/>  
<c:out value="${zayavkanaremonts.clientservice.addresspreduslugi}"  ></c:out>
</div>
<br>
   </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Commentszayavokremont" render="${not empty dependencies}" z="HceFCdKQvQHk1fNOymw/cPa7P9M="/>