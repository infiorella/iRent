package Modelo;

public class Propietario {
    int id_Pro;
    String nomPro;
    int telPro;
    String nacionPro;
    int edadPro;
    String pass;

    public Propietario() {
    }

    public Propietario(int id_Pro, String nomPro, int telPro, String nacionPro, int edadPro, String pass) {
        this.id_Pro = id_Pro;
        this.nomPro = nomPro;
        this.telPro = telPro;
        this.nacionPro = nacionPro;
        this.edadPro = edadPro;
        this.pass = pass;
    }

    public int getId_Pro() {
        return id_Pro;
    }

    public void setId_Pro(int id_Pro) {
        this.id_Pro = id_Pro;
    }

    public String getNomPro() {
        return nomPro;
    }

    public void setNomPro(String nomPro) {
        this.nomPro = nomPro;
    }

    public int getTelPro() {
        return telPro;
    }

    public void setTelPro(int telPro) {
        this.telPro = telPro;
    }

    public String getNacionPro() {
        return nacionPro;
    }

    public void setNacionPro(String nacionPro) {
        this.nacionPro = nacionPro;
    }

    public int getEdadPro() {
        return edadPro;
    }

    public void setEdadPro(int edadPro) {
        this.edadPro = edadPro;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


    
}
