package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "usuario")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {

    @Id
    @Column(name = "chr_emplcodigo", length = 4, columnDefinition = "CHAR(4)")
    private String codigo;

    @Column(name = "vch_emplusuario", nullable = false, unique = true, length = 20)
    private String usuario;

    @Column(name = "vch_emplclave", nullable = false, length = 300)
    private String clave;

    @Column(name = "vch_emplestado", length = 15)
    private String estado;

    @OneToOne
    @JoinColumn(name = "chr_emplcodigo", referencedColumnName = "chr_emplcodigo", insertable = false, updatable = false)
    private Empleado empleado;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
}
