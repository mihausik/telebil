<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="page" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
 <page:show create="false" label="услугу" id="ps_com_mihausik_bil_Clientservice" list="false" object="${clientservice}" path="/clientservices" update="true" z="user-managed">
        <label>Клиент:
        </label>
        <div class="box">
            <c:out value="${clientservice.client.clientname}"/>
        </div>
        <br/>
         <label>Активна ли услуга:</label>
        <div class="box">
        <c:out value="${clientservicestatus.status}"></c:out>
        </div>
        <br/>
        <field:display field="service" id="s_com_mihausik_bil_Clientservice_service" object="${clientservice}" z="ZMx+Lm+OHMOzaLlNWOxzYmVytO4="/>
        <field:display date="true" dateTimePattern="${clientservice_datapodkluchenia_date_format}" field="datapodkluchenia" id="s_com_mihausik_bil_Clientservice_datapodkluchenia" object="${clientservice}" z="kD7oqa88QrjgxP6RmAAehox4nKE="/> 
        <field:display date="true" dateTimePattern="${clientservice_dataotkluchenia_date_format}" field="dataotkluchenia" id="s_com_mihausik_bil_Clientservice_dataotkluchenia" object="${clientservice}" z="2km7Dq02EAAcXs3CDJVb7VL/Txs="/>
        <field:display field="statususlugi" id="s_com_mihausik_bil_Clientservice_statususlugi" object="${clientservice}" z="+UeYGeZQkTRvDVK8QsW/Sg71waI="/>
        <field:display field="client" id="s_com_mihausik_bil_Clientservice_client" object="${clientservice}" render="false" z="user-managed"/>
        <field:display field="balance" id="s_com_mihausik_bil_Clientservice_balance" object="${clientservice}" z="gfiLFOBbXAosSEVlx8eUoN/ULbM="/>
        <field:display field="phonecreditblock" id="s_com_mihausik_bil_Clientservice_phonecreditblock" object="${clientservice}" z="kwysJcS1lccYWX+5Mm9JTdpNSGw="/>
        <field:display field="creditdate" id="s_com_mihausik_bil_Clientservice_creditdate" object="${clientservice}" z="w3nhjsTNazV4wniUxQDPySC775g="/>
        <field:display field="whogavecredit" id="s_com_mihausik_bil_Clientservice_whogavecredit" object="${clientservice}" z="2YWix0xj2w+Wwi2LVI45dxuGI+o="/>
        <field:display field="addresspreduslugi" id="s_com_mihausik_bil_Clientservice_addresspreduslugi" object="${clientservice}" z="0dBazEhP4StVPNVzIqs4wx06orY="/>
        
        <table>
         <tr><th>Адреса предоставления:</th></tr>
         <c:forEach var="clientserviceip"  items="${streets}">
          <tr>
          <td><a href="/telebil/clientservicestreets/${clientserviceip.id}">${clientserviceip.citystreets.street} - ${clientserviceip.housenum}</a></td>
          </tr>
          
      </c:forEach>
        </table>
        <br/>
         
        
        <a href="/telebil/clientservicestreets?form&id=${clientservice.id}">добавить адрес предоставления услуги</a>
        <br/>
         <br/>
        <table>
        <tr><th>Блокирование</th><th>Пересчет</th><th>Ремонт</th><th>Кредит</th></tr>
        <tr>
        <td><a href="/telebil/tempblocks?form&id=${clientservice.id}">Блокировать услугу на период</a></td>
        <td><a href="/telebil/clientservicerecounts?form&id=${clientservice.id}">Пересчет абонки</a></td>
        <td><a href="/telebil/zayavkanaremonts?form&id=${clientservice.id}">Заявка на ремонт</a></td>
        <td><a href="/telebil/clientservicecredits?form&id=${clientservice.id}">Выдать кредит</a></td>
        </tr>
        <tr>
        <td><a href="/telebil/tempblocks?find=ByClientservice&clientservice=${clientservice.id}">Посмотреть блокировки</a></td>
        <td><a href="/telebil/clientservicerecounts?find=ByClientservice&clientservice=${clientservice.id}">Посмотреть результат</a></td>
        </tr>
       </table>
       <br/><br/>
       
       <br/><br/>
    <!--     <field:display field="ip" id="s_com_mihausik_bil_Clientservice_ip" object="${clientservice}" z="9qJl+TRpehSLcKTLZjI/uRmikQA="/>
        <field:display field="mask" id="s_com_mihausik_bil_Clientservice_mask" object="${clientservice}" z="GfFVwLPdtGpZkfWHlJG2lgaHQ7s="/>
        <field:display field="gateway" id="s_com_mihausik_bil_Clientservice_gateway" object="${clientservice}" z="Xv4mU1SLxnGOlezX8ws18N+9S2Y="/> -->
       
         <table>
