//
//  Delivery.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 31/01/21.
//

import Foundation

enum statusEnum {
    case inTransit
    case delivered
}

struct Delivery {
    let id: String
    let status: statusEnum
    let lastUpdate: Date
    let porcentage: Int
    var dateFormater = DateFormatter()
    
    
    var lastUpdateString: String {
        get {
            dateFormater.dateFormat = "dd/MM/YYYY"
            return dateFormater.string(from: lastUpdate)
        }
    }
    
    var statusString: String {
        get {
            switch status {
            case .inTransit:
                return "in transit"
            case .delivered:
                return "Delivered"
            }
        }
    }
}
