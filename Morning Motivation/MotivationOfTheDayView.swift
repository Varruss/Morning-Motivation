//
//  MotivationOfTheDay.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/7/24.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool
}

struct MotivationOfTheDay: View {

    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @AppStorage("lastResetDate") private var lastResetDate: Date = Date()
    
    @State private var tasks = [
        Task(name: "Read for 30 Minutes", isCompleted: false),
        Task(name: "Exercise", isCompleted: false),
        Task(name: "Go Outside", isCompleted: false)
    ]
   // @ObservedObject private var model = QuoteViewModel()

    var body: some View {
        ZStack {
            if OutlineOn {
                RoundedRectangle(cornerRadius: 65)
                    .stroke(Color.cyan, lineWidth: 15)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 65)
                            .fill(Color.clear)
                            .ignoresSafeArea()
                    )
                    .shadow(color: Color.blue.opacity(1), radius: 15, x: 0, y: 0)
                    .ignoresSafeArea()
            }
            
            VStack {
                Text("Motivation")
                    .bold()
                    .font(.largeTitle)
                    .padding(35)
                Spacer()
                
//                List(model.quotes, id: \.self) { item in
//                    VStack {
//                        Text(item.quote)
//                        Text(item.name)
//                    }
//                }
//                .onAppear {
//                    self.model.fetchData()
//                }
                Spacer()
                if isOn {
                    VStack {
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack {
                                Text(tasks[index].name)
                                    .strikethrough(tasks[index].isCompleted)
                                    .foregroundColor(tasks[index].isCompleted ? .gray : .primary) // Change text color
                                
                                Spacer()
                                
                                Button(action: {
                                    tasks[index].isCompleted.toggle()
                                }) {
                                    Image(systemName: tasks[index].isCompleted ? "checkmark.square.fill" : "square.fill")
                                        .foregroundColor(tasks[index].isCompleted ? .blue : .gray)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(width:300)
                    .padding()
                    .bold()
                }
            }
            .onAppear(perform: checkForDailyReset)
        }
    }

    private func checkForDailyReset() {
        let calendar = Calendar.current
        if !calendar.isDateInToday(lastResetDate) {
            for index in tasks.indices {
                tasks[index].isCompleted = false
            }
            lastResetDate = Date()
        }
    }
}

#Preview {
    MotivationOfTheDay()
}
