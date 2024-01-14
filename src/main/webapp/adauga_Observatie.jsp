<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Observatie</title>
<link href="css/adauga.css" rel="stylesheet" type="text/css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<div>
		<%
		long idanimal, idcaracteristica;
		String id1, id2, tip, familie, specie, sex, nume_animal;
		String nume_caracteristica, detalii;
		float frecventa_aparitie;
		String observator;
		id1 = request.getParameter("idanimal");
		System.out.print("id1: ");
		System.out.println(id1);
		
		id2 = request.getParameter("idcaracteristica");
		System.out.print("id2: ");
		System.out.println(id2);
		observator = request.getParameter("observator");
		if (id1 != null || id2 != null) {
			jb.connect();
			jb.adaugaObservatie(Long.parseLong(id1), Long.parseLong(id2), observator);
			jb.disconnect();
		%>
		<h1 align="center">Observatii</h1>
		<br />
		<p align="center">
			<a href="Tabela_Observatii.jsp"><b>Tabela Observatii</b></a>
		</p>
		<p align="center">
			<a href="index.html"><b>Home</b></a>
		</p>
		<br /> <br />
		<h2 align="center">Observatia a fost adaugata!</h2>
		<%
		} else {
		jb.connect();
		ResultSet rs1 = jb.vedeTabela("animale");
		ResultSet rs2 = jb.vedeTabela("caracteristici");
		%>
		<h1 align="center">Adauga observatie:</h1>
		<br />
		<form action="adauga_Observatie.jsp" method="post">
			<table align="center">
				<tr>
					<td align="right">Id Animal:</td>
					<td><SELECT NAME="idanimal">
							<%
							while (rs1.next()) {
								idanimal = rs1.getLong("idanimal");
								tip = rs1.getString("tip");
								familie = rs1.getString("familie");
								specie = rs1.getString("specie");
								sex = rs1.getString("sex");
								nume_animal = rs1.getString("nume");
							%>
							<OPTION VALUE="<%=idanimal%>"><%=idanimal%>,<%=tip%>,<%=familie%>,<%=specie%>,<%=sex%>,<%=nume_animal%></OPTION>
							<%
							}
							%>
					</SELECT></td>
				</tr>
				<tr>
					<td align="right">Id Caracteristica:</td>
					<td><SELECT NAME="idcaracteristica">
							<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
							<%
							while (rs2.next()) {
								idcaracteristica = rs2.getLong("idcaracteristica");
								nume_caracteristica = rs2.getString("nume");
								detalii = rs2.getString("detalii");
								frecventa_aparitie = rs2.getFloat("frecventa_aparitie");
							%>
							<OPTION VALUE="<%=idcaracteristica%>"><%=idcaracteristica%>,<%=nume_caracteristica%>,<%=frecventa_aparitie%></OPTION>
							<%
							}
							%>
					</SELECT></td>
				</tr>
				<tr>
					<td align="right">Observator:</td>
					<td><input type="text" name="observator" size="30"
						required="required" /></td>
				</tr>
			</table>
			<p align="center">
				<input type="submit" value="Adauga" />
			</p>
			<br />
			<p align="center">
				<a href="Tabela_Observatii.jsp"><b>Tabela Observatii</b></a>
			</p>
			<p align="center">
				<a href="index.html"><b>Home</b></a>
			</p>
			<br />
		</form>
		<%
		}
		%>
	</div>
</body>
</html>
