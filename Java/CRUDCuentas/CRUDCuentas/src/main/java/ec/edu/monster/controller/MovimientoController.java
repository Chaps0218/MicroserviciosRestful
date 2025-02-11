package ec.edu.monster.controller;

import ec.edu.monster.models.Movimiento;
import ec.edu.monster.services.MovimientoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/movimiento")
public class MovimientoController {

    private final MovimientoService movimientoService;

    public MovimientoController(MovimientoService movimientoService) {
        this.movimientoService = movimientoService;
    }

    // ✅ Get all movements for a specific `cuenta`
    @GetMapping("/{cuentaId}")
    public ResponseEntity<List<Movimiento>> getMovimientosByCuenta(@PathVariable String cuentaId) {
        List<Movimiento> movimientos = movimientoService.getMovimientosByCuenta(cuentaId);
        return ResponseEntity.ok(movimientos);
    }
}
