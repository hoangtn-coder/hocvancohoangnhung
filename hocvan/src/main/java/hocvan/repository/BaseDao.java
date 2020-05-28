package hocvan.repository;

import java.io.Serializable;
import java.io.StringWriter;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

//import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.resource.transaction.spi.TransactionStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;

//import com.fasterxml.jackson.databind.ObjectMapper;

import common.util.Formater;
//import common.util.ResourceException;
//import entity.frwk.SysUsers;
//import entity.frwk.UserLog;
//import frwk.controller.SearchParam;
//import frwk.utils.ApplicationContext;

@Transactional
public abstract class BaseDao<T> {

//	private static final Logger logger = Logger.getLogger(BaseDao.class);
	private static SessionFactory ssSessionFactory;

	@PostConstruct
	public void init() {
		ssSessionFactory = getSessionFactory();
	}

	public Session getThreadSession() {
		return getCurrentSession();
	}

	public Session openNewSession() {
		if (getSessionFactory() != null)
			return getSessionFactory().openSession();
		return ssSessionFactory.openSession();

	}

	public Session getCurrentSession() {
		if (getSessionFactory() != null)
			return getSessionFactory().getCurrentSession();
		return ssSessionFactory.getCurrentSession();

	}

	@Autowired
	private HttpSession session;
//	public SysUsers getSessionUser() {
//		ApplicationContext appContext = (ApplicationContext) session
//				.getAttribute(ApplicationContext.APPLICATIONCONTEXT);
//		return (SysUsers) appContext.getAttribute(ApplicationContext.USER);
//	}

	@Qualifier("httpSession")
	public abstract SessionFactory getSessionFactory();

//	public void save(T object) throws Exception {
//		try {
//			// ghi log
//			UserLog log = new UserLog();
//			Date date = new Date();
//			log.setUserId(getSessionUser().getUsername());
//			log.setModifyTime(date);
//
//			ClassMetadata m = getClassMetadata(object.getClass());
//			Serializable id = m.getIdentifier(object, (SessionImplementor) getCurrentSession());
//
//			if (id == null || "".equals(id) || "0".equals(id.toString())) {
//				getCurrentSession().save(object);
//				log.setAction("insert_" + object.getClass().getName());
//
//			} else {
//				getCurrentSession().merge(object);
//				log.setAction("edit_" + object.getClass().getName());
//			}
//
//			log.setRecordId(String.valueOf(getClassMetadata(object.getClass()).getIdentifier(object,
//					(SessionImplementor) getCurrentSession())));
//			StringWriter writer = new StringWriter();
//			new ObjectMapper().writeValue(writer, object);
//			log.setDetail(writer.toString());
//			writer.close();
//			getCurrentSession().save(log);
//			getCurrentSession().flush();
//		} catch (ConstraintViolationException e) {
//			if (e.getErrorCode() == 1)
//				throw new ResourceException(messageSource.getMessage("ORA_0001", null, "Default", null));
//			else if (e.getErrorCode() == 1400)
//				throw new ResourceException(messageSource.getMessage("ORA_1400", null, "Default", null));
//		}
//	}

	public Serializable getId(Object object) {
		return getClassMetadata(object.getClass()).getIdentifier(object, (SessionImplementor) getCurrentSession());
	}

	public ClassMetadata getClassMetadata(Class<?> clss) {
		return getSessionFactory().getClassMetadata(clss);
	}

	@Autowired
	MessageSource messageSource;

//	public void del(T entity) throws Exception {
//		try {
//			UserLog log = new UserLog();
//			Date date = new Date();
//			log.setUserId(getSessionUser().getUsername());
//			log.setModifyTime(date);
//			getCurrentSession().delete(entity);
//			getCurrentSession().flush();
//			log.setAction("del_" + entity.getClass().getName());
//			log.setRecordId(String.valueOf(getClassMetadata(entity.getClass()).getIdentifier(entity,
//					(SessionImplementor) getCurrentSession())));
//			StringWriter writer = new StringWriter();
//			new ObjectMapper().writeValue(writer, entity);
//			log.setDetail(writer.toString());
//			writer.close();
//			getCurrentSession().save(log);
//			getCurrentSession().flush();
//		} catch (ConstraintViolationException ex) {
//			logger.error(ex);
//			Throwable ex1 = ex.getCause();
//			if (ex1 instanceof SQLIntegrityConstraintViolationException) {
//				SQLIntegrityConstraintViolationException ex2 = (SQLIntegrityConstraintViolationException) ex1;
//				if (2292 == ex2.getErrorCode())
//					throw new ResourceException(messageSource.getMessage("ORA_2292", null, "Default", null));
//			}
//		}
//
//	}

