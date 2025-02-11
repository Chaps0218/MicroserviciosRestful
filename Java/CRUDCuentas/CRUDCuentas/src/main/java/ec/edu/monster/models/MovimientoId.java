package ec.edu.monster.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
public class MovimientoId implements Serializable {

    @Column(name = "chr_cuencodigo", length = 8, columnDefinition = "CHAR(8)")
    private String cuentaCodigo;

    @Column(name = "int_movinumero")
    private int numeroMovimiento;

    public MovimientoId(String cuentaCodigo, int numeroMovimiento) {
        this.cuentaCodigo = cuentaCodigo;
        this.numeroMovimiento = numeroMovimiento;
    }

    public MovimientoId() {
    }

    public String getCuentaCodigo() {
        return cuentaCodigo;
    }

    public void setCuentaCodigo(String cuentaCodigo) {
        this.cuentaCodigo = cuentaCodigo;
    }

    public int getNumeroMovimiento() {
        return numeroMovimiento;
    }

    public void setNumeroMovimiento(int numeroMovimiento) {
        this.numeroMovimiento = numeroMovimiento;
    }
}
