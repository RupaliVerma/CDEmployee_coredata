//
//  CDEmployeeExtension.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation

extension CDEmployee{
    func convertToEmployee()->Employee{
        return Employee(id: (self.id)!, name: (self.name)!, email: (self.email)!, profilePicture: (self.profilePicture)!, passport: self.toPassport?.convertToPassport())
    }
}
