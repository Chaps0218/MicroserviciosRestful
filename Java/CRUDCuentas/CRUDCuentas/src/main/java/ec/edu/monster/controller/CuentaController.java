package ec.edu.monster.controller;

import ec.edu.monster.dto.CuentaDTO;
import ec.edu.monster.models.Cuenta;
import ec.edu.monster.services.CuentaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cuenta")
public class CuentaController {

    private final CuentaService cuentaService;

    public CuentaController(CuentaService cuentaService) {
        this.cuentaService = cuentaService;
    }

    @PostMapping
    public ResponseEntity<Cuenta> createCuenta(@RequestBody Cuenta cuenta) {
        return ResponseEntity.ok(cuentaService.createCuenta(cuenta));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cuenta> updateCuenta(@PathVariable String id, @RequestBody Cuenta cuenta) {
        return cuentaService.updateCuenta(id, cuenta)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}/estado/{estado}")
    public ResponseEntity<Void> changeEstado(@PathVariable String id, @PathVariable String estado) {
        return cuentaService.changeCuentaEstado(id, estado)
                ? ResponseEntity.ok().build()
                : ResponseEntity.notFound().build();
    }

    @GetMapping("/cliente-ids/{clienteId}")
    public ResponseEntity<List<Cuenta>> getCuentasByCliente(@PathVariable String clienteId) {
        return ResponseEntity.ok(cuentaService.getCuentasByCliente(clienteId));
    }

    @GetMapping("/cliente/{clienteId}")
    public ResponseEntity<List<CuentaDTO>> getCuentasByClienteFull(@PathVariable String clienteId) {
        return ResponseEntity.ok(cuentaService.getCuentasByClienteFull(clienteId));
    }
}
