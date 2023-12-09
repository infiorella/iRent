package Interfaces;

import Modelo.Departamento;
import java.util.List;

public interface DepartamentoCRUD {
    public boolean add(Departamento dep);
    public List listar();
    public Departamento list(String id_Dep);
    public boolean edit(Departamento dep);    
}
