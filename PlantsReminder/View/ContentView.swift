import SwiftUI

/// Main view for managing and displaying plants.
struct ContentView: View {
    @State private var showingSheet = false  // State variable to control showing the reminder sheet
    @StateObject var plantViewModel = PlantViewModel()  // State object for managing plant data
    @State private var navigateToReminderView = false  // State variable for navigation
    @State var plant: Plant?  // Optional plant for detail view

    var body: some View {
        NavigationView {
            VStack {
                // Check if there are no plants
                if plantViewModel.plants.isEmpty {
                    VStack {
                        // Plant Image
                        Image("plant") // Replace with actual image name
                        Spacer().frame(height: 50)
                        // Headline
                        Text("Start your plant journey!")
                            .foregroundColor(Color.start)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer().frame(height: 25)
                        // Subheadline
                        VStack {
                            Text("Now all your plants will be in one place and ")
                            Text("we will help you take care of them :)")
                        }
                        .foregroundColor(Color.color)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        Spacer().frame(height: 30)
                        // Button to set a plant reminder
                        Button("Set Plant Reminder") {
                            showingSheet.toggle()  // Toggle the sheet display
                        }
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: 310, maxHeight: 40)
                        .background(Color.gren)
                        .cornerRadius(10)
                    }
                } else {
                    VStack {
                        // Check if all plants are marked as checked
                        if plantViewModel.plants.allSatisfy({ $0.isChecked }) {
                            allDoneView  // Display all done view
                        } else {
                            VStack {
                                List {
                                    VStack(alignment: .trailing) {
                                        Text("Today")
                                            .bold()
                                            .font(.system(size: 29))
                                    }
                                    .listRowBackground(Color.black)  // Background for the "Today" header
                                    ForEach(plantViewModel.plants) { item in
                                        HStack {
                                            Button(action: {
                                                plantViewModel.togglePlantChecked(item)  // Toggle plant check state
                                            }) {
                                                HStack {
                                                    Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                                        .foregroundColor(item.isChecked ? .gren : .gray)  // Change icon color based on check state
                                                    plantDetailsView(for: item)  // Display plant details
                                                }
                                            }
                                            Spacer()
                                        }
                                        .listRowBackground(Color.black)  // Background for the plant row
                                        .swipeActions(edge: .trailing) {
                                            deleteButton(for: item)  // Swipe action for deleting the plant
                                        }
                                    }
                                }
                            }
                        }
                        Spacer().frame(height: 215)  // Spacer for layout
                        VStack {
                            Button(action: {
                                showingSheet.toggle()  // Toggle the sheet for a new reminder
                            }) {
                                Image(systemName: "plus.circle.fill")  // Plus icon
                                Text("New Reminder")  // Button label
                            }
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.gren)
                        }
                        .padding(.trailing, 170)  // Adjust padding for alignment
                    }
                    .background(Color.black.edgesIgnoringSafeArea(.all))  // Background for the view
                    .navigationTitle("My Plants 🌱")  // Navigation title
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewReminder(plantViewModel: plantViewModel, plant: Plant(name: "", room: "", light: "", water: "", waterDays: "", isChecked: false))  // Present the NewReminder view
            }
            .fullScreenCover(isPresented: $navigateToReminderView) {
                // Reminder view to navigate to
            }
            .navigationTitle("My Plants 🌱")  // Navigation title
        }
    }

    /// View displayed when all reminders are completed.
    private var allDoneView: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 100)
            Image("plant")  // Image for all done view
            Text("All Done!🎉")
                .font(.title)
            Text("All Reminders Completed")
                .font(.subheadline)
                .foregroundStyle(.secondary)  // Secondary style for text
        }
    }

    /// View for displaying details of a specific plant.
    private func plantDetailsView(for plant: Plant) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "location")  // Location icon
                Text(plant.room)  // Display plant room
            }
            .font(.system(size: 18))
            .foregroundColor(.location)
            Text(plant.name)  // Display plant name
                .font(.system(size: 30))
            HStack {
                HStack {
                    Image(systemName: "sun.min")  // Light requirements icon
                    Text(plant.light)  // Display light requirement
                }
                .font(.system(size: 12))
                .foregroundColor(.sun)
                .padding(5)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(9)
                HStack {
                    Image(systemName: "drop")  // Water requirements icon
                    Text(plant.water)  // Display water requirement
                }
                .font(.system(size: 12))
                .foregroundColor(.drop)
                .padding(5)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(9)
            }
        }
        .padding(.leading)  // Left padding for alignment
    }

    /// Delete button for removing a plant.
    private func deleteButton(for plant: Plant) -> some View {
        Button(role: .destructive) {
            plantViewModel.removePlant(plant)  // Remove plant from the view model
        } label: {
            Label("Delete", systemImage: "trash")  // Label for the delete button
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()  // Preview of ContentView
    }
}
