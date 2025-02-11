package ec.edu.monster.models;

import ec.edu.monster.models.Sucursal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SucursalRepository extends JpaRepository<Sucursal, String> {

    // ✅ Get the highest `chr_sucucodigo` (latest entry)
    @Query("SELECT MAX(s.codigo) FROM Sucursal s")
    String findMaxCodigo();
}

