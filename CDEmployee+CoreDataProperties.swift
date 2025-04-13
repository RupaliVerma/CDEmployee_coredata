//
//  CDEmployee+CoreDataProperties.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var toPassport: CDPassport?
    
//    func convertToEmployee()->Employee{
//        return Employee(id: self.id!, name: self.name, email:self.email , profilePicture: self.profilePicture!, passport: self.toPassport!)
//    }
//    

}

extension CDEmployee : Identifiable {

}
