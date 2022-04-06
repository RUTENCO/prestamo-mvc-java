
package modelodao;


import config.conexion;
import interfaces.CRUD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import modelo.Persona;


public class personaDao extends conexion implements CRUD  {
     
     Connection con;
     Statement ps;
     ResultSet rs;
     
     Persona p= new Persona();
     
    @Override
    //metodo para listar todos los registro de la tabla persona en la base de datos
    public List listar() {
        ArrayList<Persona>list=new ArrayList<>();
        String sql="select * FROM Persona";
        try {
            con= getConexion(); //establecemos la conexión
            ps=con.createStatement();//prepara las intrucciones para la base de datos
            rs=ps.executeQuery(sql); //ejecuta la consulta por medio de la instrucció sql
            while (rs.next()) {   //se lee los registro de la consulta      
                Persona per= new Persona();
                per.setId(rs.getInt("id"));
                per.setNombre(rs.getString("nombre"));
                per.setCorreo(rs.getString("correo"));//asignamos datos a el objeto persona segun la respectiva consulta
                per.setTelefono(rs.getString("telefono"));
                per.setValor_credito(rs.getFloat("valor_credito"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //metodo de en listar por id en la tabla persona desde la base de datos
    @Override
    public Persona list(int id) {
        String sql="select * FROM Persona Where id="+id;
        try {
            con= getConexion();
            ps=con.createStatement();
            rs=ps.executeQuery(sql);
            while (rs.next()) {                
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setCorreo(rs.getString("correo"));
                p.setTelefono(rs.getString("telefono"));
                p.setValor_credito(rs.getFloat("valor_credito"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    //metodo de añadir un registro a la tabla persona en la base de datos
    @Override
    public boolean add(Persona per) {
         String sql= "Insert into Persona values('"+per.getId()+"', '"+per.getNombre()
                 +"', '"+per.getCorreo()+"', '"+per.getTelefono()+"', '"+per.getValor_credito()+"')";
         try {
            con= getConexion();
            ps= con.createStatement();
            ps.executeUpdate(sql);//actualiza los datos de la base de datos con la respectiva estruccion sql
        } catch (Exception e) {
             
        }
         return false;
    }

    //metodo de editar una registro en la tabla persona desde la base de tados
    @Override
    public boolean edit(Persona per) {
         String sql= "update Persona set id='"+per.getId()+"',nombre='"+per.getNombre()
                 +"',correo='"+per.getCorreo()+"',telefono='"+per.getTelefono()+
                 "',valor_credito='"+per.getValor_credito()+"'Where id="+per.getId();
          try {
            con=getConexion();
            ps=con.createStatement();
            ps.executeUpdate(sql);
        } catch (Exception e) {
        }
          return false;
    }
    
    //metodo eliminar un registro de la tabla persona desde la base de datos
    @Override
    public boolean eliminar(int id) {
        String sql="delete from Persona where id="+id;
        try {
           con=getConexion();
           ps=con.createStatement();
           ps.executeUpdate(sql);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"error al eliminar datos "+ e);
        }
        return false;
    }

    //metodo buscar un registro en la tabla persona desde la base de datos
    @Override
    public List buscar(String texto) {
       List <Persona> lista= new ArrayList<>();
       String sql;
       sql="select * from Persona where id LIKE '%"+texto+"%'";
        try {
            con= getConexion();
            ps=con.createStatement();
            rs=ps.executeQuery(sql);
            while (rs.next()) { 
                Persona pe=new Persona();
                pe.setId(rs.getInt("id"));
                pe.setNombre(rs.getString("nombre"));
                pe.setCorreo(rs.getString("correo"));
                pe.setTelefono(rs.getString("telefono"));
                pe.setValor_credito(rs.getFloat("valor_credito"));
                lista.add(pe);
            }
            
        } catch (Exception e) {
        }
         return lista;
    }
    
    
    
}
