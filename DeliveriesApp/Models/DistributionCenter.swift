//
//  DistributionCenter.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 02/02/21.
//

import Foundation
import MapKit


struct DistributionCenter {
    let id: String
    let disponibility: String
    let address: String
    let city: String
    let state: String
    let cep: String
    let ocupation: Int
    let geolocation: CLLocationCoordinate2D
}
