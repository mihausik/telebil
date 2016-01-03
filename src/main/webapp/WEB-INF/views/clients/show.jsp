<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="page" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<page:show id="ps_com_mihausik_bil_Client" object="${client}" path="/clients" z="gtoJJ3+vr/HEQ5QAcU+d3QNxFic=">
 <field:display field="supplier" id="s_com_mihausik_bil_Client_supplier" object="${client}" z="7Scg6OisIeRhqYzcmAdMWkSdlwM="/>
        <label>Менеджер:</label>
        <c:out value="${client.manager.manname}"/>
        <br/>
<br/>
<field:display field="clientwebenable" id="s_com_mihausik_bil_Client_clientwebenable" object="${client}" z="cDRMojTyZ9Rr03HPIxYMEP0Mjrg="/>
<field:display field="clientweblogin" id="s_com_mihausik_bil_Client_clientweblogin" object="${client}" z="Qk4FfyqGH4rhIq8qpwlCPKK/kGk="/>
        <field:display field="clientwebpass" id="s_com_mihausik_bil_Client_clientwebpass" object="${client}" z="xCNOczP77n73nCOHnipYqMjgRT4="/>
        <field:display field="arkhiv" id="s_com_mihausik_bil_Client_arkhiv" object="${client}" z="bgKqit6iYkLucKTWJ+6c3YBqqAg="/>
<table>
<caption>Номера договоров:</caption>

 <tr>
          <th><center>номер договора</center></th>
          <th><center>дата заключения</center></th>
          
         
          </tr>
          <c:forEach var="clientnumdog"  items="${clientnumdog}">
          <tr>
          <td><center><a href="/telebil/clientnumdogs/${clientnumdog.id}">${clientnumdog.nomerdogovora}</a></center></td>
          <td><center><fmt:formatDate type="date" pattern="dd-MMM-YYYY" value="${clientnumdog.datazaklucheniya}"/></center></td>
         
          </tr>
          
      </c:forEach>
      </table>
 <br/>
<a href="/telebil/clientnumdogs?form&id=${client.id}" >добавить номер договора</a>
       <br/>
       <br/>
       <table>
<caption>Комментарии:</caption>

 <tr>
          <th><center>коммент</center></th>
 </tr>
          <c:forEach var="clientcomments"  items="${clientcomments}">
          <tr>
          <td><center><a href="/telebil/clientcomments/${clientcomments.id}">${clientcomments.comment}</a></center></td>
         
          </tr>
          
      </c:forEach>
      </table>
 <br/>
       <a href="/telebil/clientcomments?form&id=${client.id}" >добавить комментарий</a>
<br/>
       <br/>
<field:display field="statuslica" id="s_com_mihausik_bil_Client_statuslica" object="${client}" z="lJy/ady3inYBnpGOni1mxMyTmwE="/>
<label>Юридический адрес:</label>
<br/>
<br/>
<field:display field="clientname" id="s_com_mihausik_bil_Client_clientname" object="${client}" z="khYbi5EW2G1MAlWn6cMmpvVh9Lw="/>
 <field:display field="yurstatus" id="s_com_mihausik_bil_Client_yurstatus" object="${client}" z="eej+hPQMq9xUfm44LHcq7kkoSQs="/>
        <field:display field="yurpostindex" id="s_com_mihausik_bil_Client_yurpostindex" object="${client}" z="jMj/7NpDv/rm7hLdvsAPLENTvMI="/>
        <field:display field="yurcity" id="s_com_mihausik_bil_Client_yurcity" object="${client}" z="vU+nZNt2aYpCLtarm3/Tqvtk774="/>
        <field:display field="yurstreet" id="s_com_mihausik_bil_Client_yurstreet" object="${client}" z="gOaSMC4Qg8crxToWocMvUJzu13c="/>
        <field:display field="yurhousenum" id="s_com_mihausik_bil_Client_yurhousenum" object="${client}" z="pbvh2WAdyv2dzId7rG23dmX37Ow="/>
        <field:display field="yurofficenum" id="s_com_mihausik_bil_Client_yurofficenum" object="${client}" z="/U6WO/Jeel7zPo38xLrGiQdu+5s="/>
        <field:display field="yuredrpou" id="s_com_mihausik_bil_Client_yuredrpou" object="${client}" z="OGWz0F4vqj6qlDJa9wKSAR4z1WI="/>
        <field:display field="yurnumbersvidplatnds" id="s_com_mihausik_bil_Client_yurnumbersvidplatnds" object="${client}" z="hc7rCdnrkFXm7tSBsHYyUyCO5zA="/>
        <field:display field="yurindividnagkod" id="s_com_mihausik_bil_Client_yurindividnagkod" object="${client}" z="rerJACp1iVL2QEEcHIEEuhOPrIg="/>
