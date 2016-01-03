
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set target="${pageContext.response}" property="contentType" value="text/html; charset=UTF-8"/>
<c:set target="${pageContext.request}" property="characterEncoding" value="UTF-8"/> 

   <form   action="ByClientnameLike&form" method="get">
        <input type="text" name="clientname" value="" />
        <input id="proceed" type="submit" value=""/>
    </form>