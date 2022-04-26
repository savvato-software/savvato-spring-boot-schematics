package PACKAGE.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import PACKAGE.controllers.dto.OBJNAME_CAPITALCAMELCASE()Request;
import PACKAGE.dto.OBJNAME_CAPITALCAMELCASE()DTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.services.OBJNAME_CAPITALCAMELCASE()Service;

@RestController
public class OBJNAME_CAPITALCAMELCASE()APIController {

	@Autowired
	OBJNAME_CAPITALCAMELCASE()Service OBJNAME_LOWERCAMELCASE()Service;
	
	OBJNAME_CAPITALCAMELCASE()APIController() {
			
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/create" }, method=RequestMethod.POST)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> create(@RequestBody @Valid OBJNAME_CAPITALCAMELCASE()Request request) {
		
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE()Service.create(request.userId, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE" }, method=RequestMethod.GET)
	public ResponseEntity<List<OBJNAME_CAPITALCAMELCASE()DTO>> getAll() {
		
		List<OBJNAME_CAPITALCAMELCASE()DTO> list = OBJNAME_LOWERCAMELCASE()Service.getAll();
		
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	@RequestMapping(value = { "/api/user/{userId}/OBJNAME_LOWERCAMELCASE()s" }, method=RequestMethod.GET)
	public ResponseEntity<List<OBJNAME_CAPITALCAMELCASE>> getAllByUserId(@PathVariable Long userId) {

		List<OBJNAME_CAPITALCAMELCASE> list = OBJNAME_LOWERCAMELCASE()Service.getByUserId(userId);
		
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASE()Id}" }, method=RequestMethod.GET)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> getById(@PathVariable Long OBJNAME_LOWERCAMELCASE()Id) {
		
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE()Service.getById(OBJNAME_LOWERCAMELCASE()Id);
		
		return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASE()Id}" }, method=RequestMethod.PUT)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> update(@RequestBody @Valid OBJNAME_CAPITALCAMELCASE()Request request) {
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE()Service.update(request.id, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
	}

	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASE()Id}" }, method=RequestMethod.DELETE)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> delete(@RequestBody @Valid OBJNAME_CAPITALCAMELCASE()Request request) {
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE()Service.delete(request.id, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
    }
}