<caption>Сетевые настройки:</caption>

 <tr>
          <th>IP</th>
          <th>Mask</th>
          <th>Gateway</th>
          <th>MAC</th>
          <th>IP TYPE</th>
 </tr>
          <c:forEach var="clientserviceip"  items="${clientserviceip}">
          <tr>
          <td><a href="/telebil/clientserviceips/${clientserviceip.id}">${clientserviceip.ip}</a></td>
          <td><a href="/telebil/clientserviceips/${clientserviceip.id}">${clientserviceip.mask}</a></td>
          <td><a href="/telebil/clientserviceips/${clientserviceip.id}">${clientserviceip.gateway}</a></td>
          <td><a href="/telebil/clientserviceips/${clientserviceip.id}">${clientserviceip.macaddr}</a></td>
          <td><a href="/telebil/clientserviceips/${clientserviceip.id}">${clientserviceip.iptype}</a></td>
          
          </tr>
          
      </c:forEach>
      </table>
      <br/>
      <a href="/telebil/clientserviceips?form&id=${clientservice.id}">добавить IP</a>
      <br/>
      <br/>
        <field:display field="gatewayswitch" id="s_com_mihausik_bil_Clientservice_gatewayswitch" object="${clientservice}" z="zfDz32zBsYPWf6aj6dY7C/p1nqk="/>
        <field:display field="connectionpoint" id="s_com_mihausik_bil_Clientservice_connectionpoint" object="${clientservice}" z="user-managed"/>
        <field:display field="speed" id="s_com_mihausik_bil_Clientservice_speed" object="${clientservice}" z="user-managed"/>
        <field:display field="vlan" id="s_com_mihausik_bil_Clientservice_vlan" object="${clientservice}" z="p+8yMLKedleJYno7RvVw6syPfws="/>
        <field:display field="connectiontype" id="s_com_mihausik_bil_Clientservice_connectiontype" object="${clientservice}" z="NY6/P/dsjbUWmhanU3Ry/EPYtRE="/>
        <field:display field="tranzop" id="s_com_mihausik_bil_Clientservice_tranzop" object="${clientservice}" z="HllfOdnMWEQh+2ly0tMwTsaou7U="/>
       
        <field:display field="contentType" id="s_com_mihausik_bil_Clientservice_contentType" object="${clientservice}" render="false" z="user-managed"/>
        <field:display field="schemapodk" id="s_com_mihausik_bil_Clientservice_schemapodk" object="${clientservice}" render="false" z="user-managed"/>
        <table>
<caption>Номера телефонов:</caption>

 <tr>
          <th>телефонный номер</th>
          <th>Дата подключкния</th>
 </tr>
          <c:forEach var="clientservicephone"  items="${clientservicephone}">
          <tr>
          <td><a href="/telebil/clientservicephones/${clientservicephone.id}">${clientservicephone.phonenum}</a></td>
          <td><a href="/telebil/clientservicephones/${clientservicephone.id}"><fmt:formatDate type="date" pattern="dd-MMM-YYYY" value="${clientservicephone.datavklucheniya}"/></a></td>
          </tr>
          
      </c:forEach>
      </table>
      <br/>
      <a href="/telebil/clientservicephones?form&id=${clientservice.id}">добавить номер телефона</a>
<br/>
<br/>
      <table>
<caption>SIP accounts:</caption>
 <tr>
          <th>SIP</th>
          <th>Account code</th>
 </tr>
          <c:forEach var="sip"  items="${sips}">
          <tr>
          <td><a href="/telebil/sips/${sip.id}">${sip.callerid}</a></td>
          <td><a href="/telebil/sips/${sip.id}">${sip.accountcode}</a></td>
          </tr>
      </c:forEach>
      </table>
        <br/>
      <a href="/telebil/sips?form&id=${clientservice.id}">добавить SIP аккаунт</a>
      
      <br/>
      <br/>
        <field:display field="callplan" id="s_com_mihausik_bil_Clientservice_callplan" object="${clientservice}" z="cVVaG3Vpx2TYVgibPN0TkzALcL0="/>
           <field:display field="numberofnlinij" id="s_com_mihausik_bil_Clientservice_numberofnlinij" object="${clientservice}" z="qm419IT9KzRmUEf+VCtpuyWINU8="/>
          <field:display field="numberofbnlinij" id="s_com_mihausik_bil_Clientservice_numberofbnlinij" object="${clientservice}" z="Ahe3hm9ZGc1H4gBpQy0gcDJhuCg="/>
       
        
       
     
       
     <!--  <img height="200px" src="${clientservice.id}/image"/>  -->
      
        <a href="/telebil/clients/${clientservice.client.id}">Back</a>
        <br/>
        <br/>
    </page:show>

</body>
</html>