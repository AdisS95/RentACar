<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rezervacije</title>
</head>
<body>
<sql:setDataSource var = "snapshot" driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"
                   url = "jdbc:sqlserver://localhost:1433;databaseName=rentacar;"
                   user = "sa"  password = "Pentium123!"></sql:setDataSource>

    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from dbo.cars;
    </sql:query>

    <!--  <table border = "1" width = "100%">
        <tr>
            <th>Car ID</th>
            <th>VIN</th>
            <th>Category ID</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Colour</th>
        </tr>

    <c:forEach var = "row" items = "${result.rows}">
        <tr>
            <td><c:out value = "${row.car_id}"/></td>
            <td><c:out value = "${row.VIN}"/></td>
            <td><c:out value = "${row.category_id}"/></td>
            <td><c:out value = "${row.brand}"/></td>
            <td><c:out value = "${row.model}"/></td>
            <td><c:out value = "${row.colour}"/></td>
        </tr>
    </c:forEach>
	</table>  -->


</body>
</html>





<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>

    <meta charset="utf-8">
    <title>Rent a car Šikalo - Rezervacije</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,700&amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

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
        
      <form action = "process.jsp" method = "POST">
      	<input value='${param["car_id"]}' name="car_id" hidden=true>
         <br />
         Ime: <input type = "text" name = "first_name">
         <br />
         Prezime: <input type = "text" name = "last_name" />
         <br />
         Zemlja: <input type = "text" name = "country" />
         <br />
         Grad: <input type = "text" name = "city" />
         <br />
         Broj mobilnog telefona: <input type = "text" name = "mobile" />
         <br />
         E-mail adresa: <input type = "text" name = "email" />
         <br />
         Pocetni datum: <input type = "date" name = "start_date" />
         <br />
         Krajnji datum: <input type = "date" name = "end_date" />
         <br />
         <input type = "submit" value = "Posalji" />
      </form>

    </section>

    <footer>
        <div class="container">
            <p>Sva prava zadržana 2020 - Rent a car Šikalo </p>
        </div>
    </footer>

</div>

</body>
</html>