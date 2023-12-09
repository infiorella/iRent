package ModeloDAO;

import Config.Conexion;
import Modelo.Bitacora;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Interfaces.BitacoraCRUD;
import java.util.ArrayList;
import java.util.List;


public class BitacoraDAO implements BitacoraCRUD{
Conexion cn=new Conexion();
Connection con;   
PreparedStatement ps;
ResultSet rs;
Bitacora bi=new Bitacora();

    @Override
    public boolean add(Bitacora bi) {
        try {
            con=cn.getConnection();
            ps=con.prepareStatement("insert into bitacora(id_Dep, nom,  mensaje, tipo, id_Pro) values(?,?,?,?,?)");
            
             ps.setString(1, bi.getId_Dep());
            ps.setString(2, bi.getNom());
            ps.setString(3, bi.getMensaje());
            ps.setString(4, bi.getTipo());   
            ps.setInt(5, bi.getId_Pro());
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;        
    }

    @Override
    public List listar() {
    ArrayList<Bitacora> list=new ArrayList<>();
    String sql="select * from bitacora";
        try {
            
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Bitacora bi=new Bitacora();
                bi.setId_Bit(rs.getInt("id_Bit"));
                bi.setId_Dep(rs.getString("id_Dep"));                
                bi.setNom(rs.getString("nom"));
                bi.setFecha(rs.getString("fecha"));
                bi.setMensaje(rs.getString("mensaje"));
                bi.setTipo(rs.getString("tipo"));
                bi.setEstado(rs.getString("estado"));
                bi.setId_Pro(rs.getInt("id_Pro"));
                list.add(bi);
            }
        } catch (Exception e) {
        }
        return list;       
    }

    @Override
    public Bitacora list(int id_Bit) {
        Bitacora bit=new Bitacora();
        String sql="select * from bitacora where id_Bit="+id_Bit;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
               
                bit.setId_Bit(rs.getInt("id_Bit"));
                bit.setId_Dep(rs.getString("id_Dep"));                                
                bit.setNom(rs.getString("nom"));
                bit.setFecha(rs.getString("fecha"));
                bit.setMensaje(rs.getString("mensaje"));
                bit.setTipo(rs.getString("tipo"));                                        
                bit.setEstado(rs.getString("estado"));  
                bit.setId_Pro(rs.getInt("id_Pro"));
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return bit;          
    }

    @Override
    public boolean edit(Bitacora bi) {
        String sql="update bitacora set id_Dep='"+bi.getId_Dep()+"',"
                +"nom='"+bi.getNom()+"',"
                + "fecha='"+bi.getFecha()+"',"
                + "mensaje='"+bi.getMensaje()+"',"
                + "tipo='"+bi.getTipo()+"',"
                + "estado='"+bi.getEstado()+"',"
                + "id_Pro='"+bi.getId_Pro()
                +"' where id_Bit="+bi.getId_Bit();
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
            ArrayList<Bitacora> list=new ArrayList<>();
        Bitacora bit=new Bitacora();
        String sql="select * from bitacora where id_Pro="+id_Pro;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
               
                bit.setId_Bit(rs.getInt("id_Bit"));
                bit.setId_Dep(rs.getString("id_Dep"));                                
                bit.setNom(rs.getString("nom"));
                bit.setFecha(rs.getString("fecha"));
                bit.setMensaje(rs.getString("mensaje"));
                bit.setTipo(rs.getString("tipo"));                                        
                bit.setEstado(rs.getString("estado"));  
                bit.setId_Pro(rs.getInt("id_Pro"));
                list.add(bi);
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return list;          
    }
}
