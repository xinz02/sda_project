package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import entity.FuelConsumption;
//import service.FuelConsumptionDao_usingJdbcTemplate;
import entity.Maintenance;


@Controller
@RequestMapping("/fuelconsumption")
public class FuelConsumptionController {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

	// Return insertFuelConsumptionPage based on user role
    @GetMapping("/insertFuelConsumptionPage")
    public String insertFuelConsumptionPage(HttpSession session) {
        
    	String role = (String) session.getAttribute("role");
    	
        if ("admin".equals(role)) {
        	return "redirect:/fuelconsumption/FuelListPage";
		} else {
			return "insertFuelConsumptionPage";
		}
    }
    
    // Insert fuel consumption
    @PostMapping("/insertFuelConsumption")
    public String insertFuelConsumption(@ModelAttribute FuelConsumption fuelConsumption, Model model) {
        
    	String sql = "INSERT INTO fuelconsumption (date, driverName, fuelCost, fuelType, vehicleNum, vehicleType) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

    	int numofRowAffected = jdbcTemplate.update(sql, 
                       fuelConsumption.getDate(),
                       fuelConsumption.getDriverName(),
                       fuelConsumption.getFuelCost(),
                       fuelConsumption.getFuelType(),
                       fuelConsumption.getVehicleNum(),
                       fuelConsumption.getVehicleType());

        if (numofRowAffected > 0) {
        	//insert success
            model.addAttribute("message", "Data inserted successfully!");
        } else {
        	// insert fail
            model.addAttribute("message", "Failed to insert data. Please try again.");
        }

        return "redirect:/fuelconsumption/FuelListPage";
    }
   
    // Return editFuelConsumptionPage based on user role
    @GetMapping("/editFuelConsumption")
    public String editFuelPage(HttpSession session, Model model) {
    	String role = (String) session.getAttribute("role");
    	if ("admin".equals(role)) {
    		return "redirect:/fuelconsumption/FuelListPage";
		} else {
			return "editFuelConsumptionPage";
		}
        
    }
    
    // Edit fuel consumption
    @PostMapping("/editFuelConsumption")
    public String edit(@RequestParam("fuelID") int fuelID,
                       @RequestParam("date") String date,
                       @RequestParam("fuelCost") double fuelCost,
                       @RequestParam("fuelType") String fuelType,
                       @RequestParam("vehicleNum") String vehicleNum,
                       @RequestParam("vehicleType") String vehicleType,
                       @RequestParam("driverName") String updatedDriverName,
                       Model model,
                       HttpSession session) {

        // Retrieve driver's name from the session
        String originalDriverName = (String) session.getAttribute("driverName");

        // Split the updated driver name if it contains multiple names
        String[] updatedDriverNames = updatedDriverName.split(",");

        // Use the first name
        String selectedDriverName = updatedDriverNames[0].trim();

        try {
            String sql = "UPDATE fuelconsumption SET date = ?, driverName = ?, fuelCost = ?, fuelType = ?, vehicleNum = ?, vehicleType = ? WHERE fuelID = ?";
            int rowsAffected = jdbcTemplate.update(sql, date, selectedDriverName, fuelCost, fuelType, vehicleNum, vehicleType, fuelID);

            if (rowsAffected > 0) {
            	// Edit success
                model.addAttribute("message", "Data updated successfully!");
            } else {
            	// Edit fail
                model.addAttribute("message", "Failed to update data. Please try again.");
            }
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace(); // Log the exception for debugging
            model.addAttribute("message", "An error occurred during the update.");
        }

        System.out.println("Original Driver's Name from Session: " + originalDriverName);
        System.out.println("Updated Driver's Name from Form: " + selectedDriverName);

        // Redirect to the main page
        return "redirect:/fuelconsumption/FuelListPage";
    }

    // Return FuelListPage based on user role
    @GetMapping("/FuelListPage")
    public String getFuelList(Model model, HttpSession session) {
    	
    	String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			String sql="SELECT * FROM fuelconsumption";
			List<FuelConsumption> fuel = jdbcTemplate.query(sql, new BeanPropertyRowMapper<FuelConsumption>(FuelConsumption.class));
			model.addAttribute("fuel", fuel);
        } else {
            // Redirect or show an error message for unauthorized users
        	String dName = (String) session.getAttribute("driverName");
        	String sql="SELECT * FROM fuelconsumption where driverName = ?";
        	List<FuelConsumption> fuel = jdbcTemplate.query(sql, new Object[]{dName}, new BeanPropertyRowMapper<FuelConsumption>(FuelConsumption.class));
        	model.addAttribute("fuel", fuel);
        }
        
        return "FuelListPage";
    }
    
    // Return fuelConsumptionDetailPage
    @GetMapping("/viewFuelConsumptionDetail/{fuelID}")
    public String viewFuelConsumptionDetail(@PathVariable int fuelID, Model model) {
        return "redirect:/fuelconsumption/FuelConsumptionDetailPage/" + fuelID;
    }

    // Get fuel consumption entry from database
    @GetMapping("/FuelConsumptionDetailPage")
    public String getFuel(@RequestParam("fuelID") int fuelID, Model model) {
    	
    	String sql = "SELECT * FROM fuelconsumption WHERE fuelID=?";
		try {
			FuelConsumption fuel = jdbcTemplate.queryForObject(sql, new Object[]{fuelID}, new BeanPropertyRowMapper<>(FuelConsumption.class));
			model.addAttribute("fuel", fuel);
	        return "FuelConsumptionDetailPage";
	        
	    } catch (EmptyResultDataAccessException e) {
	        // Handle the case when no result is found
	    	return "FuelConsumptionDetailPage";
	    }
    	
  
    }
    
    // Delete fuel consumption entry
    @PostMapping("/deleteFuelConsumption")
    public String delete(@RequestParam("fuelID") int fuelID, Model model, HttpSession session) {
    	
        String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			return "redirect:/fuelconsumption/FuelListPage";
		} else {
			String sql = "DELETE FROM fuelconsumption WHERE fuelID=?";
	    	int rowsAffected =  jdbcTemplate.update(sql, fuelID);

	        if (rowsAffected > 0) {
	            model.addAttribute("message", "Data deleted successfully!");
	        } else {
	            model.addAttribute("message", "Failed to delete data. Please try again.");
	        }
	        return "redirect:/fuelconsumption/FuelListPage";
		}
		
		
	 }
	
    
 
}
