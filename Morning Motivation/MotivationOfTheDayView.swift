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
    @Binding var deletedTasks: [String]
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @AppStorage("lastResetDate") private var lastResetDate: Date = Date()
    @AppStorage("textColor") var textColor = "black"
    @AppStorage("BorderColor") var borderColor = "cyan"
    @AppStorage("BackgroundColor") var backgroundColor = "white"
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
    @State private var tasks = [
        Task(name: "Read for 30 Minutes", isCompleted: false),
        Task(name: "Exercise", isCompleted: false),
        Task(name: "Go Outside", isCompleted: false)
    ]

    @StateObject var viewModel = ReadViewModel()

    
    @AppStorage("timer") var number = 0
    
        @State var showingAlert1 = false
        @State var showingAlert2 = false
        @State private var taskToDelete: Task? = nil
        @State var newTask: String
        
    var body: some View {
        Color(colorDictionary[backgroundColor] ?? .white)
            .ignoresSafeArea()
            .overlay(
        ZStack {
            if OutlineOn {
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
            
            VStack {
                Text("Motivation")
                    .foregroundColor(colorDictionary[textColor] ?? .black)
                    .bold()
                    .font(.largeTitle)
                    .padding(35)
                Spacer()
                
                if viewModel.value != nil {
                    Text(viewModel.value!)
                       
                } else {
                    Text("Display value")
                                  .padding()
                                 
                }

                Spacer()
                if isOn {
                    VStack {
                        HStack {
                                      Text("To-Do:")
                                          .fontWeight(.bold)
                                          .font(.largeTitle)
                                      Spacer()
                                          .frame(width: 130)
                                      Button {
                                          showingAlert2.toggle()
                                      } label: {
                                          Image(systemName: "trash")
                                              .resizable()
                                      }
                                      .frame(width: 22, height: 25)
                                      .alert("Press a Task to Delete It", isPresented: $showingAlert2) {
                                          
                                          ForEach(tasks.indices, id: \.self) { index in
                                              Button {
                                                  taskToDelete = tasks[index]
                                                  deletedTasks.append(tasks[index].name)
                                                  // Delete the task from the tasks array
                                                  tasks.remove(at: index)
                                                  
                                              } label: {
                                                  Text(tasks[index].name)
                                              }
                                              
                                          }
                                          Button("Cancel", role: .cancel) { }
                                      }
                                      Spacer()
                                          .frame(width: 15)
                                      Button {
                                          showingAlert1.toggle()
                                          newTask = ""
                                      } label: {
                                          Image(systemName: "plus")
                                              .resizable()
                                      }
                                      .frame(width: 25, height: 25)
                                      .alert("Add a New Task", isPresented: $showingAlert1) {
                                          TextField("type task here...", text: $newTask)
                                          
                                              .font(.custom("Arial", size: 16))
                                              .frame(width: 50, height: 30)
                                          Button("OK", action: addATask)
                                          Button("Cancel", role: .cancel) { }
                                      }
                                      
                                      
                                  }
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack {
                                Text(tasks[index].name)
                .strikethrough(tasks[index].isCompleted)
                .opacity(tasks[index].isCompleted ? 0.5 : 1.0)
                .foregroundColor(colorDictionary[textColor] ?? .black)
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
            .onAppear(perform:
                        checkForDailyReset
            
            )
            .onAppear {
                viewModel.readValue()
            }
        }
        )
    }

    private func checkForDailyReset() {
        let calendar = Calendar.current
        if !calendar.isDateInToday(lastResetDate) {
            for index in tasks.indices {
                tasks[index].isCompleted = false
            }
            lastResetDate = Date()
            number += 1
        }
    }
    func addATask(){
            tasks.append(Task(name: newTask, isCompleted: false))
        }
//   private func check() -> Int {
//            if let referenceDate = UserDefaults.standard.object(forKey: "reference") as? Date {
//                // reference date has been set, now check if date is not today
//                if !Calendar.current.isDateInToday(referenceDate) {
//                    // if date is not today, do things
//                    // update the reference date to today
//                    UserDefaults.standard.set(Date(), forKey: "reference")
//                    number += 1
//                    return number
//                }
//            } else {
//                // reference date has never been set, so set a reference date into UserDefaults
//                UserDefaults.standard.set(Date(), forKey: "reference")
//                number += 1
//
//                return number
//            }
//        number += 1
//
//            return number
//        }
}

#Preview {
    ContentView()
}
