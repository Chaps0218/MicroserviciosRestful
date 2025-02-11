package ec.edu.monster.models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CuentaRepository extends JpaRepository<Cuenta, String> {

    @Query("SELECT MAX(c.codigo) FROM Cuenta c WHERE c.sucursalCodigo = :sucursalCodigo")
    String findMaxCuentaCodigo(String sucursalCodigo);

    List<Cuenta> findByClienteCodigo(String clienteCodigo);
}
