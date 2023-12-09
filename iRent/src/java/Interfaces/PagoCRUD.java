package Interfaces;

import Modelo.Pago;
import java.util.List;

public interface PagoCRUD {
    public boolean add(Pago pa);
    public List listar();
    public Pago list(int id_Pago);
    public boolean edit(Pago pa);
    
    
}

