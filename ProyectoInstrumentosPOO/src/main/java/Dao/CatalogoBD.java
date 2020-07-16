
package Dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Config.Conexion;
/**
 *
 * @author Kevin_Paez
 */
public class CatalogoBD {
    private static final String Listado="SELECT * FROM cat_marca";
    private static final String Marcas="SELECT marca FROM `cat_marca` ";
    private Connection conexion = new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public List<Catalogo> ListadoCatalogo() throws SQLException{
        List<Catalogo> catalogo = new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.Listado); 
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            catalogo.add(new Catalogo(this.rs.getInt("idMarca"), this.rs.getString("marca")));
        }
        
        return catalogo;
    }
    
    public List<Catalogo> ListadoMarcas() throws SQLException{
        List<Catalogo> marca = new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.Marcas); 
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            marca.add(new Catalogo(this.rs.getString("marca")));
        }
        
        return marca;
    }
    
}
