<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientnumdog" modelAttribute="clientnumdog" path="/clientnumdogs" render="${empty dependencies}" z="A9P2L92rHfm/oO6rIOYLQvuz9Go=">
        <div id="c_com_mihausik_bil_Clientnumdog_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        <field:input field="nomerdogovora" id="c_com_mihausik_bil_Clientnumdog_nomerdogovora" z="GxlR+x/3EYx1saTZ2h7jYiAQr5s="/>
        <field:datetime dateTimePattern="${clientnumdog_datazaklucheniya_date_format}" field="datazaklucheniya" id="c_com_mihausik_bil_Clientnumdog_datazaklucheniya" z="ccMsaGqY6CFdTcr1Y77YpuCMTPg="/>
    </form:create>
</body>
</html>