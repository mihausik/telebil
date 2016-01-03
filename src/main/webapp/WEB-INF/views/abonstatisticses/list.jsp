<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

function setVisibility(b_id,id) {

if(document.getElementById(b_id).value=='Скрыть доп. инфо'){

document.getElementById(b_id).value = 'Показать доп. инфо';

document.getElementById(id).style.display = 'none';

}else{

document.getElementById(b_id).value = 'Скрыть доп. инфо';

document.getElementById(id).style.display = 'inline';

}

}
</script>
<table>
<caption>
Период: ${period}
</caption>
<tr>
<th>Компания</th>
<th>Подключено услуг</th>
</tr>
<tr>
<c:forEach var="clientservice"  items="${countpodkl}">
<tr>
<td>${clientservice[0].supplier.name}</td>
<td>${clientservice[1]}</td>
</tr>
</c:forEach>
</table>
<div  id="hidtable" style="display:none">
<table>
<tr>
<th>Компания</th>
<th>Клиент</th>
<th>Подключенная услуга</th>
</tr>
<c:forEach var="service"  items="${servicepodkl}">
<tr>
<td>${service[1].supplier.name}</td>
<td><a href="/telebil/clients/${service[1].id}">${service[1].clientname}</a></td>
<td><a href="/telebil/clientservices/${service[2]}">${service[0].name}</a></td>
</tr>
</c:forEach>
</table>
</div>
<br/>
<input type="button" id=b1 value='Показать доп. инфо' onclick="setVisibility('b1','hidtable')">
<br/>
<table>
<tr>
<th>Компания</th>
<th>Отключено услуг</th>
</tr>
<tr>
<c:forEach var="clientservice"  items="${countotkl}">
<tr>
<td>${clientservice[0].supplier.name}</td>
<td>${clientservice[1]}</td>
</tr>
</c:forEach>
</tr>
</table>
<div id="hidtable2" style="display:none">
<table>
<tr>
<th>Компания</th>
<th>Клиент</th>
<th>Отключенная услуга</th>
</tr>
<c:forEach var="service"  items="${serviceotkl}">
<tr>
<td>${service[1].supplier.name}</td>
<td><a href="/telebil/clients/${service[1].id}">${service[1].clientname}</a></td>
<td><a href="/telebil/clientservices/${service[2]}">${service[0].name}</a></td>
</tr>
</c:forEach>
</table>
</div>
<br/>
<input type="button" id=b2 value='Показать доп. инфо' onclick="setVisibility('b2','hidtable2')">
<br/>

