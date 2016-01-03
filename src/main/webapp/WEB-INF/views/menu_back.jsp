<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="menu" tagdir="/WEB-INF/tags/menu" %>
    <%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<div  id="menu" >
 <menu:menu id="_menu">
        
        <menu:category id="c_client"  z="TjeLu8x0oS98tSiRzdPNDOc8U+c=">
            <menu:item id="i_client_new" label="клиент" messageCode="global_menu_new" url="/clients?form" z="0rEWYB2Yq6qokJif3zv05zcXpXk="/>
            <menu:item id="i_client_list" messageCode="global_menu_list" url="/clients?page=1&amp&size=${empty param.size ? 50 : param.size}" z="/DxsyzfFyvp93UEW0WcXvtjs4zo="/>
            <menu:item id="fi_client_supplier" label="поставщику" messageCode="global_menu_find" url="/clients?find=BySupplier&amp&form" z="cOXV7ASiOoSgwpg5rukJxliOM58="/>
            <menu:item id="fi_client_service" label="услуге" messageCode="global_menu_find" url="/clients?find=ByService&amp&form" z="cOXV7ASiOoSgwpg5rukJxliOM58="/>
            <menu:item id="fi_client_all" label="клиента" messageCode="global_menu_find_wtpo" url="/clients?find=ByAll&amp&form" z=""/>
        </menu:category>
         <sec:authorize access="hasAnyRole('ROLE_SMANAGER','ROLE_ROOT')">
        <menu:category id="c_service" z="3UA/yekc26BP3BWK8FEsrofMIbE=">
            <menu:item id="i_service_new" label="услуга" messageCode="global_menu_new_service" url="/services?form" z="8z9X6KeQEB+r7FcJ3rgKRJ1p4d4="/>
            <menu:item id="i_service_list" messageCode="global_menu_list" url="/services?page=1&amp&size=${empty param.size ? 50 : param.size}" z="Wxlf7e/ytPbwfz87IeadIy7+ato="/>
        </menu:category>
        </sec:authorize>
                <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_manager" z="drHA8Y4evrida0LSNQCfd7NSkmU=">
            <menu:item id="i_manager_new" label="сотрудник" messageCode="global_menu_new" url="/managers?form" z="pZum6BHDwOKSoWFtDhhnmiITrC8="/>
            <menu:item id="i_manager_list" messageCode="global_menu_list" url="/managers?page=1&amp&size=${empty param.size ? 50 : param.size}" z="3Hpoqqnvi1PrlyYberG7ofcUC9s="/>
        </menu:category>
         </sec:authorize>
           <sec:authorize access="hasAnyRole('ROLE_SMANAGER','ROLE_ROOT')">
        <menu:category id="c_yurstatus" z="cuQe33620X3VumgLmyoBfxrqxFY=">
            <menu:item id="i_yurstatus_new" label="юр. статус" messageCode="global_menu_new" url="/yurstatuses?form" z="1baadgdiOKUqmaerxn45y9hsGUY="/>
            <menu:item id="i_yurstatus_list" messageCode="global_menu_list" url="/yurstatuses?page=1&amp&size=${empty param.size ? 50 : param.size}" z="Pf+iVq2wI8bbS/jW1Go37BJ9jv8="/>
        </menu:category>
        </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_TECH','ROLE_ROOT')">
        <menu:category id="c_commutator" z="wvUVNZPdG9bCGVA5EaJBhG8D1xk=">
            <menu:item id="i_commutator_new" label="коммутатор" messageCode="global_menu_new" url="/commutators?form" z="tpXTpiox+caVLvu7Jkx42rgzcDs="/>
            <menu:item id="i_commutator_list" messageCode="global_menu_list" url="/commutators?page=1&amp&size=${empty param.size ? 50 : param.size}" z="b0VEdyniXzVNu5tyLqOeKNBSIi0="/>
        </menu:category>
        </sec:authorize>
         <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_doljnost" z="TSzg/i98Tky5WrJv/U18lk/HshE=">
            <menu:item id="i_doljnost_new" label="должность" messageCode="global_menu_new_service" url="/doljnosts?form" z="fp3SlzAo2k3K39nmQlEdmpB3fNk="/>
            <menu:item id="i_doljnost_list" messageCode="global_menu_list" url="/doljnosts?page=1&amp&size=${empty param.size ? 50 : param.size}" z="ytRDCyhmYcBlK0bPRDpmG0XavRI="/>
        </menu:category>
         </sec:authorize>
           <sec:authorize access="hasAnyRole('ROLE_SMANAGER','ROLE_ROOT')">
        <menu:category id="c_proverkatahvozm" z="11b1cPcBtTLhxhxprqWr6FmxrKs=">
            <menu:item id="i_proverkatahvozm_new" messageCode="global_menu_new_service" url="/proverkatahvozms?form" z="+VrFNAUFd8jq9IQIy4Vn9NC6FaQ="/>
            <menu:item id="i_proverkatahvozm_list" messageCode="global_menu_list" url="/proverkatahvozms?page=1&amp&size=${empty param.size ? 50 : param.size}" z="ED+gwxPwcVNrE2Zou6bGQr5VDDg="/>
            <menu:item id="fi_proverkatahvozm_manager" messageCode="global_menu_find" url="/proverkatahvozms?find=ByManager&amp&form" z="eV+B2RLzFaUAPveSjJO39eoHPjw="/>
            <menu:item id="fi_proverkatahvozm_tvexistence" messageCode="global_menu_find" url="/proverkatahvozms?find=ByTvexistence&amp&form" z="sNtOsYQhd3M7JMzdTr9/mJnOwMw="/>
             <menu:item id="fi_proverkatahvozm_addrpodcluchenialike" messageCode="global_menu_find" url="/proverkatahvozms?find=ByAddrpodclucheniaLike&amp&form" z="user-managed"/>
        </menu:category>
        </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_SMANAGER','ROLE_ROOT')">
        <menu:category id="c_ocherednapodkluchenie" z="S5ZgI7getkn0m3HynU+AQcboyeY=">
           <menu:item id="i_ocherednapodkluchenie_list" messageCode="global_menu_arhiv" url="/ocherednapodkluchenies/arhiv" z="user-managed"/>
            <menu:item id="i_ocherednapodkluchenie_list" messageCode="global_menu_list" url="/ocherednapodkluchenies?page=1&amp&size=${empty param.size ? 50 : param.size}" z="user-managed"/>
        </menu:category>
        </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_BUH')">
        <menu:category id="c_schet" z="18iGX3X1dYh+R4+NruCFqQpZQjE=">
            <menu:item id="i_schet_new" messageCode="global_menu_new" label="счет" url="/schets?form" z="X647xVkect0BMrEpX6womF4jv9s="/>
            <menu:item id="i_schet_list" messageCode="global_menu_list" url="/schets?page=1&amp&size=${empty param.size ? 50 : param.size}" z="7nVVNsnxdRexPWhmVrqyJI91F4o="/>
        </menu:category>
        </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_sip" z="iGh4o51tNu7jJ9CA0qOeBVjBEAM=">
            <menu:item id="i_sip_new" messageCode="global_menu_new" url="/sips?form" z="KhLqbL/9Iu6QX1aDv7sFb051Eec="/>
            <menu:item id="i_sip_list" messageCode="global_menu_list" url="/sips?page=1&amp&size=${empty param.size ? 50 : param.size}" z="1hvo4MuXvP7GZ/5fSZlkHvc035Y="/>
        </menu:category>
        </sec:authorize>
         <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_cdr" z="WUyjAYTy/jyYv4BPfB3tK3te8Yg=">
            <menu:item id="i_cdr_list" messageCode="global_menu_list" url="/cdrs?page=1&amp&size=${empty param.size ? 50 : param.size}" z="ScFv7hiS2pBdz72eV/YfIm5lp9k="/>
        </menu:category>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_callplan" z="uOItuhHKw0KTLUF7EaogF53VHSo=">
            <menu:item id="i_callplan_new" messageCode="global_menu_new" url="/callplans?form" z="wGa5WL51p+MwzG7ktn0xUFi82Rc="/>
            <menu:item id="i_callplan_list" messageCode="global_menu_list" url="/callplans?page=1&amp&size=${empty param.size ? 50 : param.size}" z="RpLYjJ0rMC6YrS181knww6IDJAU="/>
        </menu:category>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_rate" z="EsRwQbqCssSADhJWlrPP1VRQdS0=">
            <menu:item id="i_rate_new" messageCode="global_menu_new" url="/rates?form" z="31DRrjGNhP9sbmVwSvbosF0qKz4="/>
            <menu:item id="i_rate_list" messageCode="global_menu_list" url="/rates?page=1&amp&size=${empty param.size ? 50 : param.size}" z="tyWjdI6KiGRR7Xn3jjqQaBLIhoY="/>
        </menu:category>
        </sec:authorize>
        <menu:category id="c_dogovora" z="JI0LnBgWaF5YbjWTPk9Au6CO60A=">
            <menu:item id="i_dogovora_new" label="договор" messageCode="global_menu_new" url="/dogovoras?form" z="uus4wsYjMLyaSVqWK7y+nlvBNzY="/>
            <menu:item id="i_dogovora_list" messageCode="global_menu_list" url="/dogovoras?page=1&amp;size=${empty param.size ? 10 : param.size}" z="P6CZtJx3Xp6nXRUI6+Ba6g2dJGk="/>
        </menu:category>
        <sec:authorize access="hasAnyRole('ROLE_ROOT')">
        <menu:category id="c_wish" z="NX/+3ioibBDsC/ntTQwT9EP49Vs=">
            <menu:item id="i_wish_new" messageCode="global_menu_new" url="/wishes?form" z="DLYucays1rXfIMhz6BTrZweu1Ek="/>
            <menu:item id="i_wish_list" messageCode="global_menu_list" url="/wishes?page=1&amp;size=${empty param.size ? 50 : param.size}" z="Iqe+26bW7RzCWSg8pXfTmUkC2S4="/>
        </menu:category>
        </sec:authorize>
        
    </menu:menu>
    </div>
</body>
</html>