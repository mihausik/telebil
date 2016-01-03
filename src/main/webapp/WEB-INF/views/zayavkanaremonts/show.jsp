<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="page" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<page:show id="ps_com_mihausik_bil_Zayavkanaremont" object="${zayavkanaremont}" path="/zayavkanaremonts" z="jAXbLtyQiwtw6RVTVmfmHZZO8RI=">
        <field:display date="true" dateTimePattern="${zayavkanaremont_dataoformleniya_date_format}" field="dataoformleniya" id="s_com_mihausik_bil_Zayavkanaremont_dataoformleniya" object="${zayavkanaremont}" z="cfDnoBgN6gPKmb+AzxUKK1WcSPU="/>
       
        
        
        
        <label>
            <c:out value="Услуга:"/>
        </label>
        <div class="box">
            <c:out value="${zayavkanaremont.clientservice.service.name}"/>
        </div>
        <br/>
        
                <label>
            <c:out value="Адрес предоставления услуги:"/>
        </label>
        <div class="box">
            <c:out value="${zayavkanaremont.clientservice.addresspreduslugi}"/>
        </div>
        
       
        
        <br/>
         <table>
          <tr>
          <th>Сотрудник</th>
          <th>Комментарий</th>
          </tr>
          <c:forEach var="comments" items="${comments}">
          <tr>
          <td>${comments.manager.manname}</td>
          <td>${comments.comment}</td>
          </tr>
      </c:forEach>
      
      <field:display field="message" id="s_com_mihausik_bil_Zayavkanaremont_message" object="${zayavkanaremont}" z="H6y9WwZp2wfPC0CF9p8XEFqyOYE="/>
    </table>
    <a href="/telebil/commentszayavokremonts?form&id=${zayavkanaremont.id}" >добавить комментарий</a>
    </page:show>
</body>
</html>