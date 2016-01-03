<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<body>
<form:find finderName="ByDateBetweenAndClientservice" id="ff_com_mihausik_bil_Csbalancedate" path="/csbalancedates" z="9DZGw9F8vVr+MMUvFzfEfi3gRJ4=">
        <field:datetime dateTimePattern="${csbalancedate_date_date_format}" disableFormBinding="true" field="minDate" id="f_com_mihausik_bil_Csbalancedate_minDate" required="true" z="gzAmdj9m1fGfvMUK4f0L7/oDkiI="/>
        <field:datetime dateTimePattern="${csbalancedate_date_date_format}" disableFormBinding="true" field="maxDate" id="f_com_mihausik_bil_Csbalancedate_maxDate" required="true" z="HCCZCLgDBTz0JqteNig4UDM63Do="/>
       <div id="_c_com_mihausik_bil_Csbalancedate_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
</div>
<br>
       
        
    </form:find>
</body>
</html>