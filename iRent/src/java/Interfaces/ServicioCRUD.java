package Interfaces;
import Modelo.Servicio;
import java.util.List;

public interface ServicioCRUD {
    public boolean add(Servicio ser);
    public List listar();
    public Servicio list(int id_Ser);
    public boolean edit(Servicio ser);    
}
