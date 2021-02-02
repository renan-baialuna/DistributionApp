//
//  Delivery.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 31/01/21.
//

import Foundation

enum statusEnum: Int {
    case registered = 0
    case leftCenter = 1
    case inTransit = 2
    case delivered = 3
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
                return "In transit".localized()
            case .delivered:
                return "Delivered".localized()
            case .registered:
                return "Registered"
            case .leftCenter:
                return "Left center"
            }
        }
    }
}
