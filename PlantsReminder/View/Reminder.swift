//
//  Reminder.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//

//
//  tessto.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 22/04/1446 AH.
//
import SwiftUI


struct Reminder: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showSavePlantSheet = false
    @State private var selectedLocation = "Bedroom" // Default value
    let locationOptions = ["Bedroom", "Kitchen", "Living Room","Garden"]
    @State var selectedLightOption = ""
    let lightOptions = ["Light", "Full Sun", "Partial Sun", "Low Light"]
    @State private var plantName: String = ""
    @State var selectedOption1 = ""
    let waterOptions = [ "20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    @State var selectedOption = ""
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    @State private var plants: [String] = []
    @StateObject var plantViewModel = PlantViewModel()

    var body: some View {
        NavigationStack{
            Text("Today")
                .font(.title)
                .padding(.trailing,290)
                .bold()
            
            List {
                ForEach(plantViewModel.plants) { item in
                    HStack {
                        Button(action: {
                            plantViewModel.togglePlantChecked(item)
                        }) {
                            HStack {
                                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isChecked ? .green : .gray)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    HStack(spacing: 8) {
                                        Label(item.room, systemImage: "location")
                                        Text(item.room)
                                            .font(.caption)
                                        
                                        Label(item.light, systemImage: "sun.min")
                                            .font(.caption)
                                    }
                                    
                                    HStack(spacing: 8) {
                                        Label(item.water, systemImage: "drop")
                                            .font(.caption)
                                        
                                        Label(item.waterDays, systemImage: "drop.fill")
                                            .font(.caption)
                                    }
                                }
                         }
                        }
                    }
                    .swipeActions(edge: .trailing) { // Specify edge for swipe action
                        Button(role: .destructive) { // Apply destructive role to Button
                            plantViewModel.removePlant(at: plantViewModel.plants.firstIndex(of: item)!)
                        }label:{
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("My Plants 🌱")
            //            .navigationBarTitleDisplayMode(.inline)
            Button(action:{
                plantViewModel.showAddPlantSheet.toggle()
            }, label: {
                Image(systemName: "plus.circle.fill")
                Text("New Reminder")
            })
            .foregroundColor(.gren)
            .sheet(isPresented: $plantViewModel.showAddPlantSheet, content: {
                NavigationStack {
                    VStack(alignment: .leading) {
                        Form{
                            
                            HStack{
                                Text("Plant Name")
                                List{
                                    TextField("type here", text:$plantViewModel.plantName)
                                }
                            }
                            
                            Section{
                                HStack{
                                    Image(systemName: "location")
                                    Picker("Room", selection: $plantViewModel.locationOptions) {
                                        ForEach(locationOptions, id: \.self) { option in
                                            Text(option)
                                                .tag(option)

                                        }
                                    }
                                }
                                
                                HStack{
                                    Image(systemName: "sun.min")
                                    Picker("Light", selection: $plantViewModel.lightOptions) {
                                        ForEach(lightOptions, id: \.self) { option in
                                            Text(option)
                                        }
                                    }
                                }
                                
                            }
                            Section{
                                HStack {
                                    Image(systemName: "drop")
                                    Picker("Watering Days", selection: $plantViewModel.waterOptions) {
                                        ForEach(wateringDays, id: \.self) { option in
                                            Text(option)
                                        }
                                    }
                                    
                                }
                                HStack {
                                    Image(systemName: "drop")
                                    Picker("Water", selection: $plantViewModel.wateringDays) {
                                        ForEach(waterOptions, id: \.self) { option in
                                            Text(option)
                                        }
                                    }
                                    
                                }
                                
                            }
                            Button("Delete Reminder") {
                                plantViewModel.deletePlant()
                            }
                            .foregroundColor(.red)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Set Reminder")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Plant Details")
                                .navigationBarTitleDisplayMode(.inline)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("Cancel") {
                                            dismiss()
                                        }
                                        .bold()
                                        .foregroundColor(.gren)
                                        .padding()
                                    }
                                    
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button(action: {
                                            plantViewModel.savePlant()
                                        }) {
                                            HStack{
                                                Spacer()
                                                Text("Save")
                                                    .bold()
                                                    .foregroundColor(.gren)
                                                    .padding()
                                                
                                                Spacer()
                                            }
                                            .clipShape(Capsule())
                                            
                                        }
                                    }
                                }
                }
            })
        }
        .navigationBarBackButtonHidden(true)
        .overlay{
            if plantViewModel.plants.isEmpty{
                VStack{
                    Image(.plant)
                    Text("All Done!🎉")
                        .font(.title)
                    Text("All Reminders Completed")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
            }
        }
        
    }
}

#Preview {
    Reminder()
}

