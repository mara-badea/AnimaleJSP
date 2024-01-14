<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caracteristici</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Caracteristici</h1>
        <br/>
        <p align="center"><a href="Tabela_Caracteristici.jsp"><b>Tabela Caracteristici</b></a></p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        <br/>
        <br/>
        <br/>
        <%
            jb.connect();
            long aux = java.lang.Long.parseLong(request.getParameter("idcaracteristica"));
            String nume = request.getParameter("nume");
            String detalii = request.getParameter("detalii");
            System.out.print("nume: ");
            System.out.println(nume);
            System.out.print("detalii: ");
            System.out.println(detalii);
            String frecventa_aparitie = request.getParameter("frecventa_aparitie");
            System.out.print("frecventa: ");
            System.out.println(frecventa_aparitie);
            String[] valori = {nume, detalii, frecventa_aparitie};
            String[] campuri = {"nume", "detalii", "frecventa_aparitie"};
            jb.modificaTabela("caracteristici", "idcaracteristica", aux, campuri, valori);
            jb.disconnect();
        %>
        <h2 align="center">Modificarile au fost efectuate !</h2>
    </div>
    </body>
</html>
