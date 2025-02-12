package ec.edu.monster.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "moneda")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Moneda {

    @Id
    @Column(name = "chr_monecodigo", length = 2, columnDefinition = "CHAR(2)")
    private String codigo;

    @Column(name = "vch_monedescripcion", length = 50)
    private String nombre;
}
