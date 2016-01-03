<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Ocherednapodkluchenie" label="заявку на подключение" modelAttribute="ocherednapodkluchenie" path="/ocherednapodkluchenies" render="${empty dependencies}" z="KNqxfdGlzmO7GZW7WqXIMdopOq0=">
<field:select field="supplier" id="c_com_mihausik_bil_Ocherednapodkluchenie_supplier" itemLabel="name" itemValue="id" items="${suppliers}" path="/suppliers" z="user-managed"/>
      <div id="c_com_mihausik_bil_Ocherednapodkluchenie_clientservice">
      <label><c:out value="Услуга:"></c:out></label>
<select name="clientservice" id="_clientservice_id" class="dijitReset.dijitInputInner">
<c:forEach  items="${clientservices}" var="cservice">
<option value="${cservice.id}">${cservice.service.name},${cservice.addresspreduslugi}</option>
</c:forEach>
</select>
 </div>
 <br>
       <div id="c_com_mihausik_bil_Ocherednapodkluchenie_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        
        <field:select field="manager" id="c_com_mihausik_bil_Ocherednapodkluchenie_manager" itemLabel="manname" itemValue="id" items="${managers}" path="/managers" z="user-managed"/>
      
         <script type="text/javascript">
       Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clientservice_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}}));   
       </script>
      <br>
<br>
   <field:datetime dateTimePattern="${ocherednapodkluchenie_deadlinedate_date_format}" field="deadlinedate" id="c_com_mihausik_bil_Ocherednapodkluchenie_deadlinedate" z="aiIgHwHrxYP7YDj+3MQsiEKBxDU="/>     
    </form:create>