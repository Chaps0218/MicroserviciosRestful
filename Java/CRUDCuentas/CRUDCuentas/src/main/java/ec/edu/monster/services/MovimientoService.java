package ec.edu.monster.services;

import ec.edu.monster.models.Movimiento;
import ec.edu.monster.models.MovimientoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovimientoService {

    private final MovimientoRepository movimientoRepository;

    public MovimientoService(MovimientoRepository movimientoRepository) {
        this.movimientoRepository = movimientoRepository;
    }

    public List<Movimiento> getMovimientosByCuenta(String cuentaId) {
        return movimientoRepository.findByCuentaCodigo(cuentaId);
    }
}