	public <T> T get(Class<T> c, Serializable recordId) {
		Object o = null;
		Session ss = openNewSession();
		Transaction tx = null;
		try {
			tx = ss.beginTransaction();
			o = ss.get(c, recordId);
			tx.commit();
		} catch (Exception ex) {
//			logger.error(ex);
			if (tx != null)
				tx.rollback();
		} finally {
			ss.close();
		}
		if (o != null)
			return (T) o;
		return null;
	}

	@SuppressWarnings("unchecked")
	public <T> T getObject(Class<T> c, Serializable recordId) {
		return (T) getCurrentSession().get(c, recordId);
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> getAll(Class<T> clss) {
		return getCurrentSession().createCriteria(clss).list();
	}

	// Tim kiem

	private ArrayList<Criterion> restrictions = new ArrayList<Criterion>();
	private ArrayList<Order> orders = new ArrayList<Order>();

	public ArrayList<Criterion> getRestrictions() {
		return restrictions;
	}

	public void setRestrictions(ArrayList<Criterion> restrictions) {
		this.restrictions = restrictions;
	}

	public ArrayList<Order> getOrders() {
		return orders;
	}


	public void addRestriction(Criterion restriction) {
		restrictions.add(restriction);

	}

	public void addOrder(Order od) {
		orders.add(od);

	}

	@SuppressWarnings("unchecked")
	public ArrayList<T> search() {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(getGenericClass());

		// Dieu kien tim kiem
		for (Criterion criterion : getRestrictions())
			criteria.add(criterion);

		// Tham so tim kiem
//		if (getSearchParam() != null) {
//			criteria.setFirstResult(getSearchParam().getBeginIndex().intValue());
//			criteria.setMaxResults(getSearchParam().getPageSize());
//		}

		// Order
		if (!Formater.isNull(orders)) {
			for (Order order : orders)
				criteria.addOrder(order);
		}

		return (ArrayList<T>) criteria.list();

	}

	public long count() throws Exception {
		Class<T> cls = getGenericClass();
		long iRs = 0;
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(cls);
		// Dieu kien tim kiem
		for (Criterion criterion : this.getRestrictions())
			criteria.add(criterion);
		criteria.setProjection(Projections.rowCount());

		iRs = ((Long) criteria.uniqueResult()).intValue();
		return iRs;
	}

//	private SearchParam searchParam;
//
//	public SearchParam getSearchParam() {
//		return searchParam;
//	}
//
//	public void setSearchParam(SearchParam searchParam) {
//		this.searchParam = searchParam;
//	}

	/**
	 * Get object by thead session
	 * 
	 * @param c        c object class
	 * @param recordId object id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T getObject(T o) throws Exception {
		if (o == null)
			throw new Exception("Object is null");
		ClassMetadata tmp = getClassMetadata(o.getClass());
		if (tmp == null)
			return o;
		Serializable identifier = tmp.getIdentifier(o, (SessionImplementor) getCurrentSession());
		return (T) getCurrentSession().get(o.getClass(), identifier);
	}

	private Class<T> getGenericClass() {
		Class<T> cls = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass())
				.getActualTypeArguments()[0];
		return cls;
	}

	public void endCurrentSession() throws Exception {
		try {
			Session sess = getCurrentSession();
			if (sess.getTransaction().getStatus() == TransactionStatus.ACTIVE)
				sess.getTransaction().commit();
			

		} catch (Exception ex1) {
//			logger.error(ex1);
			Session sess = getCurrentSession();
			if (sess.getTransaction().getStatus() == TransactionStatus.ACTIVE)
				sess.getTransaction().rollback();
			throw ex1;
		}finally {
			getCurrentSession().close();
		}
		getCurrentSession().beginTransaction();
	}
}
