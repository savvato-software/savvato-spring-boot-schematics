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

import PACKAGE.controllers.dto.OBJNAME_CAPITALCAMELCASERequest;
import PACKAGE.dto.OBJNAME_CAPITALCAMELCASEDTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.services.OBJNAME_CAPITALCAMELCASEService;

@RestController
public class OBJNAME_CAPITALCAMELCASEAPIController {

	@Autowired
	OBJNAME_CAPITALCAMELCASEService OBJNAME_LOWERCAMELCASEService;
	
	OBJNAME_CAPITALCAMELCASEAPIController() {
			
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/create" }, method=RequestMethod.POST)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> createOBJNAME_CAPITALCAMELCASE(@RequestBody @Valid OBJNAME_CAPITALCAMELCASERequest request) {
		
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASEService.createNewOBJNAME_CAPITALCAMELCASE(request.userId, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE" }, method=RequestMethod.GET)
	public ResponseEntity<List<OBJNAME_CAPITALCAMELCASEDTO>> getAll() {
		
		List<OBJNAME_CAPITALCAMELCASEDTO> list = OBJNAME_LOWERCAMELCASEService.getAll();
		
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	@RequestMapping(value = { "/api/user/{userId}/OBJNAME_LOWERCAMELCASEs" }, method=RequestMethod.GET)
	public ResponseEntity<List<OBJNAME_CAPITALCAMELCASE>> getAllByUserId(@PathVariable Long userId) {
		
		List<OBJNAME_CAPITALCAMELCASE> list = OBJNAME_LOWERCAMELCASEService.getOBJNAME_CAPITALCAMELCASEsByUserId(userId);
		
		return ResponseEntity.status(HttpStatus.OK).body(list);
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASEId}" }, method=RequestMethod.GET)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> getById(@PathVariable Long OBJNAME_LOWERCAMELCASEId) {
		
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASEService.getById(OBJNAME_LOWERCAMELCASEId);
		
		return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
	}
	
	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASEId}" }, method=RequestMethod.PUT)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> update(@RequestBody @Valid OBJNAME_CAPITALCAMELCASERequest request) {
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASEService.update(request.id, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
	}

	@RequestMapping(value = { "/api/OBJNAME_LOWERCAMELCASE/{OBJNAME_LOWERCAMELCASEId}" }, method=RequestMethod.DELETE)
	public ResponseEntity<OBJNAME_CAPITALCAMELCASE> update(@RequestBody @Valid OBJNAME_CAPITALCAMELCASERequest request) {
		OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASEService.delete(request.id, request.name, request.description);
		
		if (OBJNAME_LOWERCAMELCASE == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			return ResponseEntity.status(HttpStatus.OK).body(OBJNAME_LOWERCAMELCASE);
		}
    }
}

