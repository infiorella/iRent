package Modelo;

public class Pago {
    int id_Pago;
    String nomPago;
    String fechaVen;
    Double monto;
    String estado;
    String id_Dep;

    public Pago() {
    }

    public Pago(int id_Pago, String nomPago, String fechaVen, Double monto, String estado, String id_Dep) {
        this.id_Pago = id_Pago;
        this.nomPago = nomPago;
        this.fechaVen = fechaVen;
        this.monto = monto;
        this.estado = estado;
        this.id_Dep = id_Dep;
    }

    public int getId_Pago() {
        return id_Pago;
    }

    public void setId_Pago(int id_Pago) {
        this.id_Pago = id_Pago;
    }

    public String getNomPago() {
        return nomPago;
    }

    public void setNomPago(String nomPago) {
        this.nomPago = nomPago;
    }

    public String getFechaVen() {
        return fechaVen;
    }

    public void setFechaVen(String fechaVen) {
        this.fechaVen = fechaVen;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getId_Dep() {
        return id_Dep;
    }

    public void setId_Dep(String id_Dep) {
        this.id_Dep = id_Dep;
    }
    
    
}
