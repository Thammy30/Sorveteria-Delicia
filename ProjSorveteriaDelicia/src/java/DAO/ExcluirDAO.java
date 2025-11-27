package DAO;

import util.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ExcluirDAO {

    public boolean Excluir(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM pesquisa WHERE id = ?";

        try (Connection conexao = ConectaBD.conectar();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, id);

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0; 

        } catch (SQLException e) {
            System.out.println("Erro ao excluir registro: " + e.getMessage());
            return false;
        }
    }
}
