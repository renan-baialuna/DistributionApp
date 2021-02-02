//
//  DeliveryDatacore+CoreDataProperties.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 01/02/21.
//
//

import Foundation
import CoreData


extension DeliveryDatacore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeliveryDatacore> {
        return NSFetchRequest<DeliveryDatacore>(entityName: "DeliveryDatacore")
    }

    @NSManaged public var singleDelivery: DeliveryData?

}

extension DeliveryDatacore : Identifiable {

}
