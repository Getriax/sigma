<%--
  Created by IntelliJ IDEA.
  User: nikodem
  Date: 02/03/2018
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <img src="/static/img/doc.png">
    <form:form action="/fileup" method="POST" enctype="multipart/form-data">

        Zdjecie główne: <input type="file" name="file"/> <br/>

        <input type="submit" value="dodaj"/>
    </form:form>
</body>
</html>
