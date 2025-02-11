package ec.edu.monster.controller;

import ec.edu.monster.models.Empleado;
import ec.edu.monster.models.Sucursal;
import ec.edu.monster.services.SucursalService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/sucursal")
public class SucursalController {

    private final SucursalService sucursalService;

    public SucursalController(SucursalService sucursalService) {
        this.sucursalService = sucursalService;
    }

    @PostMapping
    public ResponseEntity<Sucursal> createSucursal(@RequestBody Sucursal sucursal) {
        Sucursal savedSucursal = sucursalService.createSucursal(sucursal);
        return ResponseEntity.ok(savedSucursal);
    }

    @GetMapping
    public ResponseEntity<List<Sucursal>> getAllSucursales() {
        return ResponseEntity.ok(sucursalService.getAllSucursales());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Sucursal> updateSucursal(@PathVariable String id, @RequestBody Sucursal sucursalDetails) {
        return ResponseEntity.ok(sucursalService.updateSucursal(id, sucursalDetails));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSucursal(@PathVariable String id) {
        sucursalService.deleteSucursal(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{sucursalId}/assign-empleados")
    public ResponseEntity<Void> assignEmpleados(@PathVariable String sucursalId, @RequestBody List<String> empleadoIds) {
        sucursalService.assignEmpleadosToSucursal(sucursalId, empleadoIds);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{sucursalId}/empleados")
    public ResponseEntity<List<Empleado>> getEmpleadosBySucursal(@PathVariable String sucursalId) {
        List<Empleado> empleados = sucursalService.getEmpleadosBySucursal(sucursalId);
        return ResponseEntity.ok(empleados);
    }
}
