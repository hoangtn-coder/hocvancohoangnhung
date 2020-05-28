package hocvan.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hocvan.entity.Slide;

@Repository(value = "slideDAO")
@Transactional(rollbackFor = Exception.class)
public class SlideDAO extends SysDao<Slide>{
	
}

