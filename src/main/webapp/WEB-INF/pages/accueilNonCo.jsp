<%@ page import="fr.eni.ProjetJee.bo.Categorie" %>
<%@ page import="fr.eni.ProjetJee.bo.ArticleVendu" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
</head>
<body>
<%@ include file="header/headerNonConnecter.html"%>
<span>Liste des Enchères</span>
<span>Filtre :</span>
<form action="/Projet_ENI-Encheres/" method="post">
<input name="recherche" type="text">
<label for="categorie-select">Categorie:</label>
<select name="categorie" id="categorie-select">
    <option value="Toute">Toute</option>
    <%
		ArrayList<Categorie> categories= (ArrayList<Categorie>)request.getAttribute("categories");
		for (Categorie catgorie : categories) {
	%>
    	<option value="<%=catgorie.getNoCategorie() %>"><%=catgorie.getLibelle() %></option>
    <%
		}
    %>
</select>
<button>Rechercher</button>
</form>
<div class="fiche-produits">
	<%
		ArrayList<ArticleVendu> articles= (ArrayList<ArticleVendu>)request.getAttribute("articles");
		for (ArticleVendu article : articles) {
	%>
		<div class="article">
		<img alt="" src="<%= article.getPhoto() %>">
		<span><%= article.getNomArticle() %></span>
		<span>Prix : <%= article.getMiseAPrix() %></span>
		<span>Fin de l'enchère: <%= article.getDateFinEncheres() %></span>
		<span>Vendeur : <%= article.getUtilisateur().getPseudo() %></span>
		</div>
    <%
		}
    %>
</div>
</body>
</html>