package PACKAGE.services;

import java.util.List;

import PACKAGE.dto.OBJNAME_CAPITALCAMELCASEDTO;
import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;

public interface OBJNAME_CAPITALCAMELCASEService {
	public OBJNAME_CAPITALCAMELCASE getById(Long OBJNAME_LOWERCAMELCASEId);

	public List<OBJNAME_CAPITALCAMELCASEDTO> getAll();

	public OBJNAME_CAPITALCAMELCASE create(Long userId, String name, String description);

	public List<OBJNAME_CAPITALCAMELCASE> getByUserId(Long userId);

	public OBJNAME_CAPITALCAMELCASE update(Long OBJNAME_LOWERCAMELCASEId, String name, String description);

    public OBJNAME_CAPITALCAMELCASE delete(Long OBJNAME_LOWERCAMELCASEId);
}

