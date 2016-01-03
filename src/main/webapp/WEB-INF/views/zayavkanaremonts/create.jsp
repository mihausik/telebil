<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<form:create id="fc_com_mihausik_bil_Zayavkanaremont" modelAttribute="zayavkanaremont" path="/zayavkanaremonts" render="${empty dependencies}" z="dQNKpOOK1tqZlj3njohBQW0LnKs=">
        <field:input field="dataoformleniya" render="false" type="hidden" id="c_com_mihausik_bil_Zayavkanaremont_dataoformleniya" z="qDIDnjW0ix9thyEkNQ0cptmb2SA="/>
 <div id="c_com_mihausik_bil_Zayavkanaremont_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
</div>
<br/>
<label><c:out value="Клиент:"></c:out></label><c:out value="${clientservices.client.clientname}"  ></c:out>
<br/>
<br/>
        <field:textarea field="message"  id="c_com_mihausik_bil_Zayavkanaremont_message" z="/O+M1I1hc+VWBy+6ZZb1E/V095I="/>

    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Zayavkanaremont" render="${not empty dependencies}" z="eXd6izf2KokYHeG/wweXpLzyccs="/>
