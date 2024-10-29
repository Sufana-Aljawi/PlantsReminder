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

/// A view that displays a completion message for reminders.
struct AllDone: View {
    
    @Environment(\.dismiss) var dismiss  // Environment variable to dismiss the view
    @State private var showSavePlantSheet = false  // State variable to control showing the save sheet
    @State private var selectedLocation = "Bedroom" // Default location value
    @State var selectedLightOption = "Light"  // Default light option
    @State private var plantName: String = ""  // State variable to store the plant name
    @State var selectedOption1 = ""  // Placeholder for another selection option
    @State var selectedOption = ""  // Placeholder for a selection option
    @State private var plants: [String] = []  // Array to store plant names
    @StateObject var plantViewModel = PlantViewModel()  // State object for managing plant data

    var body: some View {
        NavigationStack {
            Spacer().frame(height: 150)  // Spacer for vertical spacing
            VStack {
                Image(.plant)  // Display the plant image
                Spacer().frame(height: 50)  // Spacer for vertical spacing
                Text("All Done!🎉")  // Completion message
                    .font(.title)  // Title font
                    .bold()  // Bold text
                Spacer().frame(height: 10)  // Spacer for vertical spacing
                Text("All Reminders Completed")  // Subtext message
                    .font(.system(size: 17))  // System font with size 17
                    .foregroundStyle(.secondary)  // Secondary color for the text
            }
            Spacer().frame(height: 150)  // Spacer for vertical spacing
        }
    }
}

#Preview {
    AllDone()  // Preview of the AllDone view
}
