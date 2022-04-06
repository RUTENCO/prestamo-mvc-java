
package modelo;

import java.math.BigDecimal;

public class Persona {
    
    protected int id;
    protected String nombre;
    protected String correo;
    protected String telefono;
    protected float valor_credito;
    protected float tasa_intere_mensual= 0.011f;
    protected int plazo_de_pago_mensual= 18;
    
    public Persona() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
   
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public float getValor_credito() { return valor_credito; }
    public void setValor_credito(float valor_credito) { this.valor_credito = valor_credito; }

    public float getTasa_intere_mensual() { return tasa_intere_mensual; }
    public void setTasa_intere_mensual(float tasa_intere_mensual) { this.tasa_intere_mensual = tasa_intere_mensual; }

    public int getPlazo_de_pago_mensual() { return plazo_de_pago_mensual; }
    public void setPlazo_de_pago_mensual(int plazo_de_pago_mensual) { this.plazo_de_pago_mensual = plazo_de_pago_mensual; }
       
}
