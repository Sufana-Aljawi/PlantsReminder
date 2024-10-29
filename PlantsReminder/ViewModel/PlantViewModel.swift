//
//  PlantViewModel.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//

import Foundation
import Combine

final class PlantViewModel: ObservableObject{
    
    @Published var plantName: String = ""
    @Published var showAddPlantSheet = false
    @Published var plants: [Plant] = []
    @Published var isChecked : Bool = false
    @Published var locationOptions = ""
    @Published var lightOptions = ""
    @Published var waterOptions = ""
    @Published var wateringDays = ""
    
    
    let locationOptions1 = ["Bedroom", "Kitchen", "Living Room","Garden"]
    let lightOptions2 = ["Light", "Full Sun", "Partial Sun", "Low Light"]
    let waterOptions3 = [ "20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    let wateringDays4 = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    
    
    func togglePlantChecked(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].isChecked.toggle()
        }
    }
    
    func savePlant(){
        let newPlant: Plant = Plant(name: plantName, room: locationOptions, light: lightOptions, water: waterOptions, waterDays: wateringDays, isChecked: isChecked)
        self.plants.append(newPlant)
        showAddPlantSheet.toggle()
    }
    
    func removePlantSwipe(at index: Int) {
        plants.remove(at: index)
    }
    
    func removePlant(_ plant: Plant) { if let index = plants.firstIndex(where: { $0.id == plant.id }) { plants.remove(at: index) } }
    

    func editPlant(plant: Plant, newName: String, newRoom: String, newLight: String, newWateringDays: String, newWaterAmount: String) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].name = newName
            plants[index].room = newRoom
            plants[index].light = newLight
            plants[index].waterDays = newWateringDays
            plants[index].water = newWaterAmount
        }
        
        
        func toggleCheck(for plant: Plant) {
            if let index = plants.firstIndex(where: { $0.id == plant.id }) {
                plants[index].isChecked.toggle()
                if plants[index].isChecked { plants.remove(at: index) }
            }
        }
        

        
        var allChecked: Bool {
            return plants.allSatisfy { $0.isChecked }
        }
    }
    
    
    
    
    
}
