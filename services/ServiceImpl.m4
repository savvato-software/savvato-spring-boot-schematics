package PACKAGE.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PACKAGE.dto.OBJNAME_CAPITALCAMELCASEDTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.entities.User;
import PACKAGE.repositories.OBJNAME_CAPITALCAMELCASERepository;

@Service
public class OBJNAME_CAPITALCAMELCASEServiceImpl implements OBJNAME_CAPITALCAMELCASEService {

	@Autowired
	OBJNAME_CAPITALCAMELCASERepository OBJNAME_LOWERCAMELCASERepo;

	@Autowired
	UserService userService;

//	@Autowired
//	UserRoleMapService userRoleMapService;


	public OBJNAME_CAPITALCAMELCASE createNewOBJNAME_CAPITALCAMELCASE(Long userId, String name, String description) {
		OBJNAME_CAPITALCAMELCASE entity = new OBJNAME_CAPITALCAMELCASE(userId, name, description);

		OBJNAME_CAPITALCAMELCASE rtn = OBJNAME_LOWERCAMELCASERepo.save(entity);

//		userRoleMapService.addRoleToUser(userId, UserRoleMapService.ROLES.IDE ATOR);

		return rtn;
	}

	public List<OBJNAME_CAPITALCAMELCASE> getOBJNAME_CAPITALCAMELCASEsByUserId(Long userId) {
		return OBJNAME_LOWERCAMELCASERepo.findByUserId(userId);
	}

	public List<OBJNAME_CAPITALCAMELCASEDTO> getAll() {
		Iterable<OBJNAME_CAPITALCAMELCASE> iterable = OBJNAME_LOWERCAMELCASERepo.findAll();

		Iterator<OBJNAME_CAPITALCAMELCASE> iterator = iterable.iterator();

		List<OBJNAME_CAPITALCAMELCASEDTO> list = new ArrayList<>();

		while (iterator.hasNext()) {
			OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = iterator.next();

			// TODO.. some caching of some sort is necessary here.. to keep from reading the database so many times.
			User u = userService.findById(OBJNAME_LOWERCAMELCASE.getUserId());

			OBJNAME_CAPITALCAMELCASEDTO rtn = new OBJNAME_CAPITALCAMELCASEDTO();
			rtn.OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE;
			rtn.user = u;

			list.add(rtn);
		}

		return list;
	}

	public OBJNAME_CAPITALCAMELCASE getById(Long OBJNAME_LOWERCAMELCASEId) {
		Optional<OBJNAME_CAPITALCAMELCASE> opt = OBJNAME_LOWERCAMELCASERepo.findById(OBJNAME_LOWERCAMELCASEId);

		if (opt.isPresent())
			return opt.get();
		else
			return null;
	}

	public OBJNAME_CAPITALCAMELCASE update(Long OBJNAME_LOWERCAMELCASEId, String name, String description) {
		Optional<OBJNAME_CAPITALCAMELCASE> opt = OBJNAME_LOWERCAMELCASERepo.findById(OBJNAME_LOWERCAMELCASEId);

		if (opt.isPresent()) {

			OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = opt.get();

			OBJNAME_LOWERCAMELCASE.setName(name);
			OBJNAME_LOWERCAMELCASE.setDescription(description);

			return OBJNAME_LOWERCAMELCASERepo.save(OBJNAME_LOWERCAMELCASE);
		} else {
			return null;
		}
	}

	public OBJNAME_CAPITALCAMELCASE delete(Long OBJNAME_LOWERCAMELCASEId) {

	    // TODO

	}
}
