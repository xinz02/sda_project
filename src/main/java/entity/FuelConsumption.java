package entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class FuelConsumption implements Serializable{
	
	private String date;
	private String driverName;
	private double fuelCost;
	private int fuelID;
	private String fuelType;
	private String vehicleNum;
	private String vehicleType;
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getDriverName() {
		return driverName;
	}
	
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	
	public double getFuelCost() {
		return fuelCost;
	}
	
	public void setFuelCost(double fuelCost) {
		this.fuelCost = fuelCost;
	}
	
	public int getFuelID() {
		return fuelID;
	}
	
	public void setFuelID(int fuelID) {
		this.fuelID = fuelID;
	}
	
	public String getFuelType() {
		return fuelType;
	}
	
	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
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
	
}
