package PACKAGE.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PACKAGE.dto.OBJNAME_CAPITALCAMELCASE()DTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.entities.User;
import PACKAGE.repositories.OBJNAME_CAPITALCAMELCASE()Repository;

@Service
public class OBJNAME_CAPITALCAMELCASE()ServiceImpl implements OBJNAME_CAPITALCAMELCASE()Service {

	@Autowired
	OBJNAME_CAPITALCAMELCASE()Repository OBJNAME_LOWERCAMELCASE()Repo;

	@Autowired
	UserService userService;

//	@Autowired
//	UserRoleMapService userRoleMapService;


	public OBJNAME_CAPITALCAMELCASE()DTO create(Long userId, String name, String description) {
		OBJNAME_CAPITALCAMELCASE entity = new OBJNAME_CAPITALCAMELCASE()(userId, name, description);

		OBJNAME_CAPITALCAMELCASE rtn = OBJNAME_LOWERCAMELCASE()Repo.save(entity);

//		userRoleMapService.addRoleToUser(userId, UserRoleMapService.ROLES.IDE ATOR);

		return rtn;
	}

	public List<OBJNAME_CAPITALCAMELCASE> getByUserId(Long userId) {
		return OBJNAME_LOWERCAMELCASE()Repo.findByUserId(userId);
	}

	public List<OBJNAME_CAPITALCAMELCASE()DTO> getAll() {
		Iterable<OBJNAME_CAPITALCAMELCASE> iterable = OBJNAME_LOWERCAMELCASE()Repo.findAll();

		Iterator<OBJNAME_CAPITALCAMELCASE> iterator = iterable.iterator();

		List<OBJNAME_CAPITALCAMELCASE()DTO> list = new ArrayList<>();

		while (iterator.hasNext()) {
			OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = iterator.next();

			// TODO.. some caching of some sort is necessary here.. to keep from reading the database so many times.
			Optional<User> opt = userService.findById(OBJNAME_LOWERCAMELCASE.getUserId());
			User u = opt.get();

			OBJNAME_CAPITALCAMELCASE()DTO rtn = new OBJNAME_CAPITALCAMELCASE()DTO();
			rtn.OBJNAME_LOWERCAMELCASE = OBJNAME_LOWERCAMELCASE;
			rtn.userId = u.getId();
			rtn.userName = u.getName();

			list.add(rtn);
		}

		return list;
	}

	public OBJNAME_CAPITALCAMELCASE()DTO getById(Long id) {
		Optional<OBJNAME_CAPITALCAMELCASE> opt = OBJNAME_LOWERCAMELCASE()Repo.findById(id);

		if (opt.isPresent())
		    OBJNAME_CAPITALCAMELCASE()DTO rtn = OBJNAME_CAPITALCAMELCASE()DTO().builder()

		        // TODO set return obj properties with opt.get()

		    .build();
			return rtn;
		else
			return null;
	}

	public OBJNAME_CAPITALCAMELCASE update(Long id, String name, String description) {
		Optional<OBJNAME_CAPITALCAMELCASE> opt = OBJNAME_LOWERCAMELCASE()Repo.findById(id);

		if (opt.isPresent()) {

			OBJNAME_CAPITALCAMELCASE OBJNAME_LOWERCAMELCASE = opt.get();

			OBJNAME_LOWERCAMELCASE.setName(name);
			OBJNAME_LOWERCAMELCASE.setDescription(description);

			return OBJNAME_LOWERCAMELCASE()Repo.save(OBJNAME_LOWERCAMELCASE);
		} else {
			return null;
		}
	}

	public OBJNAME_CAPITALCAMELCASE delete(Long id) {

	    // TODO
        return null;
	}
}
