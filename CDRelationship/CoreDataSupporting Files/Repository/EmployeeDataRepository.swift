//
//  EmployeeDataRepository.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation
import CoreData

protocol EmployeeRepository:BaseRepository{
    
}
struct EmployeeDataRepository:EmployeeRepository{
  
 
    typealias T = Employee
    
    func getAll() -> [Employee]? {
        let results = PersistantStorage.shared.fetchManagerObjects(managedObject: CDEmployee.self)
        guard results != nil && results?.count != 0 else {
            return nil
        }
        var recordsArray :[Employee] = []
        results?.forEach({ (cdEmployee) in
            recordsArray.append(cdEmployee.convertToEmployee())
        })
        return recordsArray
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        
        let result = self.getCDEmoploye(byId: id)
        guard result != nil else {return nil }
         return result!.convertToEmployee()
       
    }
    
    func create(record: Employee) {
        let  cdeEmployee = CDEmployee(context: PersistantStorage.shared.context)
        cdeEmployee.name = record.name
        cdeEmployee.id = record.id
        cdeEmployee.email = record.email
        cdeEmployee.profilePicture = record.profilePicture
        if record.passport != nil{
            var cdpassport = CDPassport(context: PersistantStorage.shared.context)
            cdpassport.id = record.passport?.id
            cdpassport.passportId = record.passport?.passportId
            cdpassport.placeOfIssue = record.passport?.placeOfIssue
            cdeEmployee.toPassport = cdpassport
        }
        PersistantStorage.shared.saveContext()
    }
    
    func update(record: Employee) -> Bool {
        
        let cdEmployee = self.getCDEmoploye(byId: record.id)
        guard cdEmployee != nil else {return false}

        cdEmployee?.email = record.email
        cdEmployee?.name = record.name
        cdEmployee?.profilePicture = record.profilePicture

        cdEmployee?.toPassport?.placeOfIssue = record.passport?.placeOfIssue
        cdEmployee?.toPassport?.passportId = record.passport?.passportId

        PersistantStorage.shared.saveContext()

        return true
    }
    
    
    func delete(byIdentifier id: UUID) -> Bool {
        let employee = getCDEmoploye(byId:id )
        guard employee != nil else {return false}
        PersistantStorage.shared.context.delete(employee!)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDEmoploye(byId id:UUID)->CDEmployee?{
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
         let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! PersistantStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        return result.first
    }
    
}
