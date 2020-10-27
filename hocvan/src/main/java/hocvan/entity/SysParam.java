package hocvan.entity;
// Generated Oct 19, 2020 2:49:59 PM by Hibernate Tools 5.2.12.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysParam generated by hbm2java
 */
@Entity
@Table(name = "sys_param", catalog = "hocvan")
public class SysParam implements java.io.Serializable {

	private String id;
	private String name;
	private String type;

	public SysParam() {
	}

	public SysParam(String id) {
		this.id = id;
	}

	public SysParam(String id, String name, String type) {
		this.id = id;
		this.name = name;
		this.type = type;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false, length = 40)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "type", length = 1)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
