package com.cts.springboot.jpa.service;

import com.cts.springboot.jpa.exception.EmployeeNotFoundException;
import com.cts.springboot.jpa.model.Employee;
import com.cts.springboot.jpa.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public Employee createEmployee(Employee emp) {
        return employeeRepository.save(emp);
    }

    @Override
    public List<Employee> getEmployees() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee getEmployeeById(long emp_id) {
        Optional<Employee> emp = employeeRepository.findById(emp_id);
        if(emp.isPresent()){
            return emp.get();
        }
        throw new EmployeeNotFoundException("No record found by ID -" + emp_id);
    }

    @Override
    public Employee updateEmployee(Employee emp) {
        Optional<Employee> existingEmp = employeeRepository.findById(emp.getId());
        if(existingEmp.isPresent()){
            Employee existEmp = existingEmp.get();
            existEmp.setName(emp.getName());
            existEmp.setDesignation(emp.getDesignation());
            existEmp.setSalary(emp.getSalary());
            return employeeRepository.save(existEmp);
        }
        throw new EmployeeNotFoundException("No record found by ID -" + emp.getId());
    }

    @Override
    public String deleteEmployee(long emp_id) {
        Optional<Employee> toDeleteEmp = employeeRepository.findById(emp_id);
        if(toDeleteEmp.isPresent()){
            Employee existEmp = toDeleteEmp.get();
            employeeRepository.delete(existEmp);
            return "Employee record been deleted successfully";
        }
        throw new EmployeeNotFoundException("No record found by ID -" + emp_id);
    }
}
