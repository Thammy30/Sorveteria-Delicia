<%@page import="DAO.InserirDAO"%>
<%@page import="model.PesquisaBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pesquisa de Satisfação - Sorveteria</title>

        <style>
            body {
                font-family: 'Comic Sans MS', 'Poppins', sans-serif;
                background: linear-gradient(#fff7f7, #ffecec);
                margin: 0;
                padding: 0;
            }

            header {
                background: #ff80a8;
                padding: 25px;
                text-align: center;
                color: white;
                font-size: 32px;
                font-weight: bold;
                letter-spacing: 2px;
                text-shadow: 2px 2px #d94f7b;
                border-bottom: 5px solid #ffb6c9;
            }

            .container {
                max-width: 600px;
                margin: 40px auto;
                background: #ffffffcc;
                border-radius: 15px;
                padding: 25px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
                border: 3px dashed #ffb6c9;
            }

            h1 {
                text-align: center;
                color: #ff6699;
            }

            h2 {
                text-align: center;
                padding: 10px;
                border-radius: 10px;
            }

            .success {
                background-color: #c8f7c5;
                color: #2d7d46;
                border: 2px solid #2d7d46;
            }

            .error {
                background-color: #ffd1d1;
                color: #a32727;
                border: 2px solid #a32727;
            }

            a {
                display: inline-block;
                margin-top: 20px;
                background: #ff80a8;
                padding: 10px 20px;
                color: white;
                border-radius: 10px;
                text-decoration: none;
                font-weight: bold;
                transition: 0.3s;
            }

            a:hover {
                background: #ff4f85;
                transform: scale(1.05);
            }

            .icone-sorvete {
                text-align: center;
                font-size: 60px;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>

        <header>🍦 Sorveteria Delícia 🍨</header>

        <div class="container">

        <div class="icone-sorvete">🍧</div>
        <h1>Resultado do Cadastro</h1>

        <%
            try {

                // Pegando os campos enviados pelo formulário
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");

                int r1 = Integer.parseInt(request.getParameter("r1"));
                int r2 = Integer.parseInt(request.getParameter("r2"));
                int r3 = Integer.parseInt(request.getParameter("r3"));
                int r4 = Integer.parseInt(request.getParameter("r4"));

                PesquisaBean pesq = new PesquisaBean();
                pesq.setId(id);
                pesq.setNome(nome);
                pesq.setEmail(email);
                pesq.setR1(r1);
                pesq.setR2(r2);
                pesq.setR3(r3);
                pesq.setR4(r4);

                InserirDAO pesquisa = new InserirDAO();

                boolean resultado = pesquisa.Inserir(pesq);

                if (resultado) {
                    out.println("<h2 class='success'>🍨 Dados inseridos com sucesso! Obrigado por participar! 🍦</h2>");
                } else {
                    out.println("<h2 class='error'>🍦 Erro ao inserir os dados! Tente novamente. 😢</h2>");
                }

                out.println("<div style='text-align:center;'><a href='index.html'>Voltar</a></div>");

            } catch (Exception e) {
                out.println("<h2 class='error'>Erro: " + e.getMessage() + "</h2>");
                out.println("<p style='text-align:center;'>Verifique se todos os campos foram preenchidos corretamente.</p>");
                out.println("<div style='text-align:center;'><a href='index.html'>Voltar</a></div>");
            }
        %>

        </div>

    </body>
</html>
