package hocvan.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hocvan.entity.Slide;

@Repository(value = "slideDAO")
@Transactional(rollbackFor = Exception.class)
public class SlideDAO extends SysDao<Slide>{
	public List<Slide> getAll() {
		Criteria criteria = getCurrentSession().createCriteria(Slide.class);
		criteria.addOrder(Order.asc("position"));
		return criteria.list();
	}
}

