package PACKAGE.dto;

import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;
import PACKAGE.entities.User;
import lombok.Builder;

@Builder
public class OBJNAME_CAPITALCAMELCASE()DTO {

    public Long id;
	public String name;
	public String description;
	public Long userId;
	public String userName;
    public Long lastUpdated;
    public Long created;
}
