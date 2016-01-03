<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientservicestreet" modelAttribute="clientservicestreet" path="/clientservicestreets" render="${empty dependencies}" z="MipL8lothRMA6ZvlPpE/2a2pk50=">        
        <div id="c_com_mihausik_bil_Clientservicestreet_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
</div>
<br/>
          <field:select field="citystreets" id="c_com_mihausik_bil_Clientservicestreet_citystreets" itemValue="id" items="${citystreetses}" path="/citystreetses" z="FLYEz3JMDBiHaE0Ob5Yeu+IIUIY="/>
          <field:input field="housenum" id="c_com_mihausik_bil_Clientservicestreet_housenum" z="EJ4bjl8t7FXrBtaxCUAvgh378xw="/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientserviceip" render="${not empty dependencies}" z="nCKTc5I2CEhhqhb5tjmH994mQeA="/>
</html>