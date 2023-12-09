package Modelo;

public class Departamento {
    String id_Dep;
    int doDep;
    int baDep;
    String estado;
    Double monto;
    Double area;
    String distrito;
    int id_Pro;

    public Departamento() {
    }

    public Departamento(String id_Dep, int doDep, int baDep, String estado, Double monto, Double area, String distrito, int id_Pro) {
        this.id_Dep = id_Dep;
        this.doDep = doDep;
        this.baDep = baDep;
        this.estado = estado;
        this.monto = monto;
        this.area = area;
        this.distrito = distrito;
        this.id_Pro = id_Pro;
    }

    public String getId_Dep() {
        return id_Dep;
    }

    public void setId_Dep(String id_Dep) {
        this.id_Dep = id_Dep;
    }

    public int getDoDep() {
        return doDep;
    }

    public void setDoDep(int doDep) {
        this.doDep = doDep;
    }

    public int getBaDep() {
        return baDep;
    }

    public void setBaDep(int baDep) {
        this.baDep = baDep;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public int getId_Pro() {
        return id_Pro;
    }

    public void setId_Pro(int id_Pro) {
        this.id_Pro = id_Pro;
    }
    
    
    
}
