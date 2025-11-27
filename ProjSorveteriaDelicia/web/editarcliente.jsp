<%@page import="java.sql.*"%>
<%@page import="util.ConectaBD"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Pesquisa</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>

        /* Fundo estilo sorveteria com animação */
        body {
            margin: 0; padding: 0;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(135deg, #ffe0f0, #ffd5ba, #c9e7ff);
            background-size: 300% 300%;
            animation: fundo 9s ease infinite;

            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        @keyframes fundo {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Card central */
        .card {
            width: 90%;
            max-width: 900px;
            background: white;
            padding: 40px;
            margin-top: 50px;
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            animation: zoom 0.4s;
        }

        @keyframes zoom {
            from { transform: scale(0.9); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        h2 {
            text-align: center;
            font-size: 40px;
            color: #ff5faf;
            margin-bottom: 25px;
            text-shadow: 
                2px 2px #fff,
                4px 4px rgba(0,0,0,0.2);
        }

        label {
            font-size: 20px;
            color: #ff6fa6;
            font-weight: bold;
        }

        input {
            background: #fff8fd !important;
        }

        input:focus {
            border-color: #ff8ec6 !important;
            box-shadow: 0 0 8px #ffb3d9 !important;
        }

        /* Botões */
        .btn-salvar {
            background: #ff6fb7 !important;
            color: white !important;
            font-size: 20px !important;
            font-weight: bold;
        }

        .btn-salvar:hover {
            background: #ff4d9c !important;
        }

        .btn-voltar {
            background: #b3b3b3 !important;
            color: white !important;
        }

        .msg {
            text-align: center;
            padding: 12px;
        }

    </style>

</head>

<body>

<%
    String idParam = request.getParameter("id");
    int id = Integer.parseInt(idParam);

    Connection conexao = ConectaBD.conectar();
    PreparedStatement sql = conexao.prepareStatement("SELECT * FROM pesquisa WHERE id=?");
    sql.setInt(1, id);
    ResultSet rs = sql.executeQuery();

    if (!rs.next()) {
        out.println("<h3 class='w3-red w3-padding'>Registro não encontrado!</h3>");
        return;
    }
%>

<div class="card">

    <h2>  Editar Pesquisa  </h2>

    <form method="post">

        <input type="hidden" name="id" value="<%= id %>">

        <label>Nome</label>
        <input class="w3-input w3-border w3-round" type="text" disabled 
               value="<%= rs.getString("nome") %>">

        <label>Email</label>
        <input class="w3-input w3-border w3-round" type="email" 
               name="email" value="<%= rs.getString("email") %>">

        <label>Resposta 1</label>
        <input class="w3-input w3-border w3-round" type="number" name="r1" 
               value="<%= rs.getInt("r1") %>">

        <label>Resposta 2</label>
        <input class="w3-input w3-border w3-round" type="number" name="r2" 
               value="<%= rs.getInt("r2") %>">

        <label>Resposta 3</label>
        <input class="w3-input w3-border w3-round" type="number" name="r3" 
               value="<%= rs.getInt("r3") %>">

        <label>Resposta 4</label>
        <input class="w3-input w3-border w3-round" type="number" name="r4" 
               value="<%= rs.getInt("r4") %>">

        <br><br>

        <button class="w3-button w3-round-large w3-block btn-salvar">
             Salvar Alterações
        </button>

        <br>

        <a href="Listar.jsp" class="w3-button w3-round-large btn-voltar">
            Voltar
        </a>
    </form>

<%
    if(request.getMethod().equals("POST")){

        PreparedStatement update = conexao.prepareStatement(
            "UPDATE pesquisa SET email=?, r1=?, r2=?, r3=?, r4=? WHERE id=?"
        );

        update.setString(1, request.getParameter("email"));
        update.setInt(2, Integer.parseInt(request.getParameter("r1")));
        update.setInt(3, Integer.parseInt(request.getParameter("r2")));
        update.setInt(4, Integer.parseInt(request.getParameter("r3")));
        update.setInt(5, Integer.parseInt(request.getParameter("r4")));
        update.setInt(6, Integer.parseInt(request.getParameter("id")));

        update.execute();

        out.println("<p class='w3-panel w3-green w3-round msg'> Alterado com sucesso!</p>");
    }
%>

</div>

</body>
</html>
