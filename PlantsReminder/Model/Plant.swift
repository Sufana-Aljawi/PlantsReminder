//
//  Plant.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//

import Foundation

/// A struct representing a plant with its details and identification.
struct Plant: Identifiable, Equatable {
    var name: String          // The name of the plant
    var room: String          // The room where the plant is located
    var light: String         // The light requirements for the plant
    var water: String         // The watering requirements for the plant
    var waterDays: String     // How many days between watering
    var isChecked: Bool       // A flag to indicate if the plant care task is completed
    let id: UUID = .init()    // Unique identifier for each plant instance
    
    /// Equatable implementation to compare two Plant instances based on their ID.
    static func == (lhs: Plant, rhs: Plant) -> Bool {
        lhs.id == rhs.id
    }
}

