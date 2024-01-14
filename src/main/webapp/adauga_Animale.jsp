<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Animal</title>
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <%
            String tip = request.getParameter("tip");
        	String familie = request.getParameter("familie");
            String specie = request.getParameter("specie");
            String sex = request.getParameter("sex");
            String nume = request.getParameter("nume");
            if (tip != null) {
                jb.connect();
                jb.adaugaAnimal(tip, familie, specie, sex, nume);
                jb.disconnect();
        %>
        <h1 align="center">Animale</h1>
        <br/>
        <p align="center"><a href="Tabela_Animale.jsp"><b>Tabela Animale</b></a></p>
        <p align="center"><a href="index.html"><b>Home</b></a> </p>
        <br/>
        <br/>
        <h2 align="center">Animalul a fost adaugat!</h2><%
        } else {
        %>
        <h1 align="center">Adauga Animal:</h1>
        <br/>
        <form action="adauga_Animale.jsp" method="post" >
            <table align="center">
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="tip" size="40" required="required" /></td>
                </tr>
                <tr>
                    <td align="right">Familie:</td>
                    <td> <input type="text" name="familie" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Specie:</td>
                    <td> <input type="text" name="specie" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Sex:</td>
                    <td><select id="sex" type="text" name="sex" required="required">
               		<option value="Feminin">Feminin</option>
               		<option value="Masculin">Masculin</option>
               		</td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" required="required"/></td>

                </tr>
            </table>
            <p align="center"> <input type="submit" value="Adauga"/></p>
            <br/>
            <p align="center"><a href="Tabela_Animale.jsp"><b>Tabela Animale</b></a> </p>
        	<p align="center"><a href="index.html"><b>Home</b></a> </p>
        	<br/>
        </form>
        <%
            }
        %>
    </div>
    </body>
</html>
