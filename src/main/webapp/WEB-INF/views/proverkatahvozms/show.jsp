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
<page:show id="ps_com_mihausik_bil_Proverkatahvozm" object="${proverkatahvozm}" path="/proverkatahvozms" z="zhFqiseyOODNr3YLMbBNj/HpvGI=">
        <label>
            <c:out value="Менеджер:"/>
        </label>
        <div class="box">
            <c:out value="${proverkatahvozm.manager.manname}"/>
        </div>
        <br/>
        <field:display field="commentsdir" render="false" id="s_com_mihausik_bil_Proverkatahvozm_commentsdir" object="${proverkatahvozm}" z="7dWkszfiKa8s8q12iWzISqX6dNI="/>
        <field:display field="commentsmanager" render="false" id="s_com_mihausik_bil_Proverkatahvozm_commentsmanager" object="${proverkatahvozm}" z="eH9axWcVeCBfFkPnauevgMA/0zY="/>
        <field:display date="true" dateTimePattern="${proverkatahvozm_datarazmescheniya_date_format}" field="datarazmescheniya" id="s_com_mihausik_bil_Proverkatahvozm_datarazmescheniya" object="${proverkatahvozm}" z="lxEs7p5QWE3/eg/lV8gsQ5BK2i8="/>
        <field:display field="dostupvzdanie" id="s_com_mihausik_bil_Proverkatahvozm_dostupvzdanie" object="${proverkatahvozm}" z="gL7+tcM05xIr8bqQSQZ4A24gWpc="/>
        <field:display field="stoimostpodkluchenia" id="s_com_mihausik_bil_Proverkatahvozm_stoimostpodkluchenia" object="${proverkatahvozm}" z="PtGvn7JFcBQXR3SZBYEevj8exGA="/>
        <field:display field="srokvkluchenia" id="s_com_mihausik_bil_Proverkatahvozm_srokvkluchenia" object="${proverkatahvozm}" z="user-managed"/>
        <field:display field="potencialclient" id="s_com_mihausik_bil_Proverkatahvozm_potencialclient" object="${proverkatahvozm}" z="F3mJglcALyOtS0AY43kPDHNN17Y="/>
         <field:display field="citystreets" id="s_com_mihausik_bil_Proverkatahvozm_citystreets" object="${proverkatahvozm}" z="Q0nXICuMgA1rVVwU/QH7/N8ko24="/>
        <field:display field="addrpodcluchenia" id="s_com_mihausik_bil_Proverkatahvozm_addrpodcluchenia" object="${proverkatahvozm}" z="1gUcosONvw+KcoARgBTzn1kiiV8="/>
        <field:display field="abonplata" id="s_com_mihausik_bil_Proverkatahvozm_abonplata" object="${proverkatahvozm}" z="HS8ffj+a4vuLTDYuUlHOmJD27tE="/>
        <field:display field="trabovaniakkanalu" id="s_com_mihausik_bil_Proverkatahvozm_trabovaniakkanalu" object="${proverkatahvozm}" z="mnDIz4iglTd4MvKIIs8AOcUts+A="/>
        <field:display field="clientcontacts" id="s_com_mihausik_bil_Proverkatahvozm_clientcontacts" object="${proverkatahvozm}" z="nK0lq1+hLBwpox/aYXP2ptpldzQ="/>
        <field:display field="manager" id="s_com_mihausik_bil_Proverkatahvozm_manager" object="${proverkatahvozm}" render="false" z="user-managed"/>
        <field:display field="tvexistence" id="s_com_mihausik_bil_Proverkatahvozm_tvexistence" object="${proverkatahvozm}" z="XeqWuT/kK6lfTw00YAibeJOstds="/>
         <field:display field="provTVstatus" id="s_com_mihausik_bil_Proverkatahvozm_provTVstatus" object="${proverkatahvozm}" z="q/vZZI1IM3V+q32hKr4Qldiz60s="/>
<table>
          <tr>
          <th>Дата</th>
          <th>Сотрудник</th>
          <th>Комментарий</th>
          </tr>
          <c:forEach var="comments" items="${comments}">
          <tr>
          <td>${comments.datacommenta}</td>
          <td>${comments.manager.manname}</td>
          <td>${comments.comment}</td>
          </tr>
      </c:forEach>
    </table>
    
    <a href="/telebil/commentszayavoks?form&id=${proverkatahvozm.id}" >добавить комментарий</a>
    </page:show>
</body>
</html>