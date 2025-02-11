package ec.edu.monster.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "movimiento")
@Getter
@Setter
public class Movimiento {

    @EmbeddedId
    private MovimientoId id;

    @Temporal(TemporalType.DATE)
    @Column(name = "dtt_movifecha", nullable = false)
    private Date fecha;

    @Column(name = "chr_emplcodigo", length = 4, nullable = false, columnDefinition = "CHAR(4)")
    private String empleadoCodigo;

    @Column(name = "chr_tipocodigo", length = 3, nullable = false, columnDefinition = "CHAR(3)")
    private String tipoCodigo;

    @Column(name = "dec_moviimporte", precision = 12, scale = 2, nullable = false)
    private BigDecimal importe;

    @Column(name = "chr_cuenreferencia", length = 8, columnDefinition = "CHAR(8)")
    private String cuentaReferencia;

    @ManyToOne
    @JoinColumn(name = "chr_cuencodigo", referencedColumnName = "chr_cuencodigo", insertable = false, updatable = false)
    @JsonBackReference
    private Cuenta cuenta;

    public Movimiento(MovimientoId id, Date fecha, String empleadoCodigo, String tipoCodigo, BigDecimal importe, String cuentaReferencia, Cuenta cuenta) {
        this.id = id;
        this.fecha = fecha;
        this.empleadoCodigo = empleadoCodigo;
        this.tipoCodigo = tipoCodigo;
        this.importe = importe;
        this.cuentaReferencia = cuentaReferencia;
        this.cuenta = cuenta;
    }

    public Movimiento() {}

    public MovimientoId getId() {
        return id;
    }

    public void setId(MovimientoId id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEmpleadoCodigo() {
        return empleadoCodigo;
    }

    public void setEmpleadoCodigo(String empleadoCodigo) {
        this.empleadoCodigo = empleadoCodigo;
    }

    public String getTipoCodigo() {
        return tipoCodigo;
    }

    public void setTipoCodigo(String tipoCodigo) {
        this.tipoCodigo = tipoCodigo;
    }

    public BigDecimal getImporte() {
        return importe;
    }

    public void setImporte(BigDecimal importe) {
        this.importe = importe;
    }

    public String getCuentaReferencia() {
        return cuentaReferencia;
    }

    public void setCuentaReferencia(String cuentaReferencia) {
        this.cuentaReferencia = cuentaReferencia;
    }

    public Cuenta getCuenta() {
        return cuenta;
    }

    public void setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }
}
