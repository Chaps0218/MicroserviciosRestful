package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "sucursal_empleado")
@Getter
@Setter
public class SucursalEmpleado {

    @EmbeddedId
    private SucursalEmpleadoId id;

    @ManyToOne
    @MapsId("sucursalCodigo")
    @JoinColumn(name = "chr_sucucodigo", referencedColumnName = "chr_sucucodigo", columnDefinition = "CHAR(3)")
    private Sucursal sucursal;

    @ManyToOne
    @MapsId("empleadoCodigo")
    @JoinColumn(name = "chr_emplcodigo", referencedColumnName = "chr_emplcodigo", columnDefinition = "CHAR(4)") // ✅ Fix: Explicitly set CHAR(4)
    private Empleado empleado;

    public SucursalEmpleado(SucursalEmpleadoId id, Sucursal sucursal, Empleado empleado) {
        this.id = id;
        this.sucursal = sucursal;
        this.empleado = empleado;
    }

    public SucursalEmpleado() {}
}

