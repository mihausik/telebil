<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<body>
<form:create id="fc_com_mihausik_bil_Sip" modelAttribute="sip" path="/sips" render="${empty dependencies}" z="6Zta57typ9n67Wezsj/XJCJQLBk=">
        <field:input field="callerid" id="c_com_mihausik_bil_Sip_callerid" z="2lp6J59hVcmMKM3YKRVpWxsYSPg="/>
        <field:input field="callgroup" id="c_com_mihausik_bil_Sip_callgroup" z="+YxkfEKoWOBCD/HKU+XNEdMtbJo="/>
        <field:input field="context" id="c_com_mihausik_bil_Sip_context" z="3eoX7aPWJ1JZhnUrE1uhyRp7EjI="/>
        <field:input field="defaultuser" id="c_com_mihausik_bil_Sip_defaultuser" z="oIrqJz6Dr0mp0MyvwEDlQSXIddA="/>
        <field:input field="deny" id="c_com_mihausik_bil_Sip_deny" z="bvxJ5jID9ZnNG5c/pWaTUKuQ4Ek="/>
        <field:input field="dtmfmode" id="c_com_mihausik_bil_Sip_dtmfmode" z="wPI2vooxYza46euEqFVNSL0fMhM="/>
        <field:input field="fullcontact" id="c_com_mihausik_bil_Sip_fullcontact" z="7PsCwyhiU0jWaElQjLa8SWHX0M8="/>
        <field:input field="host" id="c_com_mihausik_bil_Sip_host" z="f5gD3GQSe6rA6engE3NUI6v3gzY="/>
        <field:input field="insecure" id="c_com_mihausik_bil_Sip_insecure" z="WthOUrvNVAlGs6ql3wPkW8c44AQ="/>
        <field:input field="ipaddr" id="c_com_mihausik_bil_Sip_ipaddr" z="6F+bKrSn4BwMS+P1EqN75+bw21Q="/>
        <field:input field="lastms" id="c_com_mihausik_bil_Sip_lastms" z="w6ptVUoW5ZAmxmuY83e2JCd+m2Y="/>
        <field:input field="name" id="c_com_mihausik_bil_Sip_name" z="Oh24Oasis6v6RC2kNVm6VkUQqHc="/>
        <field:input field="nat" id="c_com_mihausik_bil_Sip_nat" z="1ludKOSAT/K/ww76u94nX9R3OG0="/>
        <field:input field="permit" id="c_com_mihausik_bil_Sip_permit" z="Q8p3PGkveW70b9uuXjhH8CmzN2w="/>
        <field:input field="pickupgroup" id="c_com_mihausik_bil_Sip_pickupgroup" z="DH8eHVSaQl/UugDhg2D8KIGvlGQ="/>
        <field:input field="port" id="c_com_mihausik_bil_Sip_port" z="dr77WSupmjx7dJCf7wN3fpOoJDY="/>
        <field:input field="qualify" id="c_com_mihausik_bil_Sip_qualify" z="7/miD2b88+ct05M2fy7ykw8CKds="/>
        <field:input field="regseconds" id="c_com_mihausik_bil_Sip_regseconds" z="cV20EJ3UjCIcJORTBYPdSU2h/xc="/>
        <field:input field="regserver" id="c_com_mihausik_bil_Sip_regserver" z="jcVye679OX4s0IZeBOHiTvAZQU4="/>
        <field:input field="secret" id="c_com_mihausik_bil_Sip_secret" z="D8JiPszYzZnh8UhrcUpTE4wjeS0="/>
        <field:input field="trunk" id="c_com_mihausik_bil_Sip_trunk" z="KOID3f0cloQ7MB/RE2G9RGzLfaU="/>
        <field:input field="type" id="c_com_mihausik_bil_Sip_type" z="1+KryRoq9aQxhvr6YBMbG98tnks="/>
        <field:input field="useragent" id="c_com_mihausik_bil_Sip_useragent" z="ao9XZVCiIR5pGSX2IRax5P9LmuI="/>
        <field:input field="username" id="c_com_mihausik_bil_Sip_username" z="RWvyTDbXi33ClhrU5fdOsviCKAc="/>
        <field:input field="callbackextension" id="c_com_mihausik_bil_Sip_callbackextension" z="p3GCfs339Kly4Ee7KnOZi+KS9wI="/>
        <field:input field="accountcode" id="c_com_mihausik_bil_Sip_accountcode" z="BrTfJydW7YIlPIvuDGDTtz8J2mo="/>
  <div id="_c_com_mihausik_bil_Sip_clientservice_id">
<label><c:out value="Услуга:"></c:out></label>
<select name="clientservice" id="_clientservice_id" class="dijitReset.dijitInputInner">
        <option value="${clientservices.id}">${clientservices.service.name}  |  ${clientservices.addresspreduslugi}</option>
      </select>
      </div>
       <script type="text/javascript">
       Spring.addDecoration(new Spring.ElementDecoration({elementId : '_clientservice_id', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}}));   
       </script>
      <br>
      </form:create>
    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Sip" render="${not empty dependencies}" z="78V756n1Y+yFE2TGMx/iYsY1feg="/>
</body>
</html>