//
//  NewReminder.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 23/04/1446 AH.
//

//
//  FirstPageView.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 20/04/1446 AH.
//

import SwiftUI
struct NewReminder: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var plantViewModel = PlantViewModel()
    @State private var selectedLocation = ""
    @State private var showSavePlantSheet = false
    let locationOptions = ["Bedroom", "Kitchen", "Living Room","Garden"]
    @State var selectedLightOption = ""
    let lightOptions = ["Light", "Full Sun", "Partial Sun", "Low Light"]
    @State private var plantName: String = ""
    @State var selectedOption1 = ""
    let waterOptions = [ "20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    @State var selectedOption = ""
    let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    @State private var plants: [String] = []
    
    
    var body: some View {
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
                                NavigationLink(destination: Reminder()) {
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
        }
        .navigationBarBackButtonHidden(true)


    }
}

#Preview {
    NewReminder()
}

