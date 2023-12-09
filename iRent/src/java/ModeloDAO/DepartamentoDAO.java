package ModeloDAO;

import Config.Conexion;
import Interfaces.DepartamentoCRUD;
import Modelo.Departamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO  implements DepartamentoCRUD {
    Conexion cn=new Conexion();
    Connection con;   
    PreparedStatement ps;
    ResultSet rs;
    
    Departamento dep=new Departamento();

    @Override
    public boolean add(Departamento dep) {
 try {
            con=cn.getConnection();
            ps=con.prepareStatement("insert into departamento(id_Dep, doDep, baDep, estado, monto, area, distrito, id_Pro) values(?,?,?,?,?,?,?,?)");
            
            ps.setString(1, dep.getId_Dep());
            ps.setInt(2, dep.getDoDep());
            ps.setInt(3, dep.getBaDep());
            ps.setString(4, dep.getEstado());
            ps.setDouble(5, dep.getMonto());
            ps.setDouble(6, dep.getArea());
            ps.setString(7, dep.getDistrito());
            ps.setInt(8, dep.getId_Pro());
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;      
    }

    @Override
    public List listar() {
    ArrayList<Departamento> list=new ArrayList<>();
    String sql="select * from departamento";
        try {
            
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Departamento de=new Departamento();
                de.setId_Dep(rs.getString("id_Dep"));
                de.setDoDep(rs.getInt("doDep"));                
                de.setBaDep(rs.getInt("baDep"));   
                de.setEstado(rs.getString("estado"));
                de.setMonto(rs.getDouble("monto"));
                de.setArea(rs.getDouble("area"));
                de.setDistrito(rs.getString("distrito"));
                de.setId_Pro(rs.getInt("id_Pro"));
                list.add(de);
            }
        } catch (Exception e) {
        }
        return list;           
    }

    @Override
    public Departamento list(String id_Dep) {
        String sql="select * from departamento where id_Dep="+id_Dep;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){               
                dep.setId_Dep(rs.getString("id_Dep"));
                dep.setDoDep(rs.getInt("doDep"));                                
                dep.setBaDep(rs.getInt("baDep"));
                dep.setEstado(rs.getString("estado"));
                dep.setMonto(rs.getDouble("monto"));                                
                dep.setArea(rs.getDouble("area"));
                dep.setDistrito(rs.getString("distrito"));                                     
                dep.setId_Pro(rs.getInt("id_Pro"));  
            }
        } catch (Exception e) {
            System.out.println("error"+ e);
        }
        return dep;            
    }

    @Override
    public boolean edit(Departamento dep) {
        String sql="update departamento set doDep='"+dep.getDoDep()+"',"
                +"baDep='"+dep.getBaDep()+"',"
                + "estado='"+dep.getEstado()+"',"
                + "monto='"+dep.getMonto()+"',"
                +"area='"+dep.getArea()+"',"
                + "distrito='"+dep.getDistrito()+"',"
                + "id_Pro='"+dep.getId_Pro()
                +"' where id_Dep='"+dep.getId_Dep()+"'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;        
    }
    
    
    public Departamento buscarDepartamento(int id_Pro) {
        
        Departamento c=new Departamento();
        String sql="SELECT * FROM departamento WHERE id_Pro="+id_Pro;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Dep(rs.getString("id_Dep"));
                c.setDoDep(rs.getInt("doDep"));
                c.setBaDep(rs.getInt("baDep"));
                c.setEstado(rs.getString("estado"));
                c.setMonto(rs.getDouble("monto"));
                c.setArea(rs.getDouble("area"));
                c.setDistrito(rs.getString("distrito"));
                c.setId_Pro(rs.getInt("id_Pro"));
            }
        } catch (Exception e){
        }
        return c;
    }
    
     public List buscarDeps(int id_Pro) {
         ArrayList<Departamento> list=new ArrayList<>();
        Departamento c=new Departamento();
        String sql="SELECT * FROM departamento WHERE id_Pro="+id_Pro;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Dep(rs.getString("id_Dep"));
                c.setDoDep(rs.getInt("doDep"));
                c.setBaDep(rs.getInt("baDep"));
                c.setEstado(rs.getString("estado"));
                c.setMonto(rs.getDouble("monto"));
                c.setArea(rs.getDouble("area"));
                c.setDistrito(rs.getString("distrito"));
                c.setId_Pro(rs.getInt("id_Pro"));                
                list.add(c);
            }
        } catch (Exception e){
        }
        return list;
    }
     
         public List buscarID_Dep(String id_Dep) {
        ArrayList<Departamento> list=new ArrayList<>();
        Departamento c=new Departamento();
        String sql="SELECT * FROM departamento WHERE id_Dep="+id_Dep;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Dep(rs.getString("id_Dep"));
                c.setDoDep(rs.getInt("doDep"));
                c.setBaDep(rs.getInt("baDep"));
                c.setEstado(rs.getString("estado"));
                c.setMonto(rs.getDouble("monto"));
                c.setArea(rs.getDouble("area"));
                c.setDistrito(rs.getString("distrito"));
                c.setId_Pro(rs.getInt("id_Pro"));
                
                list.add(c);
            }
        } catch (Exception e){
        }
        return list;
    }
         
         public boolean actualizar(String id_Dep){                                 
            String sql="update departamento set estado='Ocupado' WHERE id_Dep='"+id_Dep+"'";
         try{
              con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();            
         }catch(Exception e){
             
         }         
         return false;
         }
         
          public boolean eliminar(String id_Dep){                                 
            String sql="delete from departamento WHERE id_Dep='"+id_Dep+"'";
         try{
              con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();            
         }catch(Exception e){
             
         }         
         return false;
         }
}
