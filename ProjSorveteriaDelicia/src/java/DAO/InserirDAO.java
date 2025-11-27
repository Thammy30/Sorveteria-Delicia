
package DAO;

import model.PesquisaBean;
import util.ConectaBD;
import java.sql.*;

public class InserirDAO {
    
    Statement executar;
    PreparedStatement sql;
    Connection conexao;
    ResultSet lista;
    
    public boolean Inserir(PesquisaBean p) throws ClassNotFoundException, SQLException {
    try {  
        conexao = ConectaBD.conectar();

        sql = conexao.prepareStatement(
            "INSERT INTO pesquisa (id, nome, email, r1, r2, r3, r4) VALUES (?,?,?,?,?,?,?)"
        );

        sql.setInt(1, p.getId());
        sql.setString(2, p.getNome());
        sql.setString(3, p.getEmail());
        sql.setInt(4, p.getR1());
        sql.setInt(5, p.getR2());
        sql.setInt(6, p.getR3());
        sql.setInt(7, p.getR4());

        sql.executeUpdate();
        return true;

    } catch (SQLException e) {
        System.out.println("Erro: " + e);
        return false;
    }
}
    
}
