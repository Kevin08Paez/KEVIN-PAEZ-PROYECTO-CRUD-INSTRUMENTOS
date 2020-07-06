
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Config.Conexion;
/**
 *
 * @author Kevin_Paez
 */
public class InstrumentoBD {
    private static final String Listado="SELECT instrumentos.idInstru, instrumentos.nombre, cat_marca.marca,"
            +"instrumentos.precio, instrumentos.descripcion FROM instrumentos JOIN cat_marca ON instrumentos.id_marca=cat_marca.idMarca ";
    private Connection conexion = new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public List<Instrumento> ListadoInstrumento()throws SQLException {
        List<Instrumento> instrumentos=new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.Listado); 
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            instrumentos.add(new Instrumento(this.rs.getInt("idInstru"), this.rs.getString("nombre"), this.rs.getString("marca"), this.rs.getDouble("precio"), this.rs.getString("descripcion"))); 
        }   
        return instrumentos;
    }  
}
