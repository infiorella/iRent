package ModeloDAO;

import Config.Conexion;
import Interfaces.PagoCRUD;
import Modelo.Pago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PagoDAO implements PagoCRUD{
    Pago pa=new Pago();
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    @Override
    public boolean add(Pago pa) {
    try {
        con=cn.getConnection();
        ps=con.prepareStatement("INSERT INTO pago (nomPago, fechaVen, monto,  id_Dep)"
                + " values(?,?,?,?)");


        ps.setString(1, pa.getNomPago());
        ps.setString(2, pa.getFechaVen());
        ps.setDouble(3, pa.getMonto());
        ps.setString(4, pa.getId_Dep());
        ps.executeUpdate(); 
            
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;    
    }

    @Override
    public List listar() {
    ArrayList<Pago> list=new ArrayList<>();
    String sql="select * from pago  WHERE fechaVen<CURDATE()";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago pag=new Pago();
                pag.setId_Pago(rs.getInt("id_Pago"));
                pag.setNomPago(rs.getString("nomPago"));
                pag.setFechaVen(rs.getString("fechaVen"));
                pag.setMonto(rs.getDouble("monto"));
                pag.setEstado(rs.getString("estado"));
                pag.setId_Dep(rs.getString("id_Dep"));
                list.add(pag);
            }
        } catch (Exception e) {
        }
    return list;        
    }

    @Override
    public Pago list(int id_Pago) {
    String sql="select * from pago where id_Pago="+id_Pago;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                pa.setId_Pago(rs.getInt("id_Pago"));
                pa.setNomPago(rs.getString("nomPago"));
                pa.setFechaVen(rs.getString("fechaVen"));
                pa.setMonto(rs.getDouble("monto"));
                pa.setEstado(rs.getString("estado"));
                pa.setId_Dep(rs.getString("id_Dep"));
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return pa;        
    }

    @Override
    public boolean edit(Pago pa) {
    String sql="update pago set nomPago='"+pa.getNomPago()+"',"
                + "fechaVen='"+pa.getFechaVen()+"',"
                + "monto='"+pa.getMonto()+"',"
                +"estado='"+pa.getEstado()+"',"
                + "id_Dep='"+pa.getId_Dep()
                +"' where id_Pago="+pa.getId_Pago();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;    
    }
    
    
    public Pago buscarPago(int id_Pago) {
        Pago c=new Pago();
        String sql="SELECT * FROM pago WHERE id_Pago="+id_Pago;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Pago(rs.getInt("id_Pago"));
                c.setNomPago(rs.getString("nom"));
                c.setFechaVen(rs.getString("fechaVen"));
                c.setMonto(rs.getDouble("monto"));
                c.setEstado(rs.getString("estado"));
                c.setId_Dep(rs.getString("id_Dep"));
            }
        } catch (Exception e){
        }
        return c;    
    }
    
    public List listarb() {
    ArrayList<Pago> list=new ArrayList<>();
    String sql="select * from pago  WHERE fechaVen>CURDATE()";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago pag=new Pago();
                pag.setId_Pago(rs.getInt("id_Pago"));
                pag.setNomPago(rs.getString("nomPago"));
                pag.setFechaVen(rs.getString("fechaVen"));
                pag.setMonto(rs.getDouble("monto"));
                pag.setEstado(rs.getString("estado"));
                pag.setId_Dep(rs.getString("id_Dep"));
                list.add(pag);
            }
        } catch (Exception e) {
        }
    return list;        
    }

}
