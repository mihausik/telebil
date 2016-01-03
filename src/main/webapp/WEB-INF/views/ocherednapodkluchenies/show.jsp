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
<page:show id="ps_com_mihausik_bil_Ocherednapodkluchenie" create="false" object="${ocherednapodkluchenie}" path="/ocherednapodkluchenies" z="m/yFwxjKKkeIZcTIESXqUZdj0ZQ=">
        <label>
            <c:out value="Компания:"/>
        </label>
        <div class="box">
            <c:out value="${ocherednapodkluchenie.supplier.name}"/>
        </div>
        <br/>
        <label>
            <c:out value="Менеджер:"/>
        </label>
        <div class="box">
            <c:out value="${ocherednapodkluchenie.manager.manname}"/>
        </div>
        <br/>
        <label>
            <c:out value="Клиент:"/>
        </label>
        <div class="box">
            <c:out value="${ocherednapodkluchenie.client.clientname}"/>
        </div>
        <br/>
        <label>
            <c:out value="Услуга:"/>
        </label>
        <div class="box">
            <c:out value="${ocherednapodkluchenie.clientservice.service.name}"/>
        </div>
        <br/>
        
                <label>
            <c:out value="Адрес предоставления услуги:"/>
        </label>
        <div class="box">
            <c:out value="${ocherednapodkluchenie.clientservice.addresspreduslugi}"/>
        </div>
        <br/>
        
       <field:display date="true" dateTimePattern="dd-MMM-YYYY" field="datapodkluchenia" id="s_com_mihausik_bil_Ocherednapodkluchenie_datapodkluchenia" object="${ocherednapodkluchenie}" z="eIFGT1k8CtgZvTV/tSB1Fk0EuMQ="/>
        <field:display date="true" dateTimePattern="dd-MMM-YYYY" field="deadlinedate" id="s_com_mihausik_bil_Ocherednapodkluchenie_deadlinedate" object="${ocherednapodkluchenie}" z="zX8t2xAAvy8EEY4HUphT3c6NyV4="/>
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
    </table>
    <a href="/telebil/commentsocheredis?form&id=${ocherednapodkluchenie.id}" >добавить комментарий</a>
    </page:show>
    </body>