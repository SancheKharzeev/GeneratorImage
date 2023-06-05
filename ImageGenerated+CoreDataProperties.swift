//
//  ImageGenerated+CoreDataProperties.swift
//  GeneratorImage
//
//  Created by Александр Х on 30.05.2023.
//
//

import Foundation
import CoreData


extension ImageGenerated {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageGenerated> {
        return NSFetchRequest<ImageGenerated>(entityName: "ImageGenerated")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var img: Data?

}

extension ImageGenerated : Identifiable {

}
