//
//  Item+CoreDataProperties.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/4/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    // Reason for @nonobjc is that in Objective-C there is already a method named 'fetchRequest` in NSManagedObject class
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        return request
    }

    @NSManaged public var text: String
    @NSManaged public var isCompleted: Bool

}
