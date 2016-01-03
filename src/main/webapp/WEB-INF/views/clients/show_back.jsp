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
<page:show id="ps_com_mihausik_bil_Client" object="${client}" path="/clients" z="gtoJJ3+vr/HEQ5QAcU+d3QNxFic=">
<field:display field="nomerdogovora" id="s_com_mihausik_bil_Client_nomerdogovora" object="${client}" z="s1a2uUuSqVdGoqxzXAFGyUj5R9k="/>
<field:display field="nomerdogovora2" id="s_com_mihausik_bil_Client_nomerdogovora2" object="${client}" z="b34ucZqmL5B+n0kobz5RWZrs5Ng="/>
<field:display field="nomerdogovora3" id="s_com_mihausik_bil_Client_nomerdogovora3" object="${client}" z="HW+xkTV1fqfRdIZWXYS68FONrF8="/>
<field:display field="nomerdogovora4" id="s_com_mihausik_bil_Client_nomerdogovora4" object="${client}" z="nGllktYW9bcYOUK4dKobfY5Cuyw="/>
<field:display field="nomerdogovora5" id="s_com_mihausik_bil_Client_nomerdogovora5" object="${client}" z="5q3MU8jRHox5Xzr9R/81dXEMlkk="/>
<field:display date="true" dateTimePattern="${client_datazakldog_date_format}" field="datazakldog" id="s_com_mihausik_bil_Client_datazakldog" object="${client}" z="wXQnc3roTxNbjqV0FRq73XKeIgg="/>
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
<label>Контакты:</label>
<br/>
<br/>
<field:display field="fiodirector" id="s_com_mihausik_bil_Client_fiodirector" object="${client}" z="q0s1FrLSLP65LAT68UCvNJfuaPI="/>
 <field:display field="fiofinancecontact" id="s_com_mihausik_bil_Client_fiofinancecontact" object="${client}" z="r9tDUbfgT1JdfZNb5Hv9EhMGYZ4="/>
<field:display field="doljnostfinancecontact" id="s_com_mihausik_bil_Client_doljnostfinancecontact" object="${client}" z="/oCKc808BtSiz4lW0zuEWK5eoiE="/>
 <field:display field="emailfinancecontact" id="s_com_mihausik_bil_Client_emailfinancecontact" object="${client}" z="2FaecmNmKNlrkFSbNml+dy/kQaY="/>
        <field:display field="phonefinancecontact" id="s_com_mihausik_bil_Client_phonefinancecontact" object="${client}" z="HNDDZm6rLc0ODv8h6lnJkHHODvE="/>
     
   <field:display field="fioobwijcontact" id="s_com_mihausik_bil_Client_fioobwijcontact" object="${client}" z="e3Vbpv0yziCx507m469/vkEMBiE="/>
        <field:display field="doljnostobwijcontact" id="s_com_mihausik_bil_Client_doljnostobwijcontact" object="${client}" z="ptfCmJkTarcEHQLquRycbDZ0K/o="/>
     <field:display field="phoneobwijcontact" id="s_com_mihausik_bil_Client_phoneobwijcontact" object="${client}" z="N82jHX93PQH/mjfoUCA4o2BnYxM="/>
        <field:display field="emailobwijcontact" id="s_com_mihausik_bil_Client_emailobwijcontact" object="${client}" z="Sa6ulLFpHpxe4CmmL1z1iNCA5DA="/>
        
 <field:display field="fiotehcontact" id="s_com_mihausik_bil_Client_fiotehcontact" object="${client}" z="hJ3b2Q8HeFDxdpV/oUvwcLbyq6o="/>
 <field:display field="emailtechcontact" id="s_com_mihausik_bil_Client_emailtechcontact" object="${client}" z="QJazK4LWUfMRqeeT56PoBq6gS60="/>
        <field:display field="phonetechcontact" id="s_com_mihausik_bil_Client_phonetechcontact" object="${client}" z="xrchAS34IqHJBBALFF7ClpdDh1U="/>
     
        <field:display field="supplier" id="s_com_mihausik_bil_Client_supplier" object="${client}" z="7Scg6OisIeRhqYzcmAdMWkSdlwM="/>
        <label>Менеджер:</label>
        <c:out value="${client.manager.manname}"/>
        <br/>
<br/>
<table>
          <tr>
          <th>Услуга</th>
          <th>Адреса предоставления услуг</th>
          <th>Баланс(грн)</th>
          </tr>
          <c:forEach var="services" items="${services}">
          <tr>
          <td>${services.service.name}</td>
          <td>${services.addresspreduslugi}</td>
          <td>${services.balance}</td>
          </tr>
      </c:forEach>
      <tr>
      <th>Общий баланс</th>
      <th></th>
      <th>${cbalance} грн</th>
      </tr>
    </table>
    
   
<br/>

<table>
<caption>Контакты:</caption>
          <tr>
          <th colspan="4">по общим вопросам</th>
          </tr>
          <c:forEach var="clientdatagen"  items="${clientdatagen}">
          <tr>
          <td>${clientdatagen.doljnost}</td>
          <td>${clientdatagen.fio}</td>
          <td>${clientdatagen.contactname.contact}</td>
          <td>${clientdatagen.contact}</td>
          </tr>
      </c:forEach>
       <tr>
          <th colspan="4">по техническим вопросам</th>
          </tr>
          <c:forEach var="clientdatateh"  items="${clientdatateh}">
          <tr>
          <td>${clientdatateh.doljnost}</td>
          <td>${clientdatateh.fio}</td>
          <td>${clientdatateh.contactname.contact}</td>
          <td>${clientdatateh.contact}</td>
          </tr>
      </c:forEach>
       <tr>
          <th colspan="4">по финансовым вопросам</th>
          </tr>
          <c:forEach var="clientdatafin"  items="${clientdatafin}">
          <tr>
          <td>${clientdatafin.doljnost}</td>
          <td>${clientdatafin.fio}</td>
          <td>${clientdatafin.contactname.contact}</td>
          <td>${clientdatafin.contact}</td>
          </tr>
      </c:forEach>
    </table>
    <a href="/telebil/clientdatas?form&id=${client.id}" >добавить контакт</a>
    </page:show>
</body>
</html>