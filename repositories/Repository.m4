package PACKAGE.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import PACKAGE.entities.OBJNAME_CAPITALCAMELCASE;

public interface OBJNAME_CAPITALCAMELCASERepository extends CrudRepository<OBJNAME_CAPITALCAMELCASE, Long> {

	List<OBJNAME_CAPITALCAMELCASE> findByUserId(Long userId);
}
