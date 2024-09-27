//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoList
//
//  Created by Amey Kanunje on 9/27/24.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var details: String?
    @NSManaged public var isCompleted: Bool

}

extension ToDoListItem : Identifiable {

}
