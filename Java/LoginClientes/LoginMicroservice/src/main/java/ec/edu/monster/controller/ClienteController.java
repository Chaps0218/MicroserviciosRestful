package ec.edu.monster.controller;

import ec.edu.monster.models.Cliente;
import ec.edu.monster.services.ClienteService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/cliente")
public class ClienteController {

    private final ClienteService clienteService;

    public ClienteController(ClienteService clienteService) {
        this.clienteService = clienteService;
    }

    @PostMapping("/register")
    public ResponseEntity<Cliente> registerUser(@RequestBody Cliente cliente) {
        Cliente savedCliente = clienteService.registerUser(cliente);
        savedCliente.setPassword(null); // Remove password before returning response
        return ResponseEntity.ok(savedCliente);
    }

    // ✅ Login (Returns user info without password)
    @PostMapping("/login")
    public ResponseEntity<Object> loginUser(@RequestParam String email, @RequestParam String password) {
        Optional<Cliente> cliente = clienteService.loginUser(email, password);
        return cliente.<ResponseEntity<Object>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.status(401).body("Invalid credentials"));
    }

    @PutMapping("/edit")
    public ResponseEntity<Cliente> editUser(@RequestBody Cliente cliente) {
        Cliente updatedCliente = clienteService.editUser(cliente);
        return ResponseEntity.ok(updatedCliente);
    }

    @PutMapping("/disable/{codigo}")
    public ResponseEntity<String> disableUser(@PathVariable String codigo) {
        boolean disabled = clienteService.disableUser(codigo);
        if (disabled) {
            return ResponseEntity.ok("User disabled successfully");
        } else {
            return ResponseEntity.badRequest().body("User not found");
        }
    }
}
