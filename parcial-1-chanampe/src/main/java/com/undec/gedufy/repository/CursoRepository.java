package com.undec.gedufy.repository;

import com.undec.gedufy.dto.CursoDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import com.undec.gedufy.model.Curso;

public interface CursoRepository extends JpaRepository<Curso, Integer> {
    Curso findOneById(Integer id);
}