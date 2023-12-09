package Interfaces;

import Modelo.Propietario;
import java.util.List;

public interface PropietarioCRUD {
       public boolean add(Propietario pro);
    public List listar();
    public Propietario list(int id_Pro);
    public boolean edit(Propietario pro); 
}
