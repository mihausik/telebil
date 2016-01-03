<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<form:create id="fc_com_mihausik_bil_Clientnotification" label="уведомление" modelAttribute="clientnotification" path="/clientnotifications" render="${empty dependencies}" z="fWXB5+JN2Z/ySMsNzM4/teU1R1U=">
        <field:select field="notiftype" id="c_com_mihausik_bil_Clientnotification_notiftype" items="${notiftypes}" path="notiftypes" z="pKdEWzOqJr5umulExkWL9bJms98="/>
        <field:input field="contact" id="c_com_mihausik_bil_Clientnotification_contact" z="6dqLUHp5PLDNUViM7Cz/aYs65a8="/>
        <field:input field="notificationsum" id="c_com_mihausik_bil_Clientnotification_notificationsum" z="yXQXlCKTxZr4IyMnQ/r6BQQ+OFk="/>
                <div id="c_com_mihausik_bil_Clientnotification_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
        <br/>
        <div id="_c_com_mihausik_bil_Clientnotification_clientservice_id">
<label><c:out value="Услуга:"></c:out></label>
<select name="clientservice" id="_clientservice_id" class="dijitReset.dijitInputInner">
    <c:forEach items="${clientservices}" var="clientservices">
            <option value="${clientservices.id}">${clientservices.service.name}  |  ${clientservices.addresspreduslugi}</option>
    </c:forEach>
</select>
</div>
<script type="text/javascript">
       Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clientservice_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}}));   
       </script>
      
<br>   
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientnotification" render="${not empty dependencies}" z="tu38XCRWUofgCZjxL3xObRRFYfk="/>
</body>
</html>