package ec.edu.monster.services;

import ec.edu.monster.models.Cliente;
import ec.edu.monster.models.ClienteRepository;
import ec.edu.monster.utils.PasswordUtils;
import org.springframework.stereotype.Service;
import java.util.Optional;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteService {

    private final ClienteRepository clienteRepository;

    public ClienteService(ClienteRepository clienteRepository) {
        this.clienteRepository = clienteRepository;
    }

    @Transactional
    public Cliente registerUser(Cliente cliente) {
        cliente.setCodigo(generateNextClienteCodigo());
        cliente.setPassword(PasswordUtils.hashPassword(cliente.getPassword())); // Hash Password
        return clienteRepository.save(cliente);
    }

    private String generateNextClienteCodigo() {
        // Get the latest inserted ID from the database
        String latestId = clienteRepository.findMaxCodigo();

        if (latestId == null) {
            return "00001";  // Default first ID
        }

        // Convert to integer, increment, and format as 5-digit zero-padded string
        int nextId = Integer.parseInt(latestId) + 1;
        return String.format("%05d", nextId);
    }

    public Optional<Cliente> loginUser(String email, String password) {
        String hashedPassword = PasswordUtils.hashPassword(password);
        Optional<Cliente> cliente = clienteRepository.findByEmailAndPassword(email, hashedPassword);

        // Remove password before returning the response
        cliente.ifPresent(c -> c.setPassword(null));

        return cliente;
    }

    public Cliente editUser(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    public boolean disableUser(String codigo) {
        Optional<Cliente> clienteOpt = clienteRepository.findById(codigo);
        if (clienteOpt.isPresent()) {
            Cliente cliente = clienteOpt.get();
            cliente.setDisabled(0);
            clienteRepository.save(cliente);
            return true;
        }
        return false;
    }
}
