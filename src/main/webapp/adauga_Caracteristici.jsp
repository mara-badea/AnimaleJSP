<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Caracteristica</title>
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <%
            String nume = request.getParameter("nume");
        	String detalii = request.getParameter("detalii");
        	String frecventa_aparitie = request.getParameter("frecventa_aparitie");
            if (nume != null) {
                jb.connect();
                jb.adaugaCaracteristica(nume, detalii, java.lang.Float.parseFloat(frecventa_aparitie));
                jb.disconnect();
        %>
        <h1 align="center">Caracteristici</h1>
        <br/>
        <p align="center"><a href="Tabela_Caracteristici.jsp"><b>Tabela Caracteristici</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Caracteristica a fost adaugata !</h2><%
        } else {
        %>
        <h1 align="center">Adauga caracteristica:</h1>
        <br/>
        <form action="adauga_Caracteristici.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume caracteristica:</td>
                    <td> <input type="text" name="nume" size="40" required="required"/></td>
                </tr>
                <tr>
                    <td align="right">Detalii:</td>
                    <td> <input type="text" name="detalii" size="40" required="required"/></td>
                </tr>
                <tr>
                    <td align="right">Frecventa aparitiei acestei caracteristici in animale:</td>
                    <td> <input type="number" step="0.01" name="frecventa_aparitie" size="40" min="1.0" max="100.00" required="required"/></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga" /></p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Caracteristici.jsp"><b>Tabela Caracteristici</b></a> </p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <%
            }
        %>
    </div>
    </body>
</html>
