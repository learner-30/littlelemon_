//
//  Dish+CoreDataProperties.swift
//  LittleLemon
//
//  Created by Xcode on 2025/03/06.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var image: String?

}

extension Dish : Identifiable {

}
