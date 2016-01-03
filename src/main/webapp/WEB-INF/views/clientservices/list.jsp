<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="table" tagdir="/WEB-INF/tags/form/fields" %>
    <%@ taglib prefix="page" tagdir="/WEB-INF/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
 <page:list id="pl_com_mihausik_bil_Clientservice" items="${clientservices}" z="5CqPyZjHTgLDUg6zi5RLcoQu6kE=">
               <table:table data="${clientservices}"  id="l_com_mihausik_bil_Clientservice" path="/clientservices" update="true" z="92g5mT3ftY10gBCkt+5+2iMl58s=">
            <table:column id="c_com_mihausik_bil_Clientservice_client" property="client.clientname"  z="aog4ru9aCMfqxqyUJEIGm/hw1Y4="/>
            <table:column id="c_com_mihausik_bil_Clientservice_balance" property="balance" z="2P6B1BV7H7ThbGUNjyHliP/rCH8="/>
            <table:column id="c_com_mihausik_bil_Clientservice_service" property="service" z="aVzha03uKsBl91vCQE1kk1+edK4="/>
            <table:column id="c_com_mihausik_bil_Clientservice_addresspreduslugi" property="addresspreduslugi" z="zqWtnnpE4eOyxkwNGxO2RtNfwmA="/>
           
        </table:table>
    </page:list>
</body>
</html>