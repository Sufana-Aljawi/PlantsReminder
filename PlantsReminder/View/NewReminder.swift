import SwiftUI

/// View for creating a new plant reminder.
struct NewReminder: View {
    @Environment(\.dismiss) var dismiss  // Environment variable to dismiss the view
    @ObservedObject var plantViewModel: PlantViewModel  // Observed object for managing plant data
    @State var plantName: String = ""  // State variable for the plant name
    @State var room: String = "Bedroom"  // State variable for the room selection
    @State var light: String = "Full sun"  // State variable for light requirement
    @State var wateringDays: String = "Every day"  // State variable for watering days
    @State var waterAmount: String = "20-50 ml"  // State variable for water amount
    var plant: Plant  // The plant object for which the reminder is being set

    var body: some View {
        NavigationView {
            Form {
                // Section for plant name input
                Section {
                    HStack {
                        Text("Plant Name")  // Label for the plant name
                        TextField("Plant Name", text: $plantViewModel.plantName)  // Text field for entering the plant name
                    }
                }
                // Section for room and light selection
                Section {
                    HStack {
                        Image(systemName: "location")  // Icon for room selection
                        Picker("Room", selection: $plantViewModel.locationOptions) {
                            ForEach(plantViewModel.locationOptions1, id: \.self) { option in
                                Text(option)  // Options for room selection
                                    .tag(option)  // Tagging the option for identification
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "sun.min")  // Icon for light selection
                        Picker("Light", selection: $plantViewModel.lightOptions) {
                            ForEach(plantViewModel.lightOptions2, id: \.self) { option in
                                Text(option)  // Options for light requirement selection
                                    .tag(option)  // Tagging the option for identification
                            }
                        }
                    }
                }
                // Section for watering days and water amount selection
                Section {
                    HStack {
                        Image(systemName: "drop")  // Icon for watering days selection
                        Picker("Watering Days", selection: $plantViewModel.waterOptions) {
                            ForEach(plantViewModel.waterOptions3, id: \.self) { option in
                                Text(option)  // Options for watering days selection
                                    .tag(option)  // Tagging the option for identification
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "drop")  // Icon for water amount selection
                        Picker("Water", selection: $plantViewModel.wateringDays) {
                            ForEach(plantViewModel.wateringDays4, id: \.self) { option in
                                Text(option)  // Options for water amount selection
                                    .tag(option)  // Tagging the option for identification
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Set Reminder", displayMode: .inline)  // Navigation title
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()  // Dismiss the view on cancel
            }.foregroundColor(Color.gren), trailing: Button("Save") {
                plantViewModel.savePlant()  // Save the new plant reminder
                dismiss()  // Dismiss the view
            }.foregroundColor(Color.gren))
        }
        .onAppear {
            // Pre-fill the fields with the current plant details
            plantName = plant.name
            room = plant.room
            light = plant.light
            wateringDays = plant.waterDays
            waterAmount = plant.water
        }
    }
}

/// Preview provider for the NewReminder view.
struct NewReminder_Previews: PreviewProvider {
    static var previews: some View {
        NewReminder(
            plantViewModel: PlantViewModel(),  // Sample PlantViewModel for preview
            plant: Plant(name: "", room: "", light: "", water: "", waterDays: "", isChecked: false)  // Sample plant for preview
        )
    }
}
