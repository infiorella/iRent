package Modelo;

public class Servicio {
    int id_Ser;
    String nom;
    Double costo;
    String id_Dep;

    public Servicio() {
    }

    public Servicio(int id_Ser, String nom, Double costo, String id_Dep) {
        this.id_Ser = id_Ser;
        this.nom = nom;
        this.costo = costo;
        this.id_Dep = id_Dep;
    }

    public int getId_Ser() {
        return id_Ser;
    }

    public void setId_Ser(int id_Ser) {
        this.id_Ser = id_Ser;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public String getId_Dep() {
        return id_Dep;
    }

    public void setId_Dep(String id_Dep) {
        this.id_Dep = id_Dep;
    }
    
    
}
