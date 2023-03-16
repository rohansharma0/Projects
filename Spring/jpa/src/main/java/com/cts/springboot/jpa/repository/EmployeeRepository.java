package com.cts.springboot.jpa.repository;

import com.cts.springboot.jpa.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;


public interface EmployeeRepository extends JpaRepository<Employee , Long> {
}
