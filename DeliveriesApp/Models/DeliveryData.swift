//
//  DeliveryData.swift
//  DeliveriesApp
//
//  Created by Renan Baialuna on 01/02/21.
//

import Foundation

struct DeliveryData {
    let personalData: PersonalData
    let status: statusEnum = statusEnum(rawValue: Int.random(in: 0...3))!
    var code: String = ""
    init(data: PersonalData) {
        self.personalData = data
        self.code = generateCode()
        
    }
    func generateCode() -> String {
        var ret = ""
        for i in 1...10 {
            let number = Int.random(in: 0...9)
            print(number)
            ret.append(String(number))
        }
        return ret
    }
}
