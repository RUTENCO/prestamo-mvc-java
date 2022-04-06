
package interfaces;

import java.util.List;
import modelo.Persona;


public interface CRUD {
    //metodos abstractos
    public List listar();
    public Persona list(int id);
    public boolean add(Persona per);
    public boolean edit(Persona per);
    public boolean eliminar(int id);
    public List buscar(String texto);
}
