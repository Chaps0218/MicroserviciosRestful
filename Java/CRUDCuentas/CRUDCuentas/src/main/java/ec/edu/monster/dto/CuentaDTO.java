package ec.edu.monster.dto;

import java.math.BigDecimal;
import java.util.Date;

public class CuentaDTO {
    private String codigo;
    private String monedaCodigo;
    private String monedaNombre;
    private String sucursalCodigo;
    private String sucursalNombre;
    private String empleadoCodigo;
    private String empleadoNombre;
    private String clienteCodigo;
    private String clienteNombre;
    private BigDecimal saldo;
    private Date fechaCreacion;
    private String estado;
    private int contadorMovimientos;

    public CuentaDTO(
            String codigo,
            String monedaCodigo, String monedaNombre,
            String sucursalCodigo, String sucursalNombre,
            String empleadoCodigo, String empleadoNombre,
            String clienteCodigo, String clienteNombre,
            BigDecimal saldo,
            Date fechaCreacion,
            String estado,
            int contadorMovimientos
    ) {
        this.codigo = codigo;
        this.monedaCodigo = monedaCodigo;
        this.monedaNombre = monedaNombre;
        this.sucursalCodigo = sucursalCodigo;
        this.sucursalNombre = sucursalNombre;
        this.empleadoCodigo = empleadoCodigo;
        this.empleadoNombre = empleadoNombre;
        this.clienteCodigo = clienteCodigo;
        this.clienteNombre = clienteNombre;
        this.saldo = saldo;
        this.fechaCreacion = fechaCreacion;
        this.estado = estado;
        this.contadorMovimientos = contadorMovimientos;
    }

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

    public String getMonedaNombre() {
        return monedaNombre;
    }

    public void setMonedaNombre(String monedaNombre) {
        this.monedaNombre = monedaNombre;
    }

    public String getSucursalCodigo() {
        return sucursalCodigo;
    }

    public void setSucursalCodigo(String sucursalCodigo) {
        this.sucursalCodigo = sucursalCodigo;
    }

    public String getSucursalNombre() {
        return sucursalNombre;
    }

    public void setSucursalNombre(String sucursalNombre) {
        this.sucursalNombre = sucursalNombre;
    }

    public String getEmpleadoCodigo() {
        return empleadoCodigo;
    }

    public void setEmpleadoCodigo(String empleadoCodigo) {
        this.empleadoCodigo = empleadoCodigo;
    }

    public String getEmpleadoNombre() {
        return empleadoNombre;
    }

    public void setEmpleadoNombre(String empleadoNombre) {
        this.empleadoNombre = empleadoNombre;
    }

    public String getClienteCodigo() {
        return clienteCodigo;
    }

    public void setClienteCodigo(String clienteCodigo) {
        this.clienteCodigo = clienteCodigo;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
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
}
