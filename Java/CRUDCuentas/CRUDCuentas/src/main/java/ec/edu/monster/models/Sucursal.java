package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Entity
@Table(name = "sucursal")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Sucursal {

    @Id
    @Column(name = "chr_sucucodigo", length = 3, columnDefinition = "CHAR(3)")
    private String codigo;

    @Column(name = "vch_sucunombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "vch_sucuciudad", nullable = false, length = 30)
    private String ciudad;

    @Column(name = "vch_sucudireccion", length = 50)
    private String direccion;

    @Column(name = "int_sucucontcuenta", nullable = false)
    private int cuentaContable;

    @Column(name = "vch_latitud", nullable = false)
    private double latitude;

    @Column(name = "vch_longitud", nullable = false)
    private double longitude;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCuentaContable() {
        return cuentaContable;
    }

    public void setCuentaContable(int cuentaContable) {
        this.cuentaContable = cuentaContable;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
