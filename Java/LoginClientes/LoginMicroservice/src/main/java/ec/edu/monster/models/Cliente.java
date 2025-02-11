package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cliente")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Cliente {

    @Id
    @Column(name = "chr_cliecodigo", length = 5, columnDefinition = "CHAR(5)")
    private String codigo;

    @Column(name = "vch_cliepaterno", nullable = false, length = 25)
    private String apellidoPaterno;

    @Column(name = "vch_cliematerno", nullable = false, length = 25)
    private String apellidoMaterno;

    @Column(name = "vch_clienombre", nullable = false, length = 30)
    private String nombre;

    @Column(name = "chr_cliedni", nullable = false, length = 8, unique = true)
    private String dni;

    @Column(name = "vch_clieciudad", nullable = false, length = 30)
    private String ciudad;

    @Column(name = "vch_cliedireccion", nullable = false, length = 50)
    private String direccion;

    @Column(name = "vch_clietelefono", length = 20)
    private String telefono;

    @Column(name = "vch_clieemail", nullable = false, length = 50, unique = true)
    private String email;

    @Column(name = "vch_clipassword", nullable = false, length = 300)
    private String password;

    @Column(name = "vch_disabled", nullable = false)
    private Integer disabled = 1;

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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getDisabled() {
        return disabled;
    }

    public void setDisabled(Integer disabled) {
        this.disabled = disabled;
    }
}
