<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<body>
<form:create  id="fc_com_mihausik_bil_Payment" modelAttribute="payment"  path="/payments" >
<div id="_c_com_mihausik_bil_Payment_client_id">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
<field:input field="description" id="c_com_mihausik_bil_Payment_description" z="bAgBjOUajyjwfs71OVAzuKOfgrU="/>
  <div id="_c_com_mihausik_bil_Payment_service_id">
<label><c:out value="Услуга:"></c:out></label>
<select name="clientservice" id="_clientservice_id" class="dijitReset.dijitInputInner">
        <option value="${clientservices.id}">${clientservices.service.name}  |  ${clientservices.addresspreduslugi}</option>
      </select>
      </div>
       <script type="text/javascript">
       Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clientservice_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}}));   
       </script>
      <br>
      <field:input field="summa" id="c_com_mihausik_bil_Payment_summa" validationMessageCode="field_invalid_number" z="Pw2ccB+TdqnulGNlLtnqW1TLMoY="/>
        <field:datetime dateTimePattern="${payment_dataplateja_date_format}" field="dataplateja" id="c_com_mihausik_bil_Payment_dataplateja" z="mX+HMIe0S6N7CKV/2FJ1GRyrRik="/>
                  </form:create>
</body>
</html>