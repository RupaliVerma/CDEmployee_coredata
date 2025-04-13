//
//  PassportDataRepository.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation
import CoreData

protocol PassportRepository:BaseRepository{
    
}
struct PassportDataRepository:PassportRepository{
    
    typealias T = Passport

    
    
    func getAll() -> [Passport]? {
        let records = PersistantStorage.shared.fetchManagerObjects(managedObject: CDPassport.self)
        
        guard records != nil && records?.count != 0 else {return nil}

        var results: [Passport] = []
        records!.forEach({ (cdPassport) in
            results.append(cdPassport.convertToPassport())
        })
        return results
        
    }
    
    func get(byIdentifier id: UUID) -> Passport? {
        let result = self.getCDPassport(byId: id)
        guard result != nil else {return nil}
        return result!.convertToPassport()
    }
    
    func create(record: Passport) {
        let cdPassport = CDPassport(context: PersistantStorage.shared.context)
        cdPassport.placeOfIssue = record.placeOfIssue
        cdPassport.id = record.id
        cdPassport.passportId = record.passportId

        PersistantStorage.shared.saveContext()
    }
    
    func update(record: Passport) -> Bool {
        
        let cdPassport = self.getCDPassport(byId: record.id)
            guard cdPassport != nil else {return false}
            return false
    }
    
    
    
    func delete(byIdentifier id: UUID) -> Bool {
        let employee = getCDPassport(byId: id)
        guard employee != nil else {return false}
        PersistantStorage.shared.context.delete(employee!)
        PersistantStorage.shared.saveContext()
        return true
    }
    
    private func getCDPassport(byId id: UUID) -> CDPassport?
    {
        let fetchRequest = NSFetchRequest<CDPassport>(entityName: "CDPassport")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById
        let result = try! PersistantStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}
        return result.first
    }
    
}
