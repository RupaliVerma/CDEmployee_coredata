//
//  Employee.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation
class Employee{
    
    let id:UUID
    let name,email:String?
    let profilePicture:Data
    var passport:Passport?
    init(id: UUID, name: String?, email: String?, profilePicture: Data, passport: Passport?) {
        self.id = id
        self.name = name
        self.email = email
        self.profilePicture = profilePicture
        self.passport = passport
    }
   
    
}
