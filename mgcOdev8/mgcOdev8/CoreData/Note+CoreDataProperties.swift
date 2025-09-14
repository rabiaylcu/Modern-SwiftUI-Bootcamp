//
//  Note+CoreDataProperties.swift
//  mgcOdev8
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import CoreData
import Foundation

extension Note {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var date: Date?
}

extension Note : Identifiable {
    
}

