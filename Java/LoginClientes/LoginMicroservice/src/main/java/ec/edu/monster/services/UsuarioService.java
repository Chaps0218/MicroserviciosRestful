package ec.edu.monster.services;

import ec.edu.monster.models.Usuario;
import ec.edu.monster.models.UsuarioRepository;
import ec.edu.monster.utils.PasswordUtils;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public Optional<Usuario> login(String usuario, String clave) {
        String hashedClave = PasswordUtils.hashPassword(clave);
        Optional<Usuario> usuarioOpt = usuarioRepository.findByUsuarioAndClave(usuario, hashedClave);

        // Check if user is "ACTIVO" and remove password from response
        return usuarioOpt.filter(u -> "ACTIVO".equalsIgnoreCase(u.getEstado()))
                .map(u -> {
                    u.setClave(null);
                    return u;
                });
    }
}
