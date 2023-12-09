package Interfaces;

import Modelo.Inquilino;
import java.util.List;

public interface InquilinoCRUD {
   public Inquilino list(int id_Inq);
   public boolean edit(Inquilino in);
   public int validar(Inquilino inq);
   public List listar(); 
    public boolean add(Inquilino inq);
   
}
