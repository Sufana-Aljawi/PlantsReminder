//
//  PlantViewModel.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//

import Foundation

final class PlantViewModel: ObservableObject{
    @Published var plantName: String = ""
    @Published var showAddPlantSheet = false
    @Published var plants: [Plant] = []
    @Published var isChecked : Bool = false
    @Published var locationOptions = ""
    @Published var lightOptions = ""
    @Published var waterOptions = ""
    @Published var wateringDays = ""



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
    
    func removePlant(at index: Int) {
        plants.remove(at: index)
      }
    
    func resetForm() {
            plantName = ""
            locationOptions = "Bedroom"
            lightOptions = "Light"
            waterOptions = "20-50 ml"
            wateringDays = "Every day"
        }
        
    func deletePlant() {
           resetForm()
           showAddPlantSheet = false
       }
}



