import SwiftUI

/// View for editing a plant reminder.
struct EditReminder: View {
    @Environment(\.dismiss) var dismiss  // Environment variable to dismiss the view
    @ObservedObject var plantViewModel: PlantViewModel  // Observed object for managing plant data
    @State private var plantName: String = ""  // State variable for the plant name
    @State private var room: String = "Bedroom"  // State variable for the room selection
    @State private var light: String = "Full sun"  // State variable for light requirement
    @State private var wateringDays: String = "Every day"  // State variable for watering days
    @State private var waterAmount: String = "20-50 ml"  // State variable for water amount
    @State var isChecked = false  // State variable for the checked status
    var plant: Plant  // The plant object being edited

    var body: some View {
        NavigationView {
            Form {
                // Section for plant name input
                Section {
                    HStack {
                        Text("Plant Name")  // Label for the plant name
                        TextField("Plant Name", text: $plantName)  // Text field for entering the plant name
                    }
                }
                // Section for room and light selection
                Section {
                    HStack {
                        Image(systemName: "location")  // Icon for room selection
                        Picker("Room", selection: $room) {
                            ForEach(plantViewModel.locationOptions1, id: \.self) { option in
                                Text(option)  // Options for room selection
                                    .tag(option)  // Tagging the option for identification
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "sun.min")  // Icon for light selection
                        Picker("Light", selection: $light) {
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
                        Picker("Watering Days", selection: $wateringDays) {
                            ForEach(plantViewModel.waterOptions3, id: \.self) { option in
                                Text(option)  // Options for watering days selection
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "drop")  // Icon for water amount selection
                        Picker("Water", selection: $waterAmount) {
                            ForEach(plantViewModel.wateringDays4, id: \.self) { option in
                                Text(option)  // Options for water amount selection
                            }
                        }
                    }
                }
                // Button to delete the reminder
                Button(action: {
                    // plantViewModel.removePlant(plant)  // Uncomment to enable deletion
                    dismiss()  // Dismiss the view
                }) {
                    Text("Delete Reminder")  // Button label
                        .foregroundColor(.red)  // Text color for the delete button
                        .frame(maxWidth: .infinity, alignment: .center)  // Button styling
                }
            }
            .navigationBarTitle("Set Reminder", displayMode: .inline)  // Navigation title
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()  // Dismiss the view on cancel
            }.foregroundColor(Color.gren), trailing: Button("Save") {
                plantViewModel.savePlant()  // Save the updated plant details
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

/// Preview provider for the EditReminder view.
struct EditReminder_Previews: PreviewProvider {
    static var previews: some View {
        EditReminder(
            plantViewModel: PlantViewModel(),  // Sample PlantViewModel for preview
            plant: Plant(name: "", room: "", light: "", water: "", waterDays: "", isChecked: false)  // Sample plant for preview
        )
    }
}
