<%@page import="java.sql.*"%>
<%@page import="util.ConectaBD"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Cliente</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>

        /* Fundo sorveteria */
        body {
            margin: 0;
            font-family: "Comic Sans MS", cursive, sans-serif;
            background: linear-gradient(135deg, #ffe0f0, #ffd9b3, #cfe7ff);
            background-size: 300% 300%;
            animation: fundo 10s ease infinite;
            padding: 40px;
        }

        @keyframes fundo {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Card */
        .card {
            max-width: 900px;
            margin: auto;
            margin-top: 40px;
            background: white;
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            animation: aparecer 0.5s ease;
        }

        @keyframes aparecer {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        /* Título */
        h2 {
            font-size: 40px;
            color: #ff5faf;
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 
                2px 2px #ffffff,
                4px 4px rgba(0,0,0,0.2);
        }

        /* Aviso */
        .aviso {
            background: #ffe1e1;
            border-left: 6px solid #ff6b6b;
            font-size: 20px;
            padding: 15px;
            border-radius: 12px;
            color: #c9103b;
            margin-bottom: 25px;
        }

        /* Botões */
        .btn-excluir {
            background: #ff6b9c !important;
            color: white !important;
            font-size: 20px !important;
            padding: 12px;
            font-weight: bold;
        }

        .btn-excluir:hover {
            background: #ff3c82 !important;
        }

        .btn-cancelar {
            background: #bfbfbf !important;
            color: white !important;
            padding: 12px;
        }

        .btn-voltar {
            background: #6ea8ff !important;
            color: white !important;
            padding: 12px;
        }

        /* Informações */
        .info {
            background: #fff6fb;
            padding: 15px;
            border-radius: 12px;
            box-shadow: inset 0 0 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        strong {
            color: #ff62a9;
        }

    </style>

</head>

<body>

<%
    String idParam = request.getParameter("id");
    Connection conexao = ConectaBD.conectar();

    PreparedStatement sql = conexao.prepareStatement("SELECT * FROM pesquisa WHERE id=?");
    sql.setString(1, idParam);
    ResultSet rs = sql.executeQuery();
%>

<div class="card">

    <h2> Excluir Cliente </h2>

<%
    if(!rs.next()){
%>

        <div class="aviso">
             Cliente não encontrado!
        </div>

        <a href="listarClientes.jsp" class="w3-button btn-voltar w3-round">Voltar</a>

</div>
</body>
</html>

<%
        return;
    }
%>

    <div class="aviso">
         Tem certeza que deseja excluir o cliente abaixo?
    </div>

    <div class="info">
        <strong>ID:</strong> <%= rs.getInt("id") %> <br>
        <strong>Nome:</strong> <%= rs.getString("nome") %> <br>
        <strong>Email:</strong> <%= rs.getString("email") %> <br>
    </div>

<%
    if(request.getMethod().equals("POST")){

        PreparedStatement delete = conexao.prepareStatement(
            "DELETE FROM pesquisa WHERE id=?"
        );

        delete.setString(1, idParam);
        delete.execute();
%>

        <p class="w3-panel w3-green w3-round w3-center">
             Cliente excluído com sucesso!
        </p>

        <a href="listarClientes.jsp" class="w3-button btn-voltar w3-round">Voltar</a>

</div>
</body>
</html>

<%
        return;
    }
%>

    <form method="post">
        <button class="w3-button btn-excluir w3-round"> Excluir Cliente</button>
        <a href="Listar.jsp" class="w3-button btn-cancelar w3-round">Cancelar</a>
    </form>

</div>

</body>
</html>
