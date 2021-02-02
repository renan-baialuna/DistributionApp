//
//  CoreManager.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 02/02/21.
//

import Foundation



struct CoreManager {
    let appDelegate: AppDelegate
    
    func saveDelivery(delivery: DeliveryData) -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let newDelivery = DeliveryEntity(context: context)
        newDelivery.code = delivery.code
        newDelivery.status = Int64(delivery.status.rawValue )
        newDelivery.name = delivery.personalData.name
        newDelivery.email = delivery.personalData.email
        newDelivery.address = delivery.personalData.adress
        newDelivery.phone = delivery.personalData.phone
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    func getAllDeliveries() -> [DeliveryEntity] {
        let context = appDelegate.persistentContainer.viewContext
        var deliveries: [DeliveryEntity] = []
        do {
            deliveries = try context.fetch(DeliveryEntity.fetchRequest())
            return deliveries
        } catch {
            
        }
        return deliveries
    }

    
    
}
