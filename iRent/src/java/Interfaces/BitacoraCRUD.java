package Interfaces;

import Modelo.Bitacora;
import java.util.List;

public interface BitacoraCRUD {
    public boolean add(Bitacora bi);
    public List listar();
    public Bitacora list(int id_Bit);
    public boolean edit(Bitacora bi);
}
