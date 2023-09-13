package PACKAGE.dto;

import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.entities.User;
import lombok.Builder;

@Builder
public class OBJNAME_CAPITALCAMELCASE()DTO {

	public String name;
	public String description;
	public Long userId;
	public String userName;
    public String lastUpdated;
    public String created;
}
