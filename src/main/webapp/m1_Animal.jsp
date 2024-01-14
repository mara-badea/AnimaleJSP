<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Animal</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modifica animal:</h1>
        <br/>
        <%
            jb.connect();
            String aux = request.getParameter("primarykey");
            if(aux != null){
            	ResultSet rs = jb.intoarceLinieDupaId("animale", "idanimal", java.lang.Long.parseLong(aux));
                rs.first();
	            String tip = rs.getString("tip");
	        	String familie = rs.getString("familie");
	            String nume = rs.getString("nume");
	            String specie = rs.getString("specie");
	            String sex = rs.getString("sex");
                rs.close();
                jb.disconnect();
            
        %>
        <form action="m2_Animal.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Id Animal:</td>
                    <td> <input type="text" name="idanimal" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Tip:</td>
                    <td> <input type="text" name="tip" size="30" value="<%= tip%>"/></td>
                </tr>
                <tr>
                    <td align="right">Familie:</td>
                    <td> <input type="text" name="familie" size="30" value="<%= familie%>"/></td>
                </tr>
                                <tr>
                    <td align="right">Specie:</td>
                    <td> <input type="text" name="specie" size="30" value="<%= specie%>"/></td>
                </tr>
                                <tr>
                    <td align="right">Sex:</td>
               		<td>
               		<select id="sex" type="text" name="sex" required="required">
					    <option selected="selected"><%= sex %></option>
					    <option value="<%= "Masculin".equals(sex) ? "Feminin" : "Masculin" %>">
					        <%= "Masculin".equals(sex) ? "Feminin" : "Masculin" %>
					    </option>
					</select>
               		</td>
                </tr>
                                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= nume%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Animale.jsp"><b>Tabela Animale</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <% } else { %>
        <p align="center"><a href="Tabela_Animale.jsp"><b>Tabela Animale</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        <br/>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica" !</h2>
        <%} %>
    </div>
    </body>
</html>