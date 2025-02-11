package ec.edu.monster.models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface ClienteRepository extends JpaRepository<Cliente, String> {
    Optional<Cliente> findByEmailAndPassword(String email, String password);
    Optional<Cliente> findByEmail(String email);
    @Query("SELECT MAX(c.codigo) FROM Cliente c")
    String findMaxCodigo();
}
