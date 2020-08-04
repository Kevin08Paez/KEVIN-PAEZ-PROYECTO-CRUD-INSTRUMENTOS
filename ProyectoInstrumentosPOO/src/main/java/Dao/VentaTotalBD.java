
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Config.Conexion;

public class VentaTotalBD {
    private static final String Listado="SELECT * FROM compra_total";
    private static final String Insertado="INSERT INTO compra_total SET id_instru=?, nombre=?, precio=?, cantidad=?, Total=? ";
    private static final String Actualizar="UPDATE instrumentos INNER JOIN compra_total ON instrumentos.idInstru = compra_total.id_instru" +
                                           " SET instrumentos.cantidad = instrumentos.cantidad - compra_total.cantidad WHERE instrumentos.idInstru=? ";
    private Connection conexion = new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public List<VentaTotal> ListadoVentas()throws SQLException {
        List<VentaTotal> venta=new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.Listado); 
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            venta.add(new VentaTotal(this.rs.getInt("idCompra"), this.rs.getInt("idInstru"), this.rs.getString("nombre"), this.rs.getDouble("precio"), this.rs.getInt("cantidad"), this.rs.getDouble("total"))); 
        }   
        return venta;
    }
    
    public boolean InsertarVenta(VentaTotal venta) throws SQLException{
        this.stmt=this.conexion.prepareStatement(Insertado);
        this.stmt.setInt(1, venta.getIdInstru());
        this.stmt.setString(2, venta.getNombre());
        this.stmt.setDouble(3, venta.getPrecio());
        this.stmt.setInt(4, venta.getCantidad());
        this.stmt.setDouble(5, venta.getTotal());
        
        if(this.stmt.executeUpdate()==1){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean ActualizarDatos(VentaTotal venta) throws SQLException{
        this.stmt=this.conexion.prepareStatement(this.Actualizar);
        this.stmt.setInt(1, venta.getIdInstru());
        if(this.stmt.executeUpdate()==1){
            return true;
        }else{
            return false;
        }
    }
}
