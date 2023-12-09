package Modelo;


public class Inquilino {

    int id_Inq;
    String nom;
    String ape;
    int tel;
    String id_Dep;
    String pass;
    String fechaIng;
    int tiempo;
    int id_Pro;
    int estado;

    public Inquilino() {
    }

    public Inquilino(int id_Inq, String nom, String ape, int tel, String id_Dep, String pass, String fechaIng, int tiempo, int id_Pro, int estado) {
        this.id_Inq = id_Inq;
        this.nom = nom;
        this.ape = ape;
        this.tel = tel;
        this.id_Dep = id_Dep;
        this.pass = pass;
        this.fechaIng = fechaIng;
        this.tiempo = tiempo;
        this.id_Pro = id_Pro;
        this.estado = estado;
    }

    public int getId_Inq() {
        return id_Inq;
    }

    public void setId_Inq(int id_Inq) {
        this.id_Inq = id_Inq;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public String getId_Dep() {
        return id_Dep;
    }

    public void setId_Dep(String id_Dep) {
        this.id_Dep = id_Dep;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFechaIng() {
        return fechaIng;
    }

    public void setFechaIng(String fechaIng) {
        this.fechaIng = fechaIng;
    }

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public int getId_Pro() {
        return id_Pro;
    }

    public void setId_Pro(int id_Pro) {
        this.id_Pro = id_Pro;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
}
