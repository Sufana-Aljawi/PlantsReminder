//
//  FirstPageView.swift
//  PlantsReminder
//
//  Created by Saffanah Aljawi on 20/04/1446 AH.
//

import SwiftUI
struct ContentView: View {
    @State var ShowSheet = false
    @State var isReminderPresented = false
    @StateObject var plantViewModel = PlantViewModel()

    var body: some View {
        NavigationStack{
//            First Page of set plant Reminder
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
   
                }
            NavigationLink(destination: NewReminder()) {
                Text("Set Plant Reminder")
                    .bold()
                    .foregroundColor(.text)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .padding()
                    .background(.gren)
                    .cornerRadius(10)
            }
            .navigationTitle("My Plants 🌱")

            }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)



        }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}


#Preview {
    ContentView()
}

