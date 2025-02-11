package ec.edu.monster.services;

import ec.edu.monster.models.Cuenta;
import ec.edu.monster.models.CuentaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CuentaService {

    private final CuentaRepository cuentaRepository;

    public CuentaService(CuentaRepository cuentaRepository) {
        this.cuentaRepository = cuentaRepository;
    }

    @Transactional
    public Cuenta createCuenta(Cuenta cuenta) {
        cuenta.setCodigo(generateNextCuentaCodigo(cuenta.getSucursalCodigo()));
        return cuentaRepository.save(cuenta);
    }

    private String generateNextCuentaCodigo(String sucursalCodigo) {
        String latestId = cuentaRepository.findMaxCuentaCodigo(sucursalCodigo);
        int nextNumber = (latestId == null) ? 1 : Integer.parseInt(latestId.substring(3)) + 1;
        return sucursalCodigo + String.format("%05d", nextNumber);
    }

    public Optional<Cuenta> updateCuenta(String cuentaId, Cuenta cuentaDetails) {
        return cuentaRepository.findById(cuentaId).map(existingCuenta -> {
            existingCuenta.setSaldo(cuentaDetails.getSaldo());
            existingCuenta.setClave(cuentaDetails.getClave());
            return cuentaRepository.save(existingCuenta);
        });
    }

    public boolean changeCuentaEstado(String cuentaId, String estado) {
        return cuentaRepository.findById(cuentaId).map(cuenta -> {
            cuenta.setEstado(estado);
            cuentaRepository.save(cuenta);
            return true;
        }).orElse(false);
    }

    public List<Cuenta> getCuentasByCliente(String clienteId) {
        return cuentaRepository.findByClienteCodigo(clienteId);
    }
}
