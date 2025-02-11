package ec.edu.monster.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "cuenta")
@Getter
@Setter
public class Cuenta {

    @Id
    @Column(name = "chr_cuencodigo", length = 8, columnDefinition = "CHAR(5)")
    private String codigo;

    @Column(name = "chr_monecodigo", length = 2, nullable = false, columnDefinition = "CHAR(2)")
    private String monedaCodigo;

    @Column(name = "chr_sucucodigo", length = 3, nullable = false, columnDefinition = "CHAR(3)")
    private String sucursalCodigo;

    @Column(name = "chr_emplcreacuenta", length = 4, nullable = false, columnDefinition = "CHAR(4)")
    private String empleadoCodigo;

    @Column(name = "chr_cliecodigo", length = 5, nullable = false, columnDefinition = "CHAR(5)")
    private String clienteCodigo;

    @Column(name = "dec_cuensaldo", precision = 12, scale = 2, nullable = false)
    private BigDecimal saldo;

    @Temporal(TemporalType.DATE)
    @Column(name = "dtt_cuenfechacreacion", nullable = false)
    private Date fechaCreacion;

    @Column(name = "vch_cuenestado", length = 15, nullable = false)
    private String estado;

    @Column(name = "int_cuencontmov", nullable = false)
    private int contadorMovimientos;

    @Column(name = "chr_cuenclave", length = 6, nullable = false, columnDefinition = "CHAR(6)")
    private String clave;

    @OneToMany(mappedBy = "cuenta", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonIgnore
    //@JsonManagedReference
    private List<Movimiento> movimientos;

    public Cuenta(String codigo, String monedaCodigo, String sucursalCodigo, String empleadoCodigo, String clienteCodigo, BigDecimal saldo, Date fechaCreacion, String estado, int contadorMovimientos, String clave, List<Movimiento> movimientos) {
        this.codigo = codigo;
        this.monedaCodigo = monedaCodigo;
        this.sucursalCodigo = sucursalCodigo;
        this.empleadoCodigo = empleadoCodigo;
        this.clienteCodigo = clienteCodigo;
        this.saldo = saldo;
        this.fechaCreacion = fechaCreacion;
        this.estado = estado;
        this.contadorMovimientos = contadorMovimientos;
        this.clave = clave;
        this.movimientos = movimientos;
    }

    public Cuenta() {}

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getMonedaCodigo() {
        return monedaCodigo;
    }

    public void setMonedaCodigo(String monedaCodigo) {
        this.monedaCodigo = monedaCodigo;
    }

    public String getSucursalCodigo() {
        return sucursalCodigo;
    }

    public void setSucursalCodigo(String sucursalCodigo) {
        this.sucursalCodigo = sucursalCodigo;
    }

    public String getEmpleadoCodigo() {
        return empleadoCodigo;
    }

    public void setEmpleadoCodigo(String empleadoCodigo) {
        this.empleadoCodigo = empleadoCodigo;
    }

    public String getClienteCodigo() {
        return clienteCodigo;
    }

    public void setClienteCodigo(String clienteCodigo) {
        this.clienteCodigo = clienteCodigo;
    }

    public BigDecimal getSaldo() {
        return saldo;
    }

    public void setSaldo(BigDecimal saldo) {
        this.saldo = saldo;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getContadorMovimientos() {
        return contadorMovimientos;
    }

    public void setContadorMovimientos(int contadorMovimientos) {
        this.contadorMovimientos = contadorMovimientos;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public List<Movimiento> getMovimientos() {
        return movimientos;
    }

    public void setMovimientos(List<Movimiento> movimientos) {
        this.movimientos = movimientos;
    }
}
