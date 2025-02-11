package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Set;

@Entity
@Table(name = "empleado")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Empleado {

    @Id
    @Column(name = "chr_emplcodigo", length = 4, columnDefinition = "CHAR(4)")
    private String codigo;

    @Column(name = "vch_emplpaterno", nullable = false, length = 25)
    private String apellidoPaterno;

    @Column(name = "vch_emplmaterno", nullable = false, length = 25)
    private String apellidoMaterno;

    @Column(name = "vch_emplnombre", nullable = false, length = 30)
    private String nombre;

    @Column(name = "vch_emplciudad", nullable = false, length = 30)
    private String ciudad;

    @Column(name = "vch_empldireccion", length = 50)
    private String direccion;

    @OneToMany(mappedBy = "empleado", cascade = CascadeType.ALL)
    private Set<SucursalEmpleado> sucursalEmpleados;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
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

    public Set<SucursalEmpleado> getSucursalEmpleados() {
        return sucursalEmpleados;
    }

    public void setSucursalEmpleados(Set<SucursalEmpleado> sucursalEmpleados) {
        this.sucursalEmpleados = sucursalEmpleados;
    }
}

