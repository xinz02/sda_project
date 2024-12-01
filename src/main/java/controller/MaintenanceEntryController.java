package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Maintenance;


@Controller
@RequestMapping("/maintenance")
public class MaintenanceEntryController {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// Return maintenance list based on user role
	@GetMapping("/viewMaintenance")
	public String view(Model model, HttpSession session) {
		
		String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			String sql="SELECT * FROM maintenance";
			ArrayList<Maintenance> vmList = (ArrayList<Maintenance>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Maintenance>(Maintenance.class));
			model.addAttribute("vmList", vmList);
        } else {
            // Redirect or show an error message for unauthorized users
            String dName = (String) session.getAttribute("driverName");
            String sql="SELECT * FROM maintenance where driverName = ?";
    		ArrayList<Maintenance> vmList = (ArrayList<Maintenance>) jdbcTemplate.query(sql, new Object[]{dName}, new BeanPropertyRowMapper<Maintenance>(Maintenance.class));
            model.addAttribute("vmList", vmList);
        }

		return "MaintenanceListPage";
	}
	
	// Get specific maintenance entry
	@GetMapping("/viewDetail/{id}")
	public String viewDetails(@PathVariable int id, Model model) {

		String sql = "SELECT * FROM maintenance WHERE maintenanceID=?";
		Maintenance vm= jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Maintenance.class));
		
		if(vm != null) {
			model.addAttribute("vm", vm);
		} else {
			model.addAttribute("message", "Maintenance Entry not found. Please try again.");
			model.addAttribute("vm", vm);
		}

		return "MaintenanceEntryDetailPage";
	}
	
	// Approve maintenance
	@PostMapping("/approveMaintenance/{id}")
	public String approve(Model model, HttpSession session, @PathVariable int id, @RequestParam String approveStatus) {
		
		String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			
		String sql1 = "UPDATE maintenance SET approveStatus = ? WHERE maintenanceID = ?";
		int rowsAffected = jdbcTemplate.update(sql1, approveStatus, id);
		
		if (rowsAffected > 0) {
			// approve success
            model.addAttribute("message", "Status updated successfully!");
        } else {
        	// approve fail
            model.addAttribute("message", "Failed to update status. Please try again.");
        }
		}
		return "redirect:/maintenance/viewDetail/" + id;
	
		
	}

	// return add maintenance page
	@GetMapping("/addMaintenance")
	public String insertMaintenancePage(HttpSession session) {
		
		String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			return "redirect:/maintenance/viewMaintenance";
		} else {
			return "insertMaintenance";
		}
	}
	
	// Submit add maintenance request
	@PostMapping("/addMaintenance")
	public String add(@RequestParam String driverName, @RequestParam String date, @RequestParam String vehicleNum, @RequestParam String vehicleType, @RequestParam String approveStatus, Model model) {
		
		String sql = "INSERT INTO maintenance (vehicleType, vehicleNum, driverName, date, approveStatus) VALUES (?, ?, ?, ?, ?)";
        
		int rowsAffected =  jdbcTemplate.update(sql, vehicleType, vehicleNum, driverName, date, approveStatus);
		
		if (rowsAffected > 0) {
			
            model.addAttribute("message", "Data inserted successfully!");
        } else {
            model.addAttribute("message", "Failed to insert data. Please try again.");
        }
		
		return "redirect:/maintenance/viewMaintenance";
	}
	
	// Return edit maintenance detail page
	@GetMapping("/EditDetail/{id}")
	public String EditMaintenancePage(@PathVariable int id, Model model, HttpSession session) {
		
		String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			return "redirect:/maintenance/viewMaintenance";
		} else {
			String sql = "SELECT * FROM maintenance WHERE maintenanceID=?";
			Maintenance vm = jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Maintenance.class));
			model.addAttribute("vm", vm);

			return "editMaintenanceDetail";
		}
		
	}
	
	// Submit edited maintenance
	@PostMapping("/EditDetail/{id}")
	public String Edit(@PathVariable int id, @RequestParam String driverName, @RequestParam String date, 
            @RequestParam String vehicleNum, @RequestParam String vehicleType, Model model) { 
		
		String sql = "UPDATE maintenance SET vehicleType = ?, vehicleNum = ?, driverName = ?, date = ? WHERE maintenanceID = ?";
        
		int rowsAffected = jdbcTemplate.update(sql, vehicleType,vehicleNum, driverName, date, id);
		
		if (rowsAffected > 0) {
			
            model.addAttribute("message", "Data edited successfully!");
        } else {
            model.addAttribute("message", "Failed to edit data. Please try again.");
        }
		
		return "redirect:/maintenance/viewDetail/" + id;
	}
	
	// Delete maintenance
	@GetMapping("/DeleteDetail/{id}")
	public String delete(@PathVariable int id, Model model, HttpSession session) {
		
		String role = (String) session.getAttribute("role");
		
		if ("admin".equals(role)) {
			return "redirect:/maintenance/viewMaintenance";
		} else {
			
			String sql = "DELETE FROM maintenance WHERE maintenanceID=?";
	        
			int rowsAffected = jdbcTemplate.update(sql, id);
			
			if (rowsAffected > 0) {
	            model.addAttribute("message", "Data deleted successfully!");
	        } else {
	            model.addAttribute("message", "Failed to delete data. Please try again.");
	        }
			return "redirect:/maintenance/viewMaintenance";
		}
		
		
	 }
	
}
