//
//  PassportManager.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 05/07/24.
//

import Foundation
class PassportManager{
    let passportRepository = PassportDataRepository()
    
    func create(record:Passport){
        passportRepository.create(record: record)
    }
    func getAllPassportDetails()->[Passport]?{
        return passportRepository.getAll()
    }
    func deleteByIdetifier(id :UUID)->Bool{
       return passportRepository.delete(byIdentifier: id)
    }
}
