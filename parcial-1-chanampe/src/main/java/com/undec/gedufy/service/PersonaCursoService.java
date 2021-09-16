package com.undec.gedufy.service;

import com.undec.gedufy.dto.CursoDTO;
import com.undec.gedufy.dto.PersonaCursoDTO;
import com.undec.gedufy.dto.PersonaDTO;
import com.undec.gedufy.dto.Response;
import com.undec.gedufy.model.Curso;
import com.undec.gedufy.model.Persona;
import com.undec.gedufy.model.PersonaCurso;
import com.undec.gedufy.repository.CursoRepository;
import com.undec.gedufy.repository.PersonaCursoRepository;
import com.undec.gedufy.repository.PersonaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.NoSuchElementException;

/**
 * @author etorrielli
 */
@Service
public class PersonaCursoService {

    static final Logger LOGGER = LoggerFactory.getLogger(PersonaCursoService.class);

    @Autowired
    private PersonaCursoRepository personaCursoRepository;
    @Autowired
    private PersonaRepository personaRepository;
    @Autowired
    private CursoRepository cursoRepository;

    public Response findAll() {
        Response response = new Response();
        try {
            List<PersonaCursoDTO> personaCursoDTOList = new PersonaCursoDTO().getPersonaCursoDTOList(personaCursoRepository.findAll());
            response.setData(personaCursoDTOList);
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return response;
    }

    public Response findOneById(String id) {
        Response response = new Response();
        try {
            PersonaCurso personaCurso = personaCursoRepository.findById(Integer.parseInt(id)).get();
            response.setData(personaCurso);

        } catch (NoSuchElementException e) {
            LOGGER.error("No existe.");
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return response;
    }

    public Response update(Object input) {
        Response response = new Response();
        try {

            response.setData(input);

        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return response;
    }

    public Response save(PersonaCursoDTO input) {
        Response response = new Response();
        try {
            Curso cursoBuscado = cursoRepository.findOneById(input.getCursoDTO().getId());
            Persona personaBuscada = personaRepository.findOneByEmail(input.getPersonaDTO().getEmail());
            if(cursoBuscado != null && personaBuscada != null){
                PersonaCurso personaCurso = new PersonaCursoDTO().getPersonaCurso(input,cursoBuscado,personaBuscada);
                personaCursoRepository.save(personaCurso);
                response.setData(personaCurso);
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return response;
    }

    public Response delete(String id) {
        Response response = new Response();
        try {
            PersonaCurso personaCurso = personaCursoRepository.findById(Integer.parseInt(id)).get();
            personaCursoRepository.save(personaCurso);

            response.setMessage("Eliminado correctamente.");

        } catch (NoSuchElementException e) {
            LOGGER.error("No existe.");
        } catch (Exception e) {
            LOGGER.error("Error general.");
            throw e;
        }
        return response;
    }

}