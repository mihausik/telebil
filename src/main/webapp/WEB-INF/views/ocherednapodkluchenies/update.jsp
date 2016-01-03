<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <form:update id="fu_com_mihausik_bil_Ocherednapodkluchenie" modelAttribute="ocherednapodkluchenie" path="/ocherednapodkluchenies" versionField="Version" z="ch0BjLOHxFiS4RhFkrudhcsyMEY=">
        <field:select field="supplier" id="c_com_mihausik_bil_Ocherednapodkluchenie_supplier" itemLabel="name" itemValue="id" items="${suppliers}" path="/suppliers" z="user-managed"/>
        <div id="c_com_mihausik_bil_Ocherednapodkluchenie_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        
       
        <field:select field="manager" id="c_com_mihausik_bil_Ocherednapodkluchenie_manager" itemLabel="manname" itemValue="id" items="${managers}" path="/managers" z="Ic6wk7BGY1ua3lVy/YMNKEsnMl0="/>
        
        <div id="c_com_mihausik_bil_Ocherednapodkluchenie_clientservice">
      <label><c:out value="Услуга:"></c:out></label>
<select name="clientservice" id="_clientservice_id" class="dijitReset.dijitInputInner">
<c:forEach  items="${clientservices}" var="cservice">
<option value="${cservice.id}">${cservice.service.name},${cservice.addresspreduslugi}</option>
</c:forEach>
</select>
 </div>
<br>
 <script type="text/javascript">
       Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clientservice_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}}));   
       </script>
       <field:datetime dateTimePattern="${ocherednapodkluchenie_datapodkluchenia_date_format}" field="datapodkluchenia" id="c_com_mihausik_bil_Ocherednapodkluchenie_datapodkluchenia" z="y3op4ehx/frDwKqFbv72fou5Epw="/> 
        <field:datetime dateTimePattern="${ocherednapodkluchenie_deadlinedate_date_format}"  field="deadlinedate" id="c_com_mihausik_bil_Ocherednapodkluchenie_deadlinedate" z="aiIgHwHrxYP7YDj+3MQsiEKBxDU="/>
        <field:checkbox field="arhiv" id="c_com_mihausik_bil_Ocherednapodkluchenie_arhiv" z="Fic4l2xWFLlVXkCVXHcZKRbQwjE="/>
    </form:update>