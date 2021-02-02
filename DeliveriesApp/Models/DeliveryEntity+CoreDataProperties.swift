//
//  DeliveryEntity+CoreDataProperties.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 01/02/21.
//
//

import Foundation
import CoreData


extension DeliveryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeliveryEntity> {
        return NSFetchRequest<DeliveryEntity>(entityName: "DeliveryEntity")
    }

    @NSManaged public var code: String?
    @NSManaged public var status: Int64
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?

}

extension DeliveryEntity : Identifiable {

}
