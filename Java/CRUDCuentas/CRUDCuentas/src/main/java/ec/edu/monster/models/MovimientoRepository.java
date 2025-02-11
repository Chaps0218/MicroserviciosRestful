package ec.edu.monster.models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovimientoRepository extends JpaRepository<Movimiento, String> {

    List<Movimiento> findByCuentaCodigo(String cuentaCodigo);
}
