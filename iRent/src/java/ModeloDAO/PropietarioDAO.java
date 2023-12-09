package ModeloDAO;

import Config.Conexion;
import Interfaces.PropietarioCRUD;
import Modelo.Propietario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PropietarioDAO implements PropietarioCRUD{
Conexion cn=new Conexion();
Connection con;   
PreparedStatement ps;
ResultSet rs;
    @Override
    public boolean add(Propietario pro) {
        try {
            con=cn.getConnection();
            ps=con.prepareStatement("insert into propietario(id_Pro, nomPro, telPro, nacionPro, edadPro, pass) values(?,?,?,?,?,?)");
           
            ps.setInt(1, pro.getId_Pro());
            ps.setString(2, pro.getNomPro());
            ps.setInt(3, pro.getTelPro());  
            ps.setString(4, pro.getNacionPro());
            ps.setInt(5, pro.getEdadPro());           
            ps.setString(6, pro.getPass());    
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;   
    }

    @Override
    public List listar() {
    ArrayList<Propietario> list=new ArrayList<>();
    String sql="select * from propietario";
        try {
            
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Propietario pro=new Propietario();
                pro.setId_Pro(rs.getInt("id_Pro"));
                pro.setNomPro(rs.getString("nomPro"));                
                pro.setTelPro(rs.getInt("telPro"));
                pro.setNacionPro(rs.getString("nacionPro"));
                pro.setEdadPro(rs.getInt("edadPro"));
                pro.setPass(rs.getString("pass"));
                list.add(pro);
            }
        } catch (Exception e) {
        }
        return list;       
    }

    @Override
    public Propietario list(int id_Pro) {
       Propietario pro=new Propietario();
        String sql="select * from propietario where id_Pro="+id_Pro;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
               
                pro.setId_Pro(rs.getInt("id_Pro"));
                pro.setNomPro(rs.getString("nomPro"));                                
                pro.setTelPro(rs.getInt("telPro"));
                pro.setNacionPro(rs.getString("nacionPro"));
                pro.setEdadPro(rs.getInt("edadPro"));
                pro.setPass(rs.getString("pass"));   
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return pro;    
    }

    @Override
    public boolean edit(Propietario pro) {
        String sql="update propietario set nomPro='"+pro.getNomPro()+"',"
                + "telPro='"+pro.getTelPro()+"',"
                + "nacionPro='"+pro.getNacionPro()+"',"
                + "edadPro='"+pro.getEdadPro()+"',"
                + "pass='"+pro.getPass()
                +"' where id_Pro="+pro.getId_Pro();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;        
    }
 
     public List buscar(int id_Pro) {
        ArrayList<Propietario> list=new ArrayList<>();
        Propietario pr=new Propietario();
        String sql="select * from propietario where id_Pro="+id_Pro;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
               
                pr.setId_Pro(rs.getInt("id_Pro"));
                pr.setNomPro(rs.getString("nomPro"));                                
                pr.setTelPro(rs.getInt("telPro"));
                pr.setNacionPro(rs.getString("nacionPro"));
                pr.setEdadPro(rs.getInt("edadPro"));
                pr.setPass(rs.getString("pass"));      
                
                list.add(pr);
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return list;          
    }
}