<label>Фактический адрес:</label> 
<br/>
<br/>
   <field:display field="fizclientname" id="s_com_mihausik_bil_Client_fizclientname" object="${client}" z="3rKK8mOXnhFOMOGcntBLLnm7bco="/>      
<field:display field="fizpostindex" id="s_com_mihausik_bil_Client_fizpostindex" object="${client}" z="6LovWFE9X/Rqhzec7lw/xTt9VG4="/>
<field:display field="fizcity" id="s_com_mihausik_bil_Client_fizcity" object="${client}" z="K942LeivZgRjkteiX2w0KP35AiA="/>
        <field:display field="fizstreet" id="s_com_mihausik_bil_Client_fizstreet" object="${client}" z="9F6O2faRggyxMfVKB7+QFijaXHQ="/>
        <field:display field="fizhousenum" id="s_com_mihausik_bil_Client_fizhousenum" object="${client}" z="s8QUHBzddRR6y6CAKYb5QP+8omY="/>
        <field:display field="fizofficenum" id="s_com_mihausik_bil_Client_fizofficenum" object="${client}" z="41ROa4yuCG+hycUyyD95wP9yhIs="/>
        <label>Банк реквизиты:</label>
       <br/>
<br/>
        <field:display field="numberraschscheta" id="s_com_mihausik_bil_Client_numberraschscheta" object="${client}" z="iqXyk7wCWRaLgPOvfR4BrtZeXtE="/>
        <field:display field="mfo" id="s_com_mihausik_bil_Client_mfo" object="${client}" z="nMylxTGy7AUEutqWRb6g5pPkEsI="/>
    <field:display field="bank" id="s_com_mihausik_bil_Client_bank" object="${client}" z="oFJJ1uKMwTXg/KasowU6xB1C5Xk="/>
