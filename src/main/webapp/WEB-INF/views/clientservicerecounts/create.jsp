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
<form:create id="fc_com_mihausik_bil_Clientservicerecount" modelAttribute="clientservicerecount" path="/clientservicerecounts" render="${empty dependencies}" z="M+MqG+XELzWmC1lLcnmaZWbCKac=">
        <field:datetime dateTimePattern="${clientservicerecount_datastartrecount_date_format}" field="datastartrecount" id="c_com_mihausik_bil_Clientservicerecount_datastartrecount" z="DFpzz62w/3wkiDA7Pla0oS77Bbs="/>
        <field:datetime dateTimePattern="${clientservicerecount_datastoprecount_date_format}" field="datastoprecount" id="c_com_mihausik_bil_Clientservicerecount_datastoprecount" z="eQk6YeMQuHEl1HB+5XS74Qd5gLc="/>
        <div id="c_com_mihausik_bil_Clientservicerecount_clientservice">
<label><c:out value="Услуга:"></c:out></label><input type="hidden" name="clientservice" value="${clientservices.id}"/>  
<c:out value="${clientservices.service.name}"  ></c:out>
    </div>
<br/>
       <br/>

       <span style="color:red;">
       Внимание!!!<br/>
       Дата "Stopblock" проставляется ВКЛЮЧИТЕЛЬНО!<br/>
       Например, при Stopblock=02-02-2015 возобновление услуги осуществляется 03-02-2015 в 00:00:00</span>
       <br/>
       <field:input field="status" render="false" id="c_com_mihausik_bil_Clientservicerecount_status" z="ue44vfHdwGi/jy6maOr1k20PVx4="/>
                  </form:create>
                  <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Tempblock" render="${not empty dependencies}" z="Z8M2Bmltv294um3K2DyxOjTBRk0="/>
</body>
</html>

 