<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<body>
<form:create id="fc_com_mihausik_bil_Tempblock" modelAttribute="tempblock" path="/tempblocks" render="${empty dependencies}" z="z0TxzaFpgAxvKoa8Ged5D0RWmYI=">
        <field:datetime dateTimePattern="${tempblock_startblock_date_format}" future="true" field="startblock" id="c_com_mihausik_bil_Tempblock_startblock" z="qLbU2L12u4oYuZO2DVx9/gJveD8="/>
        <field:datetime dateTimePattern="${tempblock_stopblock_date_format}" future="true" field="stopblock" id="c_com_mihausik_bil_Tempblock_stopblock" z="fjiSKBPrfNGTHt/sCCtBKRfngEA="/>
    
 <div id="c_com_mihausik_bil_Tempblock_clientservice">
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
                  </form:create>
                  <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Tempblock" render="${not empty dependencies}" z="Z8M2Bmltv294um3K2DyxOjTBRk0="/>
</body>
</html>