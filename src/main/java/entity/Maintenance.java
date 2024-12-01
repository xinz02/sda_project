//package entity;
//
//import java.util.ArrayList;
//
//public interface Maintenance {
////	public static final int maintenanceID = 0;
////	public static final String vehicleType = "";
////	public static final String vehicleNum = "";
////	public static final String driverName = "";
////	public static final String date = "";
////	public static final String approveStatus = false;
//	
////	public Maintenance(String vehicleType, String vehicleNum, String driverName, String date) {
////		super();
////		this.vehicleType = vehicleType;
////		this.vehicleNum = vehicleNum;
////		this.driverName = driverName;
////		this.date = date;
////	}
//	
//	public void setMaintenanceID(int maintenanceID);
//	public void setVehicleType(String vehicleType);
//	public void setVehicleNum(String vehicleNum);
//	public void setDriverName(String driverName);
//	public void setDate(String date);
//		
//
//	public int getMaintenanceID();
//
//	public String getVehicleType();
//	
//	public String getVehicleNum();
//
//	public String getDriverName();
//
//	public String getDate();
//	
//	public String getApproveStatus();
//	
//	public void setApproveStatus(String approveStatus);
//	
//	public void Delete(int id);
//	
//	public void Edit(int maintenanceID, String vehicleType, String vehicleNum, String driverName, String date);
//	
//	public Maintenance findMaintenance(int id);
//	
//	public void Insert(Maintenance m);
//	
//	public ArrayList<Maintenance> RetrieveMaintenanceList();
//	
//	public void UpdateStatus(int id, String approveStatus);
//	
//	
//	
//}

package entity;

import java.util.ArrayList;

public class Maintenance {
	
	private int maintenanceID;
	private String driverName;
	private String vehicleNum;
	private String vehicleType;
	private String date;
	private String approveStatus;
	
	public Maintenance() {}

	public Maintenance(String driverName, String vehicleNum, String vehicleType, String date) {
		super();
		this.driverName = driverName;
		this.vehicleNum = vehicleNum;
		this.vehicleType = vehicleType;
		this.date = date;
	}

	public Maintenance(String driverName, String vehicleNum, String vehicleType, String date, String approveStatus) {
		super();
		this.driverName = driverName;
		this.vehicleNum = vehicleNum;
		this.vehicleType = vehicleType;
		this.date = date;
		this.approveStatus = approveStatus;
	}

	public int getMaintenanceID() {
		return maintenanceID;
	}

	public void setMaintenanceID(int maintenanceID) {
		this.maintenanceID = maintenanceID;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getVehicleNum() {
		return vehicleNum;
	}

	public void setVehicleNum(String vehicleNum) {
		this.vehicleNum = vehicleNum;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

}
