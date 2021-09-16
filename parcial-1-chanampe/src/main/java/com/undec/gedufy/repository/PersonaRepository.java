package com.undec.gedufy.repository;

import com.undec.gedufy.dto.PersonaDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import com.undec.gedufy.model.Persona;

import java.util.List;

public interface PersonaRepository extends JpaRepository<Persona, Integer> {
    List<Persona> findAllByNombreContaining(String nombre);

    Persona findOneByEmail(String email);
}