<field:display field="fiodirector" id="s_com_mihausik_bil_Client_fiodirector" object="${client}" z="q0s1FrLSLP65LAT68UCvNJfuaPI="/>
<table>
<caption>Контакты:</caption>
          <tr>
          <th colspan="4"><center>по общим вопросам</center></th>
          </tr>
          <c:forEach var="clientdatagen"  items="${clientdatagen}">
          <tr>
          <td><center>${clientdatagen.doljnost}</center></td>
          <td><center>${clientdatagen.fio}</center></td>
          <td><center>${clientdatagen.contactname.contact}</center></td>
          <td><center><a href="/telebil/clientdatas/${clientdatagen.id}" >${clientdatagen.contact}</a></center></td>
          </tr>
      </c:forEach>
       <tr>
          <th colspan="4"><center>по техническим вопросам</center></th>
          </tr>
          <c:forEach var="clientdatateh"  items="${clientdatateh}">
          <tr>
          <td><center>${clientdatateh.doljnost}</center></td>
          <td><center>${clientdatateh.fio}</center></td>
          <td><center>${clientdatateh.contactname.contact}</center></td>
          <td><center><a href="/telebil/clientdatas/${clientdatateh.id}" >${clientdatateh.contact}</a></center></td>
          </tr>
      </c:forEach>
       <tr>
          <th colspan="4"><center>по финансовым вопросам</center></th>
          </tr>
          <c:forEach var="clientdatafin"  items="${clientdatafin}">
          <tr>
          <td><center>${clientdatafin.doljnost}</center></td>
          <td><center>${clientdatafin.fio}</center></td>
          <td><center>${clientdatafin.contactname.contact}</center></td>
          <td><center><a href="/telebil/clientdatas/${clientdatafin.id}" >${clientdatafin.contact}</a></center></td>
          </tr>
      </c:forEach>
    </table>
    <a href="/telebil/clientdatas?form&id=${client.id}" >добавить контакт</a>
       <br/>
       <br/>
       <table>
             <tr>
          <th colspan="4"><center>для уведомлений</center></th>
            </tr>
           <tr>
          <th><center>тип уведомления</center></th>
          <th><center>контактные данные</center></th>
          <th><center>порог для уведомлений(грн)</center></th>
         <th><center>услуга</center></th>
          </tr>
          <c:forEach var="clientnotif"  items="${clientnotif}">
          <tr>
          <td><center><a href="/telebil/clientnotifications/${clientnotif.id}" >${clientnotif.notiftype}</a></center></td>
          <td><center><a href="/telebil/clientnotifications/${clientnotif.id}" >${clientnotif.contact}</a></center></td>
          <td><center><a href="/telebil/clientnotifications/${clientnotif.id}" >${clientnotif.notificationsum}</a></center></td>
          <td><center><a href="/telebil/clientnotifications/${clientnotif.id}" >${clientnotif.clientservice.service.name}</a></center></td>
        
        
          </tr>
      </c:forEach>
    </table>
    <a href="/telebil/clientnotifications?form&id=${client.id}" >добавить контакт</a>
       <br/>
       <br/>
<table>

<caption>Услуги:</caption>
          <tr>
          <th><center>Услуга</center></th>
          <th><center>Адреса предоставления услуг</center></th>
          <th>Баланс(грн)</th>
          <th>Абонплата</th>
          
          <th></th>
          <th>Платежи</th>
          <th>Поиск по дате</th>
          </tr>
       <c:forEach var="services" items="${services}">
          <tr>
          <td><center><a href="/telebil/clientservices/${services.id}" >${services.service.name}</a></center></td>
          <td><center>${services.addresspreduslugi}</center></td>
          <td><center>${services.balance}</center></td>
          <td><center>${services.service.price}</center></td>
          
          <td><a href="/telebil/payments?fromc&id=${services.id}" ><img alt="+" src="/telebil/resources/images/payment.png"></a></td>
          <td><center><a href="/telebil/payments?find=ByClientservice&clientservice=${services.id}" ><img alt="+" src="/telebil/resources/images/show.png"></a></center></td>
          <td><center><a href="/telebil/csbalancedates?find=ByDateBetweenAndClientservice&form&id=${services.id}" ><img alt="+" src="/telebil/resources/images/show.png"></a></center></td>
          </tr>
      </c:forEach>
      <tr>
      <th>Общий баланс</th>
      <th></th>
      <th><center>${cbalance} грн</center></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      </tr>
    </table>
    <a href="/telebil/clientservices?form&id=${client.id}" >добавить услугу</a>
       <br/>
       <br/>
      
       <span style="color:red;">
       Внимание!!!<br/>
       Перед оформлением заявки на подключение клиента убедитесь,что Вы добавили ему услуги.<br/>
       В противном случае заявка создана не будет.</span>
       <br/>
<a href="/telebil/ocherednapodkluchenies?form&id=${client.id}" >оформить заявку на подключение</a>
<br/>
<br/>
<a href="/telebil/clients?find=BySupplier&supplier=${client.supplier.id}">назад</a>
    </page:show>
</body>
</html>