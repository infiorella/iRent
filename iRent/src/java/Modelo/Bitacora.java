package Modelo;

public class Bitacora {
    int id_Bit;
    String id_Dep;
    String tipo;
    String fecha;
    String mensaje;
    String nom;
    String estado;
    int id_Pro;   

    public Bitacora() {
    }

    public Bitacora(int id_Bit, String id_Dep, String tipo, String fecha, String mensaje, String nom, String estado, int id_Pro) {
        this.id_Bit = id_Bit;
        this.id_Dep = id_Dep;
        this.tipo = tipo;
        this.fecha = fecha;
        this.mensaje = mensaje;
        this.nom = nom;
        this.estado = estado;
        this.id_Pro = id_Pro;
    }

    public int getId_Bit() {
        return id_Bit;
    }

    public void setId_Bit(int id_Bit) {
        this.id_Bit = id_Bit;
    }

    public String getId_Dep() {
        return id_Dep;
    }

    public void setId_Dep(String id_Dep) {
        this.id_Dep = id_Dep;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_Pro() {
        return id_Pro;
    }

    public void setId_Pro(int id_Pro) {
        this.id_Pro = id_Pro;
    }
    
   

    
}
