<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
<%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/jquery/jquery-ui.css"/>"/>
    <script src="<c:url value="/resources/jquery/jquery-1.11.3.min.js"/> "></script>
    <script src="<c:url value="/resources/jquery/jquery-ui.min.js" />"></script>
    <script src="<c:url value="/resources/jquery/datepicker-uk.js" /> "></script>

    <script>
        $(function() {
            $( "#_datapodkluchenia_id" ).datepicker({
                showAnim: "fadeIn",
                dateFormat: "dd.mm.yy",
                changeMonth: true,
                changeYear: true,
                beforeShow: function(){
                    $(".ui-datepicker").css('font-size', 11)
                }
            });
        });
        $(function() {
            $( "#_dataotkluchenia_id" ).datepicker({
                showAnim: "fadeIn",
                dateFormat: "dd.mm.yy",
                changeMonth: true,
                changeYear: true,
                beforeShow: function(){
                    $(".ui-datepicker").css('font-size', 11)
                }
            });
        });
    </script>
</head>
<body>
<form:update id="fu_com_mihausik_bil_Clientservice" modelAttribute="clientservice" multipart="true" path="/clientservices/update" versionField="Version" z="user-managed">
        <img height="200px" src="${clientservice.id}/image"/>
        <field:select field="client" id="c_com_mihausik_bil_Clientservice_client" itemLabel="clientname" itemValue="id" items="${clients}" path="/clients" z="user-managed"/>
        <field:input field="balance" id="c_com_mihausik_bil_Clientservice_balance" validationMessageCode="field_invalid_number" z="GTcjSc1Wo6IKNIcZg8KU8QDuESk="/>
        <field:input field="phonecreditblock" id="c_com_mihausik_bil_Clientservice_phonecreditblock" z="Kzjmf+wl9NKSleolPnXqoDj3KBU="/>
        <field:input field="creditdate" id="c_com_mihausik_bil_Clientservice_creditdate" z="user-managed"/>
        <field:input field="whogavecredit" id="c_com_mihausik_bil_Clientservice_whogavecredit" z="user-managed"/>
        <field:checkbox field="statususlugi" id="c_com_mihausik_bil_Clientservice_statususlugi" z="uwGYI82nh4UsHGmSFqeAB8Omt/A="/>
        <field:checkbox field="ismailsent" id="s_com_mihausik_bil_Clientservice_ismailsent" z="user-managed"/>
        <field:select field="service" id="c_com_mihausik_bil_Clientservice_service" itemValue="id" items="${services}" path="/services" z="m3JV6hQST6EQMRTvVq8wvrQoTXQ="/>
        <field:input field="addresspreduslugi" id="c_com_mihausik_bil_Clientservice_addresspreduslugi" required="true" z="user-managed"/>
        <field:input field="ip" id="c_com_mihausik_bil_Clientservice_ip" max="15" render="false" z="user-managed"/>
        <field:input field="mask" id="c_com_mihausik_bil_Clientservice_mask" render="false" z="user-managed"/>
        <field:input field="gateway" id="c_com_mihausik_bil_Clientservice_gateway" render="false" z="user-managed"/>
        <field:input field="gatewayswitch" id="c_com_mihausik_bil_Clientservice_gatewayswitch" z="CusjVw1fpG0dz/w9CpGIpoRp5gM="/>
        <field:input field="connectionpoint" id="c_com_mihausik_bil_Clientservice_connectionpoint" z="user-managed"/>
        <field:input field="speed" id="s_com_mihausik_bil_Clientservice_speed" z="p+8yMLKedleJYno7RvVw6syPfws="/>
        <field:input field="vlan" id="c_com_mihausik_bil_Clientservice_vlan" z="Buoa3p6OxTMioSl5ryvZLSP10kI="/>
        <field:input field="tranzop" id="c_com_mihausik_bil_Clientservice_tranzop" z="L2DPwzm5Bsxac/w+7Ei8upYZDzU="/>
        <field:select field="connectiontype" id="c_com_mihausik_bil_Clientservice_connectiontype" items="${connectiontypes}" path="connectiontypes" z="BEuxn0hJzroZ9knXLD5XbbkmuOM="/>
        <field:input field="phonenum" id="c_com_mihausik_bil_Clientservice_phonenum" render="false" z="E//gE1q4+UWasFeVzQ1eryYJ/os="/>
        <field:file field="schemapodk" id="c_com_mihausik_bil_Clientservice_schemapodk" type="file" z="user-managed"/>
        <field:select field="callplan" id="c_com_mihausik_bil_Clientservice_callplan" itemValue="id" items="${callplans}" path="/callplans" z="llupHqdTHd0y+T0EfrfSVwS9cO4="/>
        <field:input field="numberofnlinij" id="c_com_mihausik_bil_Clientservice_numberofnlinij" validationMessageCode="field_invalid_integer" z="Z21QiRvWVYmVX9m57AVHUwZTdG0="/>
        <field:input field="numberofbnlinij" id="c_com_mihausik_bil_Clientservice_numberofbnlinij" validationMessageCode="field_invalid_integer" z="5zssitnpWeP6+BP/gOAuaq0lJ7I="/>
        <label><c:out value="Дата подключения:"/></label> <sform:input path="datapodkluchenia" id="_datapodkluchenia_id" size="27"/><br><br>
        <label><c:out value="Дата отключения:"/></label> <sform:input  path="dataotkluchenia" id="_dataotkluchenia_id" size="27"/><br><br>
                  </form:update>
</body>
</html>