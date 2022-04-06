
package config;


import java.sql.*;
import javax.swing.JOptionPane;


public class conexion {

    private String bd;
    private String dsn;
    private Connection cn;
    
    
    //establecemos la conexion a la base de datos con el usuario y contraseña
    public conexion(){
        
        bd="Prestamos";
        dsn="jdbc:sqlserver:// localhost;databaseName=" + bd + ";user=daniel22;password=ramirez11";
        //servidor local DESKTOP-11JI4MJ
    }
    
    //obtenemos la conexion por medio del driver
    public Connection getConexion(){
        
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cn= DriverManager.getConnection(dsn);
            
        
        
        }catch(Exception ex){
            
            JOptionPane.showMessageDialog(null, "Error: " + ex.getMessage());
            
        }
        
        return cn;
        
        
    } 
    
    //cerramos la conexion con la base de datos
    public void cerrarConexion(){
        
        try{
            
           cn.close();
            
        }catch(Exception e){
            
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        }
       
    }
}
