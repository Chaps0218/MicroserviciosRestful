package ec.edu.monster.models;


import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<Usuario, String> {
    Optional<Usuario> findByUsuarioAndClave(String usuario, String clave);
}
