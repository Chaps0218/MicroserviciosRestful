package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;

@Embeddable
@Getter
@Setter
public class SucursalEmpleadoId implements Serializable {

    @Column(name = "chr_sucucodigo", length = 3, columnDefinition = "CHAR(3)")
    private String sucursalCodigo;

    @Column(name = "chr_emplcodigo", length = 4, columnDefinition = "CHAR(4)")
    private String empleadoCodigo;

    public SucursalEmpleadoId(String sucursalCodigo, String empleadoCodigo) {
        this.sucursalCodigo = sucursalCodigo;
        this.empleadoCodigo = empleadoCodigo;
    }

    public SucursalEmpleadoId() {
    }
}
