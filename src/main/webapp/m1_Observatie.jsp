<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Observatie</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="css/adauga.css" rel="stylesheet" type="text/css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <div>
        <h1 align="center">Modifica Observatie:</h1>
        <br/>
        <%
            jb.connect();
        	String tip, familie, specie, sex, nume_animal;
        	String observator, nume_caracteristica, detalii;
        	float frecventa_aparitie;

            String aux = request.getParameter("primarykey");
            if(aux != null){
	            ResultSet rs = jb.intoarceObservatieId(java.lang.Long.parseLong(aux));
	            rs.first();
	            long id1 = rs.getLong("idanimal");
	            System.out.print("idanimal: ");
	            System.out.println(id1);
	            long id2 = rs.getLong("idcaracteristica");
	            System.out.print("id2: ");
	            System.out.println(id2);
	
	            tip = rs.getString("tip");
	        	familie = rs.getString("familie");
	            specie = rs.getString("specie");
	            sex = rs.getString("sex");
	            nume_animal = rs.getString("nume_animal");
	            nume_caracteristica = rs.getString("nume_caracteristica");
	            detalii = rs.getString("detalii");
				observator = rs.getString("observator");
				frecventa_aparitie = rs.getFloat("frecventa_aparitie");
	            ResultSet rs1 = jb.vedeTabela("animale");
	            ResultSet rs2 = jb.vedeTabela("caracteristici");
	            long idanimal, idcaracteristica;

        %>
        <form action="m2_Observatie.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Id Observatie:</td>
                    <td> <input type="text" name="idobservatie" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Idanimal:</td>
                    <td> 
                        <SELECT NAME="idanimal">
                            <%
                                while (rs1.next()) {
                                    idanimal = rs1.getLong("idanimal");
                                    tip = rs1.getString("tip");
                                	familie = rs1.getString("familie");
                                    specie = rs1.getString("specie");
                                    sex = rs1.getString("sex");
                                    nume_animal = rs1.getString("nume");
                                    if (idanimal != id1) {
                            %>
                            <OPTION VALUE="<%= idanimal%>"><%= idanimal%>,<%= tip%>,<%= familie%>,<%= specie%>,<%= sex%>,<%= nume_animal%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idanimal%>"><%= idanimal%>,<%= tip%>,<%= familie%>,<%= specie%>,<%= sex%>,<%= nume_animal%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Id caracteristica:</td>
                    <td> 
                        <SELECT NAME="idcaracteristica">
                            <%
                                while (rs2.next()) {
                                	idcaracteristica = rs2.getLong("idcaracteristica");
                                    nume_caracteristica = rs2.getString("nume");
                                    detalii = rs2.getString("detalii");
                                    frecventa_aparitie = rs2.getFloat("frecventa_aparitie");
                            if (idcaracteristica != id2) {
                            %>
                            <OPTION VALUE="<%= idcaracteristica%>"><%= idcaracteristica%>, <%= nume_caracteristica%>, <%= detalii%>, <%= frecventa_aparitie%>%</OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcaracteristica%>"><%= idcaracteristica%>, <%= nume_caracteristica%> , <%= detalii%>, <%= frecventa_aparitie%>%</OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Observator:</td>
                    <td> <input type="text" name="observator" size="30" value="<%= observator%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica">
            </p>
        </form>
        <br/>
        <p align="center"><a href="Tabela_Observatii.jsp"><b>Tabela Observatii</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
        <%} else{ %>
        <p align="center"><a href="Tabela_Observatii.jsp"><b>Tabela Observatii</b></a> </p>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            </p>
        <br/>
        <br/>
        <h2 align="center">Selectati o linie pe care doriti sa o modificati inainte sa apasati butonul "Modifica"</h2>
        <%} %>
    </div>
    </body>
    
</html>