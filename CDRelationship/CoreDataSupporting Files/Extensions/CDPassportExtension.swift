//
//  CDPassportExtension.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation

extension CDPassport{
    
    func convertToPassport()->Passport{
        return Passport(id: self.id!, passportId: self.passportId, placeOfIssue: self.passportId, name: self.toEmployee?.name)
    }
    
}
