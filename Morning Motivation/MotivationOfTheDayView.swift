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
        Task(name: "Read a book", isCompleted: false),
        Task(name: "Exercise", isCompleted: false),
        Task(name: "Write in journal", isCompleted: false)
    ]
    
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
                
                if isOn {
                    VStack {
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack {
                                Text(tasks[index].name)
                                    .strikethrough(tasks[index].isCompleted)
                                
                                Spacer()
                                
                                Button(action: {
                                    tasks[index].isCompleted.toggle()
                                }) {
                                    Image(systemName: tasks[index].isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(tasks[index].isCompleted ? .green : .gray)
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                    Spacer()
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
