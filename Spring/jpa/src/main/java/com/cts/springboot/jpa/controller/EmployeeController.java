package com.cts.springboot.jpa.controller;

import com.cts.springboot.jpa.model.Employee;
import com.cts.springboot.jpa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // Create
    @PostMapping("/create")
    ResponseEntity<Employee> createEmployee(@RequestBody Employee emp){
        Employee employee = employeeService.createEmployee(emp);
        return ResponseEntity.ok().body(employee);
    }

    // Read
    @GetMapping("/employees")
    ResponseEntity<List<Employee>> getEmployees(){
        List<Employee> allEmployees = employeeService.getEmployees();
        return ResponseEntity.ok().body(allEmployees);
    }

    @GetMapping("/employee/{emp_id}")
    ResponseEntity<Employee> getEmployeeById(@PathVariable long emp_id){
        Employee emp = employeeService.getEmployeeById(emp_id);
        return ResponseEntity.ok().body(emp);
    }

    // Update
    @PutMapping("/update")
    ResponseEntity<Employee> updateEmployee(@RequestBody Employee emp){
        Employee savedEmp = employeeService.updateEmployee(emp);
        return ResponseEntity.ok().body(savedEmp);
    }

    // Delete
    @DeleteMapping("/delete/{emp_id}")
    ResponseEntity<String> deleteEmployee(@PathVariable long emp_id){
        String result = employeeService.deleteEmployee(emp_id);
        return ResponseEntity.ok().body(result);
    }
}
