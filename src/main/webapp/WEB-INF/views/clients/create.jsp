<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="field" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="form" tagdir="/WEB-INF/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function FillBilling(f) {
	  if(f.billingtoo.checked == true) {
	    f.fizclientname.value = f.clientname.value;
	    f.fizpostindex.value = f.yurpostindex.value;
	    f.fizcity.value = f.yurcity.value;
	    f.fizstreet.value = f.yurstreet.value;
	    f.fizhousenum.value = f.yurhousenum.value;
	    f.fizofficenum.value = f.yurofficenum.value;
	  }
	}
</script>

</head>
<body>
<form:create id="fc_com_mihausik_bil_Client"  label="клиента"  modelAttribute="client" path="/clients" render="${empty dependencies}" z="Uy7nrTg3AMq8TxF7NiD6yTI6WbQ=">
        <field:checkbox field="arkhiv" id="c_com_mihausik_bil_Client_arkhiv" z="bgKqit6iYkLucKTWJ+6c3YBqqAg="/>
        <field:select field="statuslica" id="c_com_mihausik_bil_Client_statuslica" itemValue="id" items="${statuslicas}" path="/statuslicas" z="UuEb5LDbz2cGWOgkeAMYNxfqIvM="/>
   Юридический адрес   :
        <field:input  field="clientname" id="c_com_mihausik_bil_Client_clientname" z="hgN70L8zdSL2tOtG6scAUqJSeQ4="/>
        <field:select field="yurstatus" id="c_com_mihausik_bil_Client_yurstatus" itemValue="id" items="${yurstatuses}" path="/yurstatuses" z="BPsXDK1CWZtZX1U0BNhHwxeq5SM="/>
        <field:input field="yurpostindex" id="c_com_mihausik_bil_Client_yurpostindex" z="i0vAmeSBUDMO955JfIYzmo+iaQo="/>
        <field:input field="yurcity" id="c_com_mihausik_bil_Client_yurcity" z="6fxO3z0C1asaCbDyRBQJH4Gw00M="/>
        <field:input field="yurstreet" id="c_com_mihausik_bil_Client_yurstreet" z="07On8tOxxjOhSERgw8diaNd45Dw="/>
        <field:input field="yurhousenum" id="c_com_mihausik_bil_Client_yurhousenum" z="Cvi4LIN2xPAUfqqNEi+kRvg0+/4="/>
        <field:input field="yurofficenum" id="c_com_mihausik_bil_Client_yurofficenum" z="84HdQj08B09AueNtIzDNL2Qeeks="/>
        <field:input field="yuredrpou" id="c_com_mihausik_bil_Client_yuredrpou" z="IrW7MMh0ghjxUvwDnpXCCZmrYKU="/>
        <field:input field="yurnumbersvidplatnds" id="c_com_mihausik_bil_Client_yurnumbersvidplatnds" z="D64pFXlwpjhDQUxKcF+FdEMWeeM="/>
        <field:input field="yurindividnagkod" id="c_com_mihausik_bil_Client_yurindividnagkod" z="Pw3VE4Ob9h51ahpvoPThl1Nc64Q="/>
        <input type="checkbox" name="billingtoo" onclick="FillBilling(this.form)">
<em>Кликнуть,если адреса одинаковые</em> <br/><br/>
      Фактический адрес:
        
        <field:input field="fizclientname" id="c_com_mihausik_bil_Client_fizclientname" z="4pVmU961olbYPuTsnotHgzvUZhg="/>
        <field:input field="fizpostindex" id="c_com_mihausik_bil_Client_fizpostindex" z="uMu2Du1H0Tv5XzCp0xN96Q86Hco="/>
        <field:input field="fizcity" id="c_com_mihausik_bil_Client_fizcity" z="hCFJ+BkmmdEinGCgtmmvcMFD+14="/>
        <field:input field="fizstreet" id="c_com_mihausik_bil_Client_fizstreet" z="LRLWV5J3LFKp3+c9xnr9BR2i+qk="/>
        <field:input field="fizhousenum" id="c_com_mihausik_bil_Client_fizhousenum" z="UK2NJuMk3rLMaySbGa+Ry7llcRM="/>
        <field:input field="fizofficenum" id="c_com_mihausik_bil_Client_fizofficenum" z="7+Rts2nm1GEV1SyPCBkoNFy+OjQ="/>
       
      Банк.реквизиты:  
        <field:input field="numberraschscheta" id="c_com_mihausik_bil_Client_numberraschscheta" z="Gm7zhnk/DmqYYXT0ziZjBVkxKwI="/>
        <field:input field="mfo" id="c_com_mihausik_bil_Client_mfo" z="fWTwJ/5AdNeV8vYqqIggWT99N1o="/>
        <field:input field="bank" id="c_com_mihausik_bil_Client_bank" z="mWzYDsUlqv4MdsD83FRxBucwUzE="/>

        <field:input field="fiodirector" id="c_com_mihausik_bil_Client_fiodirector" z="cQ8r/SiBL/vMK9lgQJnZpgO3G5Q="/>
        <field:input field="clientweblogin" id="c_com_mihausik_bil_Client_clientweblogin" z="lFt0QdE0V8095zhOxjmXA/1Qd8k="/>
        <field:input field="clientwebpass" id="c_com_mihausik_bil_Client_clientwebpass" z="ecRRG5cqY05njnuczaepa3mktco="/>
        <field:checkbox field="clientwebenable" id="c_com_mihausik_bil_Client_clientwebenable" z="bgKqit6iYkLucKTWJ+6c3YBqqAg="/>
 
        <field:select field="manager" id="c_com_mihausik_bil_Client_manager" itemValue="id" items="${managers}" itemLabel="manname" path="/managers" z="29cn2yqfi7a9oJ9ogAbcaqrAgfI="/>
        <field:select field="supplier" id="c_com_mihausik_bil_Client_supplier" itemValue="id" items="${suppliers}" path="/suppliers" z="aIxIpJ7zgzodpYG3WTpy5ho++k0="/>

    <form:dependency dependencies="${dependencies}" id="d_com_mihausik_bil_Client" render="${not empty dependencies}" z="OCeV77mWH7aA8GQ/Mu/IOP8H/hE="/>
 </form:create>
</body>
</html>