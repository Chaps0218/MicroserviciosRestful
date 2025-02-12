package ec.edu.monster.services;

import ec.edu.monster.dto.CuentaDTO;
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

    @Transactional
    public Optional<Cuenta> updateCuenta(String cuentaId, Cuenta updatedCuenta) {
        return cuentaRepository.findById(cuentaId)
                .map(existingCuenta -> {
                    if (updatedCuenta.getMonedaCodigo() != null) {
                        existingCuenta.setMonedaCodigo(updatedCuenta.getMonedaCodigo());
                    }
                    if (updatedCuenta.getSucursalCodigo() != null) {
                        existingCuenta.setSucursalCodigo(updatedCuenta.getSucursalCodigo());
                    }
                    if (updatedCuenta.getEmpleadoCodigo() != null) {
                        existingCuenta.setEmpleadoCodigo(updatedCuenta.getEmpleadoCodigo());
                    }
                    if (updatedCuenta.getClienteCodigo() != null) {
                        existingCuenta.setClienteCodigo(updatedCuenta.getClienteCodigo());
                    }
                    if (updatedCuenta.getSaldo() != null) {
                        existingCuenta.setSaldo(updatedCuenta.getSaldo());
                    }
                    if (updatedCuenta.getEstado() != null) {
                        existingCuenta.setEstado(updatedCuenta.getEstado());
                    }
                    if (updatedCuenta.getClave() != null) {
                        existingCuenta.setClave(updatedCuenta.getClave());
                    }
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

    public List<CuentaDTO> getCuentasByClienteFull(String clienteId) {
        return cuentaRepository.findCuentasByCliente(clienteId);
    }
}
