package ec.edu.monster.models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SucursalEmpleadoRepository extends JpaRepository<SucursalEmpleado, String> {

    @Query("SELECT se.empleado FROM SucursalEmpleado se WHERE se.sucursal.codigo = :sucursalId")
    List<Empleado> findEmpleadosBySucursal(String sucursalId);
}
