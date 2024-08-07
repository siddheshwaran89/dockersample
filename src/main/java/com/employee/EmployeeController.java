package com.employee;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class EmployeeController {
	
	@GetMapping("/test")
	public String getEmployeeList() {
		return "hai welcome";
	}
}
