//
//  test.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 18/04/1446 AH.
//

import SwiftUI

struct SetReminderPage: View {
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
        VStack {
            NavigationView{
                VStack {
                    List((plants), id:\.self) { i in
                        Text(i)
                    }
                    Spacer()
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
                .padding(.horizontal)
                .navigationTitle("My Plants 🌱")
                
            }
            
        }
    }
}

struct SetReminderPage_Previews: PreviewProvider {
    static var previews: some View{
        SetReminderPage(ShowSheet: true)
    }
}


#Preview {
    SetReminderPage()
}
