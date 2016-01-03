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
 <form:create id="fc_com_mihausik_bil_Commentsocheredi" modelAttribute="commentsocheredi" path="/commentsocheredis" render="${empty dependencies}" z="7cNVOf9ib607GRTk+TJGvHg8iF4=">
        <field:textarea field="comment" id="c_com_mihausik_bil_Commentsocheredi_comment" z="9++hf3asBqaEm5Gs9Hlr7+sUV1I="/>
        <field:select field="manager" id="c_com_mihausik_bil_Commentsocheredi_manager" itemLabel="manname" itemValue="id" items="${managers}" path="/managers" z="lfCWcI0XlMIEUpmDHvrVQvtHV4I="/>
    <div id="c_com_mihausik_bil_Commentsocheredi_ocherednapodkluchenie">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="ocherednapodkluchenie" value="${ocherednapodkluchenies.id}"/>  
<c:out value="${ocherednapodkluchenies.client.clientname}" />
</div>
<br>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Commentsocheredi" render="${not empty dependencies}" z="XL/OOmmK9hGjiNdkjUM2VIg2sHQ="/>
