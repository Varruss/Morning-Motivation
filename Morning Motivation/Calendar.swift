//
//  CalendarView.swift
//  Morning Motivation
//
//  Created by Luke R. Christopulos on 11/11/24.
//

import SwiftUI

struct CalendarView: View {
    @State var date = Date()
        @State var todaysDate = Date.now
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @AppStorage("textColor") var textColor = "black"
    @AppStorage("BorderColor") var borderColor = "cyan"
    private let colorDictionary: [String: Color] = [
           "black": .black,
           "white": .white,
           "gray": .gray,
           "red": .red,
           "orange": .orange,
           "yellow": .yellow,
           "green": .green,
           "blue": .blue,
           "indigo": .indigo,
           "purple": .purple,
           "pink": .pink,
           "cyan": .cyan,
           "teal": .teal
       ]
    var body: some View {
        ZStack{
            if OutlineOn == true {
                RoundedRectangle(cornerRadius: 65)
                    .stroke(colorDictionary[borderColor] ?? .cyan, lineWidth: 15)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 65)
                            .fill(Color.clear)
                            .ignoresSafeArea()
                    )
                    .shadow(color: colorDictionary[borderColor] ?? .cyan, radius: 15, x: 0, y: 0)
                    .ignoresSafeArea()
            }
            VStack{
                DatePicker(selection: $date, displayedComponents: [.date]) {
                              Text("Start Date")
                              Text("Select the starting date for the event")
                          }
//                .position(x: 200, y: 110)
                .datePickerStyle(.graphical)
                .frame(width: 325)
                .padding()
                
                Text("Motivation Gonna be right Here Soon")
                    .foregroundColor(colorDictionary[textColor] ?? .black)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                          
            }
        }
    }
}

#Preview {
    ContentView()
}
