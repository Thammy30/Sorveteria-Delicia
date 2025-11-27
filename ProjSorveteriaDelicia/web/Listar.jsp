<%@page import="util.ConectaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pesquisa Cadastrada</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <style>

        /* Fundo animado estilo sorveteria */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Comic Sans MS', Arial, sans-serif;
            background: linear-gradient(135deg, #ffe4f1, #ffd8b5, #c6e6ff);
            background-size: 300% 300%;
            animation: fundo 10s ease infinite;

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

        /* Card mais centralizado */
        .card {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            animation: zoom 0.5s;
            margin-top: 50px;
        }

        @keyframes zoom {
            from { transform: scale(0.9); opacity: 0; }
            to   { transform: scale(1); opacity: 1; }
        }

        /* Título mais central e espaçado */
        h1 {
            text-align: center;
            font-size: 45px;
            color: #ff5faf;
            margin-bottom: 30px;
            text-shadow: 
                2px 2px #ffffff,
                4px 4px rgba(0,0,0,0.2);
        }

        /* Tabela */
        table {
            font-size: 18px;
        }

        thead tr {
            background: #ff80bf !important;
            color: white;
            font-size: 20px;
        }

        tbody tr:hover {
            background: #ffe6f3 !important;
            transition: 0.3s;
        }

        /* Ações centralizadas */
        td {
            vertical-align: middle !important;
            text-align: center;
        }

        th {
            text-align: center !important;
        }

        /* Botões */
        .btn-editar {
            background: #7db7ff !important;
            font-weight: bold;
        }
        .btn-editar:hover {
            background: #4b9aff !important;
        }

        .btn-excluir {
            background: #ff6f91 !important;
            font-weight: bold;
        }
        .btn-excluir:hover {
            background: #ff4f6f !important;
        }

    </style>

</head>

<body>

<div class="card">

    <h1>🍨 Lista de Pesquisas 🍦</h1>

    <table class="w3-table w3-striped w3-bordered w3-hoverable w3-white">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Atendimento</th>
                <th>Pontualidade</th>
                <th>Espera</th>
                <th>Recomendação</th>
                <th colspan="2">Ações</th>
            </tr>
        </thead>

        <tbody>
            <%
                try {
                    Connection conexao = ConectaBD.conectar();
                    PreparedStatement sql = conexao.prepareStatement("SELECT * FROM pesquisa");
                    ResultSet lista = sql.executeQuery();

                    while (lista.next()) {
                        int id = lista.getInt("id");
                        String nome = lista.getString("nome");
                        String email = lista.getString("email");
                        int r1 = lista.getInt("r1");
                        int r2 = lista.getInt("r2");
                        int r3 = lista.getInt("r3");
                        int r4 = lista.getInt("r4");
            %>

            <tr>
                <td><%= id %></td>
                <td><%= nome %></td>
                <td><%= email %></td>
                <td><%= r1 %></td>
                <td><%= r2 %></td>
                <td><%= r3 %></td>
                <td><%= r4 %></td>

                <td>
                    <a href="editarcliente.jsp?id=<%= id %>"
                       class="w3-button btn-editar w3-small w3-round">Editar</a>
                </td>

                <td>
                    <a href="excluircliente.jsp?id=<%= id %>"
                       class="w3-button btn-excluir w3-small w3-round">Excluir</a>
                </td>
            </tr>

            <% 
                    } 
                } catch (Exception e) {
                    out.println("<tr><td colspan='9'>Erro: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>

</div>

</body>
</html>
