<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Animale</title>
        <link href="css/tabelaAnimale.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center"> Tabela Animale:</h1>
        <form action="sterge_Animal.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id:</b></td>
                    <td><b>Tip:</b></td>
                    <td><b>Familie:</b></td>
                    <td><b>Specie:</b></td>
                    <td><b>Sex:</b></td>
                    <td><b>Nume:</b></td>

                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("animale");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idanimal");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("tip")%></td>
                    <td><%= rs.getString("familie")%></td>
                    <td><%= rs.getString("specie")%></td>
                    <td><%= rs.getString("sex")%></td>
                    <td><%= rs.getString("nume")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center"><a href="adauga_Animale.jsp"><b>Adauga Animale</b></a></p>
        <p align="center"><a href="modifica_Animal.jsp"><b>Modifica Animal</b></a></p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </div>
    </body>
</html>
