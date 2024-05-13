//
//  MyUniversityEntity+CoreDataProperties.swift
//  Universities
//
//  Created by Rizvi Naqvi on 13/05/2024.
//
//

import Foundation
import CoreData


extension MyUniversityEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyUniversityEntity> {
        return NSFetchRequest<MyUniversityEntity>(entityName: "MyUniversityEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var state: String?
    @NSManaged public var code: String?

}

extension MyUniversityEntity : Identifiable {

}
