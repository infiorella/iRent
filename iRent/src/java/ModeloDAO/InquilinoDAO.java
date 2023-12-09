
package ModeloDAO;

import Config.Conexion;
import Modelo.Inquilino;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import Interfaces.InquilinoCRUD;
import java.util.ArrayList;


public class InquilinoDAO implements InquilinoCRUD{
    Inquilino inq=new Inquilino();
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps,ps2, ps3;
    ResultSet rs;
    int r=0;
    
    @Override
    public int validar(Inquilino inq) {
    String sql="select * from inquilino where id_Inq=? and pass=?";
    
    int id_Inq=inq.getId_Inq();
    String pass=inq.getPass();
        
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            

            ps.setInt(1, inq.getId_Inq());
            ps.setString(2, inq.getPass());
            rs=ps.executeQuery();
            
            if(rs.next()){
                r=r+1;                
                inq.setId_Inq(rs.getInt("id_Inq"));
                inq.setPass(rs.getString("pass"));   
                
                ps2=con.prepareStatement("INSERT INTO loginquilino(id_Inq, pass ,estado,intento) "
                    + "VALUES(?,?,?,?)");
                
                ps2.setInt(1, id_Inq);
                ps2.setString(2, pass);
                ps2.setInt(3, 1);            
                ps2.setInt(4, 1);

                ps2.executeUpdate();
            } 
            
            
            if(r==1){
                return 1;
            } else{
                return 0;
            }
            
        }catch(Exception e){
            return 0;
        }
    }

    @Override
    public Inquilino list(int id_Inq) {
    String sql="select * from inquilino where id_Inq="+id_Inq;    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
           inq.setId_Inq(rs.getInt("id_Inq")); 
            inq.setNom(rs.getString("nom"));            
            inq.setApe(rs.getString("ape"));
            inq.setTel(rs.getInt("tel"));   
            inq.setFechaIng(rs.getString("fechaIng"));
            inq.setTiempo(rs.getInt("tiempo"));  
            inq.setId_Dep(rs.getString("id_Dep"));  
            inq.setPass(rs.getString("pass"));  
            
            }
        } catch (Exception e) {
        }
        return inq;   
    }

    @Override
    public boolean edit(Inquilino in) {
        String sql="update inquilino set nom='"+in.getNom()+"',"
                +"ape='"+in.getApe()+"',"
                + "tel='"+in.getTel()+"',"
                +"fechaIng='"+in.getFechaIng()+"',"
                + "id_Dep='"+in.getId_Dep()+"',"
                + "tiempo='"+in.getTiempo()+"',"
                + "pass='"+in.getPass()+"'"                         
                +" where id_Inq='"+in.getId_Inq()+"'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;    
    }
    
     public List buscarInquilino(String id_Dep) {
        ArrayList<Inquilino> list=new ArrayList<>();
        Inquilino c=new Inquilino();
        String sql="SELECT * FROM inquilino WHERE id_Dep="+id_Dep;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_Inq(rs.getInt("id_Inq"));
                c.setNom(rs.getString("nom"));
                c.setApe(rs.getString("ape"));
                c.setTel(rs.getInt("tel"));
                c.setFechaIng(rs.getString("fechaIng"));
                c.setTiempo(rs.getInt("tiempo"));
                c.setId_Dep(rs.getString("id_Dep"));
                c.setPass(rs.getString("pass"));
                list.add(c);
            }
        } catch (Exception e){
        }
        return list;
    }

    @Override
    public List listar() {
    ArrayList<Inquilino> list=new ArrayList<>();
    String sql="select * from inquilino";    
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
           inq.setId_Inq(rs.getInt("id_Inq")); 
            inq.setNom(rs.getString("nom"));            
            inq.setApe(rs.getString("ape"));
            inq.setTel(rs.getInt("tel"));   
            inq.setFechaIng(rs.getString("fechaIng"));
            inq.setTiempo(rs.getInt("tiempo"));  
            inq.setId_Dep(rs.getString("id_Dep"));  
            inq.setPass(rs.getString("pass"));  
            
            list.add(inq);
            }
        } catch (Exception e) {
        }
        return list;       }

    @Override
    public boolean add(Inquilino inq) {
        try {
            con=cn.getConnection();
            ps=con.prepareStatement("INSERT INTO inquilino (id_Inq, nom, ape, tel, fechaIng, tiempo, id_Dep, pass, id_Pro,estado)"
                    + " values(?,?,?,?,?,?,?,?,?,?)");
                        
            ps.setInt(1, inq.getId_Inq());
            ps.setString(2, inq.getNom());
            ps.setString(3, inq.getApe());
            ps.setInt(4, inq.getTel());
            ps.setString(5, inq.getFechaIng());
            ps.setInt(6, inq.getTiempo());
            ps.setString(7, inq.getId_Dep());
            ps.setString(8, inq.getPass());
            ps.setInt(9, inq.getId_Pro());
            ps.setInt(10, inq.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;       
    }
    
    public boolean eliminar(int id_Inq, String id_Dep) {
        String sql="update inquilino set estado='"+2+"' , id_Dep=NULL "                       
                +" where id_Inq="+id_Inq;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
            String sql2="update departamento set estado='Libre' where id_Dep='"+id_Dep+"'";
            con=cn.getConnection();
            ps2=con.prepareStatement(sql2);
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;    
    }
    
        public boolean registrar(Inquilino in) {
        String sql="update inquilino set estado='"+1+"' , id_Dep='"+in.getId_Dep()+"' , tiempo='"+in.getTiempo()+"' "                       
                +" where id_Inq="+in.getId_Inq();
        try {
             con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
            String sql2="update departamento set estado='Ocupado' where id_Dep='"+in.getId_Dep()+"'";
            con=cn.getConnection();
            ps2=con.prepareStatement(sql2);
            ps2.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error "+e);
        }
        return false;    
    }
        
         public Inquilino buscar(int id_Inq){
        Inquilino i=new Inquilino();
        String sql="SELECT * FROM inquilino WHERE id_Inq="+id_Inq;
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
                        
            while(rs.next()){
                i.setId_Inq(rs.getInt("id_Inq"));
                i.setNom(rs.getString("nom"));
                i.setApe(rs.getString("ape"));
                i.setTel(rs.getInt("tel"));
                i.setFechaIng(rs.getString("fechaIng"));
                i.setTiempo(rs.getInt("tiempo"));
                i.setId_Dep(rs.getString("id_Dep"));
                i.setPass(rs.getString("pass"));
                i.setId_Pro(rs.getInt("id_Pro"));
                 
            }
        } catch(Exception e){
        }
        
        return i;
    }
}

