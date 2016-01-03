<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<form:create id="fc_com_mihausik_bil_Clientdata" modelAttribute="clientdata" path="/clientdatas" render="${empty dependencies}" z="tuugvf2tmR7MKtgVFl9N4Z3jYg8=">
<div id="c_com_mihausik_bil_Clientdata_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        <field:select field="contacttype" id="c_com_mihausik_bil_Clientdata_contacttype" itemLabel="contacttype" itemValue="id" items="${clientcontacttypes}" path="/clientcontacttypes" z="user-managed"/>
        <field:select field="contactname" id="c_com_mihausik_bil_Clientdata_contactname" itemLabel="contact" itemValue="id" items="${clientcontacts}" path="/clientcontacts" z="user-managed"/>
        <field:input field="contact" id="c_com_mihausik_bil_Clientdata_contact" z="bkclFRjermXGNwET6wmwXUBK2N4="/>
        <field:input field="fio" id="c_com_mihausik_bil_Clientdata_fio" z="XzudzA3+DyCk0emOoZ1QKh/5ysQ="/>
        <field:input field="doljnost" id="c_com_mihausik_bil_Clientdata_doljnost" z="j0eQ8pBJpnjSpXngO9li90K315s="/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientdata" render="${not empty dependencies}" z="/X1QFJAV43G1ElRxYqVTx9+9hwE="/>
</html>