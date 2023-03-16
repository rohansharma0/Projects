package com.cts.springboot.jpa.service;

import com.cts.springboot.jpa.model.Employee;

import java.util.List;


public interface EmployeeService {

    Employee createEmployee(Employee emp);

    List<Employee> getEmployees();

    Employee getEmployeeById(long emp_id);

    Employee updateEmployee(Employee emp);

    String deleteEmployee(long emp_id);
}
