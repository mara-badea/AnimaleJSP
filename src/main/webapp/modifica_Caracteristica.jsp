<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Caracteristici</title>
        <link href="css/tabelaCaracteristici.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modificati cracteristica:</h1>
        <br/>
        <form action="m1_Caracteristica.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id Caracteristica:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Detalii:</b></td>
                    <td><b>Frecventa Caracteristica in animale:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("caracteristici");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcaracteristica");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("detalii")%></td>
                    <td><%= rs.getString("frecventa_aparitie")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center"><a href="Tabela_Caracteristici.jsp"><b>Tabela Caracteristici</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </div>
    </body>
</html>
