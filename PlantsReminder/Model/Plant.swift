//
//  Plant.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//

import Foundation

struct Plant: Identifiable, Equatable {
    let name: String
    let room: String
    let light: String
    let water: String
    let waterDays: String
    var isChecked: Bool
    let id: UUID = .init()
    
    static func == (lhs: Plant, rhs: Plant) -> Bool {
        lhs.id == rhs.id
    }
}
