<%-- 
    Document   : newjsp
    Created on : 25 feb 2025, 12:35:32 p. m.
    Author     : johansitoweb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.example.tareas.Tarea" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de tareas</title>
</head>
<body>
    <h1>Lista de tareas</h1>

    <%-- Formulario para agregar una nueva tarea --%>
    <form action="index.jsp" method="post">
        <label for="descripcion">Tarea:</label>
        <input type="text" name="descripcion" id="descripcion" required>
        <button type="submit">Agregar</button>
    </form>

    <%-- Obtener la lista de tareas de la sesión --%>
    <% ArrayList<Tarea> tareas = (ArrayList<Tarea>) session.getAttribute("tareas");
    if (tareas == null) {
        tareas = new ArrayList<Tarea>();
        session.setAttribute("tareas", tareas);
    } %>

    <%-- Mostrar la lista de tareas --%>
    <ul>
        <% for (Tarea tarea : tareas) { %>
            <li>
                <input type="checkbox" <% if (tarea.isCompletada()) { %>checked<% } %>>
                <%= tarea.getDescripcion() %>
            </li>
        <% } %>
    </ul>

    <%-- Procesar el formulario --%>
    <% String nuevaDescripcion = request.getParameter("descripcion");
    if (nuevaDescripcion != null && !nuevaDescripcion.isEmpty()) {
        Tarea nuevaTarea = new Tarea(nuevaDescripcion);
        tareas.add(nuevaTarea);
        session.setAttribute("tareas", tareas);
        response.sendRedirect("index.jsp"); // Recargar la página
    } %>

</body>
</html>