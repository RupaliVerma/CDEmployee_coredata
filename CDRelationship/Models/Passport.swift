//
//  File.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation

class Passport{
    
    let id:UUID
    let passportId,placeOfIssue,name:String?
    
    init(id: UUID, passportId: String?, placeOfIssue: String?, name: String?) {
        self.id = id
        self.passportId = passportId
        self.placeOfIssue = placeOfIssue
        self.name = name
    }
    
}
