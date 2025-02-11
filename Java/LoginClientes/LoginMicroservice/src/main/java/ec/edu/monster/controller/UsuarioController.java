package ec.edu.monster.controller;

import ec.edu.monster.models.Usuario;
import ec.edu.monster.services.UsuarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestParam String usuario, @RequestParam String clave) {
        Optional<Usuario> usuarioOpt = usuarioService.login(usuario, clave);
        return usuarioOpt.<ResponseEntity<Object>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(401).body("Invalid credentials or inactive user"));
    }
}
