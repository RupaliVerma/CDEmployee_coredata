//
//  EmployeeManager.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 05/07/24.
//

import Foundation

class EmployeeManager{
    private let employeeRepository:EmployeeDataRepository=EmployeeDataRepository()
    
    func create(employee:Employee){
        if (validatePassport(passport:employee.passport))==false{
            employee.passport = nil
        }
        employeeRepository.create(record: employee)
    }
    func update(employee:Employee)->Bool{
       return employeeRepository.update(record: employee)
    }
    func delete(employee:Employee)->Bool{
        return employeeRepository.delete(byIdentifier: employee.id)
    }
    
    func getAllEmployees()->[Employee]?{
        return employeeRepository.getAll()
    }
    
    private func validatePassport(passport: Passport?) -> Bool{
        if(passport == nil || passport?.passportId?.isEmpty == true || passport?.placeOfIssue?.isEmpty == true){
            return false
        }
        return true
    }
}
