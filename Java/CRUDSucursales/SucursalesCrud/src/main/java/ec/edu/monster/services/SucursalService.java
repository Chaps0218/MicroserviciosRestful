package ec.edu.monster.services;

import ec.edu.monster.models.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SucursalService {

    private final SucursalRepository sucursalRepository;
    private final SucursalEmpleadoRepository sucursalEmpleadoRepository;
    private final EmpleadoRepository empleadoRepository;

    public SucursalService(SucursalRepository sucursalRepository, SucursalEmpleadoRepository sucursalEmpleadoRepository, EmpleadoRepository empleadoRepository) {
        this.sucursalRepository = sucursalRepository;
        this.sucursalEmpleadoRepository = sucursalEmpleadoRepository;
        this.empleadoRepository = empleadoRepository;
    }

    @Transactional
    public Sucursal createSucursal(Sucursal sucursal) {
        sucursal.setCodigo(generateNextSucursalCodigo());

        return sucursalRepository.save(sucursal);
    }

    private String generateNextSucursalCodigo() {
        String latestId = sucursalRepository.findMaxCodigo();

        if (latestId == null) {
            return "001";
        }

        int nextId = Integer.parseInt(latestId) + 1;
        return String.format("%03d", nextId);
    }

    public List<Sucursal> getAllSucursales() {
        return sucursalRepository.findAll();
    }

    public Sucursal updateSucursal(String id, Sucursal sucursalDetails) {
        Sucursal sucursal = sucursalRepository.findById(id).orElseThrow();
        sucursal.setNombre(sucursalDetails.getNombre());
        sucursal.setCiudad(sucursalDetails.getCiudad());
        sucursal.setDireccion(sucursalDetails.getDireccion());
        sucursal.setCuentaContable(sucursalDetails.getCuentaContable());
        sucursal.setLatitude(sucursalDetails.getLatitude());
        sucursal.setLongitude(sucursalDetails.getLongitude());
        return sucursalRepository.save(sucursal);
    }

    public void deleteSucursal(String id) {
        sucursalRepository.deleteById(id);
    }

    @Transactional
    public void assignEmpleadosToSucursal(String sucursalId, List<String> empleadoIds) {
        Sucursal sucursal = sucursalRepository.findById(sucursalId)
                .orElseThrow(() -> new RuntimeException("Sucursal not found"));

        for (String empleadoId : empleadoIds) {
            Empleado empleado = empleadoRepository.findById(empleadoId)
                    .orElseThrow(() -> new RuntimeException("Empleado not found"));

            SucursalEmpleadoId sucursalEmpleadoId = new SucursalEmpleadoId(sucursalId, empleadoId);

            SucursalEmpleado sucursalEmpleado = new SucursalEmpleado(sucursalEmpleadoId, sucursal, empleado);

            sucursalEmpleadoRepository.save(sucursalEmpleado);
        }
    }

    public List<Empleado> getEmpleadosBySucursal(String sucursalId) {
        return sucursalEmpleadoRepository.findEmpleadosBySucursal(sucursalId);
    }
}
