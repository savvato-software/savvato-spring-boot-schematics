package PACKAGE.services;

import java.util.List;

import PACKAGE.dto.OBJNAME_CAPITALCAMELCASE()DTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;

public interface OBJNAME_CAPITALCAMELCASE()Service {
	public OBJNAME_CAPITALCAMELCASE getById(Long id);

	public List<OBJNAME_CAPITALCAMELCASE()DTO> getAll();

	public OBJNAME_CAPITALCAMELCASE create(Long userId, String name, String description);

	public List<OBJNAME_CAPITALCAMELCASE> getByUserId(Long userId);

	public OBJNAME_CAPITALCAMELCASE update(Long id, String name, String description);

    public OBJNAME_CAPITALCAMELCASE delete(Long id);
}

