<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("currentYear", java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)); %>

<head>

    <meta charset="utf-8">
    <title>Rent a car Šikalo - Vozila</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700&amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

<sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url = "jdbc:sqlserver://localhost:1433;databaseName=rentacar;"
                   user = "sa"  password = "Pentium123!"></sql:setDataSource>

<sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from dbo.cars;
    </sql:query>

<div class="main">

    <header>

        <p>
            <a href="index-or.jsp"><img src="images/logo.png" class="sikalo-logo"></a>
        </p>

        <nav>

            <div>

                <ul class="menu">
                    <li><a href="index.jsp">Početna</a></li>
                    <li><a href="aboutUs.jsp">O nama</a></li>
                    <li><a href="cars.jsp">Vozila</a></li>
                    <li><a href="requirements.jsp">Uslovi</a></li>
                    <li><a href="contact.jsp">Kontakt</a></li>
                </ul>
            </div>

        </nav>

    </header>

    <section id="content">

        <div class="usluge clearfix">
        
        <c:forEach var = "row" items = "${result.rows}">
        
        <img alt="" src='<c:out value = "${pageContext.servletContext.contextPath}"/>/images/<c:out value = "${row.image}"/>' style="height: 400px">
        	
        	<div style="font-size: 15px;">
                <p>Brend: <c:out value = "${row.brand}"/></p>
                <p>Model: <c:out value = "${row.model}"/></p>
                <p>Boja: <c:out value = "${row.colour}"/></p>
                <p>Diskripcija: <c:out value = "${row.description}"/></p>
                <p>Potrosnja: <c:out value = "${row.consumption}"/></p>
                
                <a href='reservation.jsp?car_id=<c:out value = "${row.car_id}"/>'>Rezerviši vozilo</a>
                <hr>
                
            </div>
            
    	</c:forEach>

            <div style="color:black">
                .
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>Sva prava zadržana <c:out value="${currentYear}" /> - Rent a car Šikalo </p>
        </div>
    </footer>
</div>

</body>
</html>