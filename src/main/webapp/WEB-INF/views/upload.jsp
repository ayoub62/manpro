<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/manpro/upload" method="post" enctype="multipart/form-data">
 		<label for="description">Description du fichier</label>
        <input type="text" id="description" name="description" value="" />
        <br />

        <label for="fichier">Emplacement du fichier <span class="requis">*</span></label>
        <input type="file" id="fichier" name="fichier" /> 
        <br />
                
         <input type="submit" value="Envoyer" class="sansLabel" />
         <br />  
	</form>
	<p>${fichier }</p>
</body>
</html>