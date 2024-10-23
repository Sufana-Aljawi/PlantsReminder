//
//  ContentView.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 17/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var ShowSheet = false
    @State var plants : Array<String> = []
    @State var name = ""
    @State var selectedOption = "Every day"
        let wateringDays = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    @State var selectedOption1 = "20-50 ml"
    let waterOptions = [ "20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    @State var selectedLightOption = "Light"
    let lightOptions = ["Light", "Full Sun", "Partial Sun", "Low Light"]
    @State var selectedRoomOption = "Bedroom"
    let locationOptions = ["Bedroom", "Kitchen", "Living Room", "Garden"]
    

    var body: some View {
        NavigationStack{
            VStack {
                Image(.plant)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                Text("Start your plant journey!")
                    .bold()
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .padding()
                    .foregroundStyle(.secondary)
                
                NavigationLink(destination: SetReminderPage()) {
                    Text("Set Plant Reminder")
                        .bold()
                        .foregroundColor(.text)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gren)
                        .cornerRadius(10)
                }
                HStack{
                    Button(action:{
                        ShowSheet.toggle()
                        name = ""
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    })
                    
                }
                .foregroundStyle(.gren)
                .sheet(isPresented: $ShowSheet){
                    NavigationView{
                        
                            Form{
                                Section{
                                    HStack{
                                        Text("Plant Name")
                                        List{
                                            TextField("type here", text: $name)
                                        }
                                    }
                                }

                            Section{
                                HStack{
                                    Image(systemName: "location")
                                    Picker("Room", selection: $selectedRoomOption) {
                                        ForEach(locationOptions, id: \.self) { option in
                                            Text(option)
                                        }
                                    }
                                }

                                HStack{
                                    Image(systemName: "sun.min")
                                    Picker("Light", selection: $selectedLightOption) {
                                        ForEach(lightOptions, id: \.self) { option in
                                            Text(option)
                                        }
                                    }
                                }
                            }
                            HStack {
                                Image(systemName: "drop")
                                Picker("Watering Days", selection: $selectedOption) {
                                    ForEach(wateringDays, id: \.self) { option in
                                        Text(option)
                                    }
                                }
            
                            }
                            HStack {
                                Image(systemName: "drop")
                                Picker("Water", selection: $selectedOption1) {
                                    ForEach(waterOptions, id: \.self) { option in
                                        Text(option)
                                    }
                                }
            
                            }

                        }
                        .toolbar{
                            Button("Add"){
                                plants.append(name)
                                ShowSheet.toggle()
                            }
                        }
                    }
                }
            }
            }
            .padding(.horizontal)
            .navigationTitle("My Plants 🌱")

            }

        }






#Preview {
    ContentView()
}
