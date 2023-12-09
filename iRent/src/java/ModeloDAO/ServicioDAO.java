package ModeloDAO;

import Config.Conexion;
import Interfaces.ServicioCRUD;
import Modelo.Servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ServicioDAO implements ServicioCRUD{
    Servicio ser=new Servicio();
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;   

    @Override
    public boolean add(Servicio ser) {
try {
            con=cn.getConnection();
            ps=con.prepareStatement("INSERT INTO servicio (id_Ser, nom, costo, id_Dep)"
                    + " values(?,?,?,?)");
            
            
            ps.setInt(1, ser.getId_Ser());
            ps.setString(2, ser.getNom());
            ps.setDouble(3, ser.getCosto());
            ps.setString(4, ser.getId_Dep());
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;        
    }

    @Override
    public List listar() {
    ArrayList<Servicio> list=new ArrayList<>();
        String sql="select * from servicio";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Servicio ser=new Servicio();
                ser.setId_Ser(rs.getInt("id_Ser"));
                ser.setNom(rs.getString("nom"));
                ser.setCosto(rs.getDouble("costo"));
                ser.setId_Dep(rs.getString("id_Dep"));
                list.add(ser);
            }ps.close();
            rs.close();
        } catch (Exception e) {
        }
    return list;       
    }

    @Override
    public Servicio list(int id_Ser) {
    String sql="select * from servicio where id_Ser="+id_Ser;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                ser.setId_Ser(rs.getInt("id_Ser"));
                ser.setNom(rs.getString("nom"));
                ser.setCosto(rs.getDouble("costo"));
                ser.setId_Dep(rs.getString("id_Dep"));
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return ser;       
    }

    @Override
    public boolean edit(Servicio ser) {
        String sql="update servicio set nom='"+ser.getNom()+"',"
                +"costo='"+ser.getCosto()+"',"
                + "id_Dep='"+ser.getCosto()
                +"' where id_Ser="+ser.getId_Ser();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;        
    
    }            
    
        public Servicio buscar(int id_Ser) {
        Servicio c=new Servicio();
        String sql="SELECT * FROM servicio WHERE id_Ser="+id_Ser;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Ser(rs.getInt("id_Ser"));
                c.setNom(rs.getString("nom"));
                c.setCosto(rs.getDouble("costo"));
                c.setId_Dep(rs.getString("id_Dep"));
            }
        } catch (Exception e){
        }
        return c;
    }
}
