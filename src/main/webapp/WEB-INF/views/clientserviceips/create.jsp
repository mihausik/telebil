<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientserviceip" modelAttribute="clientserviceip" path="/clientserviceips" render="${empty dependencies}" z="QX+ijnjGuLrUaSpGv8JHXw5PpSg=">
        
        <div id="c_com_mihausik_bil_Clientserviceip_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
</div>
<br/>
        <field:input field="ip" id="c_com_mihausik_bil_Clientserviceip_ip" required="true" z="WOrWv44TWVXWYE4fZq3kzQbqv84="/>
        <field:input field="mask" id="c_com_mihausik_bil_Clientserviceip_mask" required="true" z="uekAXFhA3eKkzo9Y4Akd9iSKWTA="/>
        <field:input field="gateway" id="c_com_mihausik_bil_Clientserviceip_gateway" z="EjGNEeU0AYw9wDkqQHqN5BlDklA="/>
        <field:input field="macaddr" id="c_com_mihausik_bil_Clientserviceip_macaddr" z="jupeQGGo0jYVX8c3NMnXwwreJSM="/>
    <field:select field="iptype" id="c_com_mihausik_bil_Clientserviceip_iptype" items="${iptypes}" path="iptypes" z="CUgumaOMAY6ugvKliXeF8KHxC2A="/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientserviceip" render="${not empty dependencies}" z="nCKTc5I2CEhhqhb5tjmH994mQeA="/>
</html>