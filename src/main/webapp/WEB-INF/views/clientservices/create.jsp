<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form:create id="fc_com_mihausik_bil_Clientservice" modelAttribute="clientservice" multipart="true" path="/clientservices" render="${empty dependencies}" z="user-managed">
        <div id="c_com_mihausik_bil_Clientservice_client">
<label><c:out value="Клиент:"></c:out></label><input type="hidden" name="client" value="${clients.id}"/>  
<c:out value="${clients.clientname}"  ></c:out>
</div>
<br>
        
        <field:input field="balance" id="c_com_mihausik_bil_Clientservice_balance" validationMessageCode="field_invalid_number" z="GTcjSc1Wo6IKNIcZg8KU8QDuESk="/>
        <field:input field="phonecreditblock"  id="c_com_mihausik_bil_Clientservice_phonecreditblock" z="h/EjwcRNcvDtJZXBAgHZPzt5Ipo="/>
         <field:checkbox field="statususlugi" id="c_com_mihausik_bil_Clientservice_statususlugi" z="uwGYI82nh4UsHGmSFqeAB8Omt/A="/>
         <field:checkbox field="ismailsent" id="s_com_mihausik_bil_Clientservice_ismailsent"  z="svMUYUAXpsvVMdkAp9ibVmE1PoQ="/>
        <field:select field="service" id="c_com_mihausik_bil_Clientservice_service" itemValue="id" items="${services}" path="/services" z="m3JV6hQST6EQMRTvVq8wvrQoTXQ="/>
        <field:input field="addresspreduslugi" required="true" id="c_com_mihausik_bil_Clientservice_addresspreduslugi" z="+x6Ko4O79cinVMyOossYWCR4etg="/>
        <field:input field="ip" render="false" id="c_com_mihausik_bil_Clientservice_ip" max="15" z="L9jrEpmNDWanGpGPjbAn8nv9TqU="/>
       <field:input field="mask" render="false" id="c_com_mihausik_bil_Clientservice_mask" z="0ai/iX5oSpmk5Db8wYFSJ4QF6o0="/>
        <field:input field="gateway" render="false" id="c_com_mihausik_bil_Clientservice_gateway" z="U1z1TuxWsdAfDC94ZUeXd2PDaVQ="/>
        <field:input field="gatewayswitch" id="c_com_mihausik_bil_Clientservice_gatewayswitch" z="CusjVw1fpG0dz/w9CpGIpoRp5gM="/>
          <field:input field="speed" id="s_com_mihausik_bil_Clientservice_speed"  z="p+8yMLKedleJYno7RvVw6syPfws="/>
               <field:input field="vlan" id="c_com_mihausik_bil_Clientservice_vlan" z="Buoa3p6OxTMioSl5ryvZLSP10kI="/>
               <field:input field="tranzop" id="c_com_mihausik_bil_Clientservice_tranzop" z="L2DPwzm5Bsxac/w+7Ei8upYZDzU="/>
               <field:select field="connectiontype" id="c_com_mihausik_bil_Clientservice_connectiontype" items="${connectiontypes}" path="connectiontypes" z="BEuxn0hJzroZ9knXLD5XbbkmuOM="/>
        <field:input field="phonenum" id="c_com_mihausik_bil_Clientservice_phonenum"  render="false" z="E//gE1q4+UWasFeVzQ1eryYJ/os="/>
        <field:input field="schemapodk" id="c_com_mihausik_bil_Clientservice_schemapodk" type="file" z="user-managed"/>
        <field:input field="contentType" id="c_com_mihausik_bil_Clientservice_contentType" render="false" z="user-managed"/>
        <field:select field="callplan" id="c_com_mihausik_bil_Clientservice_callplan" itemValue="id" items="${callplans}" path="/callplans" z="llupHqdTHd0y+T0EfrfSVwS9cO4="/>
                      <field:input field="numberofnlinij"  id="c_com_mihausik_bil_Clientservice_numberofnlinij" validationMessageCode="field_invalid_integer" z="Z21QiRvWVYmVX9m57AVHUwZTdG0="/>
       <field:input field="numberofbnlinij" id="c_com_mihausik_bil_Clientservice_numberofbnlinij" validationMessageCode="field_invalid_integer" z="5zssitnpWeP6+BP/gOAuaq0lJ7I="/>
        <field:datetime dateTimePattern="${clientservice_datapodkluchenia_date_format}" field="datapodkluchenia" id="c_com_mihausik_bil_Clientservice_datapodkluchenia" z="1Rt2HkiRkiYHdTgZjpliOBswN6w="/>
    </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Clientservice" render="${not empty dependencies}" z="Kfik6juX/4jPKUD2WUmRtMYREqc="/>
</html>