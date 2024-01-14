<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Observatii</title>
        <link href="css/tabelaObservatii.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center"> Tabela Observatii:</h1>
        <br/>
        <form action="sterge_Observatie.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>Id Observatie:</b></td>
                    <td><b>Id Animal:</b></td>
                    <td><b>Nume Animal:</b></td>
                    <td><b>Familie:</b></td>
                    <td><b>Specie:</b></td>
                    <td><b>Sex:</b></td>
                    <td><b>Nume:</b></td> 
                    <td><b>Id Caracteristica:</b></td>
                    <td><b>Nume Caracteristica:</b></td>
                    <td><b>Detalii:</b></td>
                    <td><b>Frecventa caracteristica in animale [%]:</b></td>
                    <td><b>Observator:</b></td>
                    
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeObservatie();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idobservatie");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getLong("idanimal")%></td>
                    <td><%= rs.getString("nume_animal")%></td>
                    <td><%= rs.getString("familie")%></td>
                    <td><%= rs.getString("specie")%></td>
                    <td><%= rs.getString("sex")%></td>
                    <td><%= rs.getString("nume_animal")%></td>
                    <td><%= rs.getLong("idcaracteristica")%></td>
                    <td><%= rs.getString("nume_caracteristica")%></td>
                    <td><%= rs.getString("detalii")%></td>
                    <td><%= rs.getFloat("frecventa_aparitie")%></td>
                    <td><%= rs.getString("observator")%></td>
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
        <p align="center"><a href="adauga_Observatie.jsp"><b>Adauga Observatie</b></a></p>
        <p align="center"><a href="modifica_Observatie.jsp"><b>Modifica Observatie</b></a></p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </div>
    </body>
</html>