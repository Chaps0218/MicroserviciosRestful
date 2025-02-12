package ec.edu.monster.models;

import ec.edu.monster.dto.CuentaDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CuentaRepository extends JpaRepository<Cuenta, String> {

    @Query("SELECT MAX(c.codigo) FROM Cuenta c WHERE c.sucursalCodigo = :sucursalCodigo")
    String findMaxCuentaCodigo(String sucursalCodigo);

    List<Cuenta> findByClienteCodigo(String clienteCodigo);

    @Query("""
        SELECT new ec.edu.monster.dto.CuentaDTO(
            c.codigo,
            c.monedaCodigo, m.nombre,
            c.sucursalCodigo, s.nombre,
            c.empleadoCodigo, e.nombre,
            c.clienteCodigo, cl.nombre,
            c.saldo,
            c.fechaCreacion,
            c.estado,
            c.contadorMovimientos
        )
        FROM Cuenta c
        JOIN Moneda m ON c.monedaCodigo = m.codigo
        JOIN Sucursal s ON c.sucursalCodigo = s.codigo
        JOIN Empleado e ON c.empleadoCodigo = e.codigo
        JOIN Cliente cl ON c.clienteCodigo = cl.codigo
        WHERE c.clienteCodigo = :clienteId
    """)
    List<CuentaDTO> findCuentasByCliente(String clienteId);

}
