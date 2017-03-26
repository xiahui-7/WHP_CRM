package com.whp.register.entity.vehicle;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.whp.framework.entity.IdEntity;

@Entity
@Table(name = "t_vehicle_inspection")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.wondersgroup.framework.entity.vehicle")
public class VehicleInstallation extends IdEntity {

	private static final long serialVersionUID = -8881474242781578450L;

	@Column(name = "add_item")
	private String addItem;				// 加装项
	
	@Column(name = "installation_time")
	private String installationTime;	// 加装时间
	
	@Column
	private String price;				// 价格明细

	public String getAddItem() {
		return addItem;
	}

	public void setAddItem(String addItem) {
		this.addItem = addItem;
	}

	public String getInstallationTime() {
		return installationTime;
	}

	public void setInstallationTime(String installationTime) {
		this.installationTime = installationTime;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
}
