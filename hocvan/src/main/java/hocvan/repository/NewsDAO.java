package hocvan.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import common.util.Formater;
import hocvan.entity.News;

@Repository(value = "newsDAO")
@Transactional(rollbackFor = Exception.class)
public class NewsDAO extends SysDao<News>{

	@Autowired
	private SessionFactory sessionFactory;

	public void save(final News news) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(news);
	}

	public void update(final News news) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(news);
	}

	public News findById(final String id) {
		Session session = this.sessionFactory.getCurrentSession();
		return session.get(News.class, id);
	}
	
	public void delete(final News news) {
		Session session = this.sessionFactory.getCurrentSession();
		session.remove(news);
	}
	
	public void temporaryDelete(final News news) {
		Session session = this.sessionFactory.getCurrentSession();
		news.setStatus("0");//deactive
		session.update(news);
	}

//	public List<News> findAll() {
//		Session session = this.sessionFactory.getCurrentSession();
//		 return session.createQuery("from News n ORDER BY n.createdDate DESC", News.class).getResultList();
//	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<News> getAll(String type) {
		Criteria criteria = getCurrentSession().createCriteria(News.class);
		criteria.add(Restrictions.ge("status", "1"));
		
		if(!Formater.isNull(type)) {
			criteria.add(Restrictions.ge("type", type));
		}
		
		criteria.addOrder(Order.desc("createdDate"));
		return criteria.list();
	}
	
	public List<News> search(String keyWord) {
		List<News> news = null;
		Criteria criteria = getCurrentSession().createCriteria(News.class);
		criteria.add(Restrictions.like("title", keyWord, MatchMode.ANYWHERE).ignoreCase());
		criteria.add(Restrictions.ge("status", "1"));
		criteria.addOrder(Order.desc("createdDate"));
		news = criteria.list();
		return news;
	}
	
	public Long getTotalResults(String keyWord, String type) {
		Criteria criteria = getCurrentSession().createCriteria(News.class);
		if(!Formater.isNull(keyWord)) {
			criteria.add(Restrictions.like("title", keyWord, MatchMode.ANYWHERE).ignoreCase());
		}
		criteria.add(Restrictions.ge("status", "1"));
		
		if(!Formater.isNull(type)) {
			criteria.add(Restrictions.ge("type", type));
		}
		
		criteria.setProjection(Projections.countDistinct("id"));
		return (Long) criteria.uniqueResult();
	}
	
	public List<News> find(int pageNumber, int pageSize,String keyWord,String type) {
		Criteria criteria = getCurrentSession().createCriteria(News.class);
		
		// Paging with unique IDs
		if(!Formater.isNull(keyWord)) {
			criteria.add(Restrictions.like("title", keyWord, MatchMode.ANYWHERE).ignoreCase());
		}
		criteria.setProjection(Projections.distinct(Projections.property("id")));
		if(pageSize > 0) {
			criteria.setFirstResult((pageNumber - 1) * pageSize);
			criteria.setMaxResults(pageSize);
		}
		criteria.add(Restrictions.ge("status", "1"));
		
		if(!Formater.isNull(type)) {
			criteria.add(Restrictions.ge("type", type));
		}
		
		criteria.addOrder(Order.desc("createdDate"));
		List uniqueList = criteria.list();
		
		// find by unique IDs
		if(uniqueList != null && uniqueList.size() > 0) { 
			criteria.setProjection(null);
			criteria.setFirstResult(0);
			criteria.setMaxResults(Integer.MAX_VALUE);
			criteria.add(Restrictions.in("id", uniqueList));
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.desc("createdDate"));
			return criteria.list();
		} else {
			return new ArrayList();
		}
	}

}
