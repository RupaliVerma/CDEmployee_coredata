//
//  BaseRepository.swift
//  CDRelationship
//
//  Created by RUPALI VERMA on 02/07/24.
//

import Foundation

protocol BaseRepository {
    
    associatedtype T
    
    func getAll()->[T]?
    func get(byIdentifier id:UUID)->T?
    func create(record:T)
    func delete(byIdentifier id:UUID)->Bool
    func update(record:T)-> Bool
}
