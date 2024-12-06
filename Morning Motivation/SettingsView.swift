//
//  SettingsView.swift
//  Morning Motivation
//
//  Created by Luke R. Christopulos on 11/7/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    @AppStorage("Submit") var Submit = true
    @AppStorage("Notifications") var Notifications = false
    @State var showingAlert = false
    @State var newQuote: String = ""
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
    @State private var selectedOption: String = "Completed Tasks"
    @State private var dropDown = false
    var body: some View {
        ZStack{
            if OutlineOn == true {
                RoundedRectangle(cornerRadius: 65)
                    .stroke(colorDictionary[borderColor] ?? .cyan, lineWidth: 15)
                    .ignoresSafeArea()
                    .background(
                        VStack{
                            NavigationView{
                                Form{
                                    Section(header: Text("Display"),
                                            footer: Text("Dark mode will override system preferences.")){
                                        
                                        Toggle("Enhanced Look", systemImage: OutlineOn ? "livephoto" : "livephoto.slash", isOn: $OutlineOn)
                                            .tint(.blue)
                                        
                                        
                                        Toggle("Dark Mode", systemImage: ColorScheme ? "lightbulb" : "lightbulb.slash", isOn: $ColorScheme)
                                            .tint(.blue)
                                        
                                    }
                                    Section(header: Text("Task List"),
                                            footer: Text("Modifications to these settings will take place on the task list inside of the motivation view")){
                                        Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)
                                            .tint(.blue)
                                        Menu {
                                            Button(action: {}, label: {
                                                                     
                                                                          
                                                                         
                                                                  })
                                                                 
                                                              } label: {
                                                                  Label(selectedOption, systemImage: "chevron.down")
                                                                      
                                                                      
                                                                      
                                                              }
                
                                        
                                    }
                                    Section(header: Text("Features"),
                                            footer: Text("Turning on notifications allows us to send you reminders everday when the next motivation is available.")){
                                        Toggle("Notifications", systemImage: Notifications ? "bell" : "bell.slash", isOn: $Notifications)
                                            .tint(.blue)
                                    }
                                    Section {
                                        Button(action: {
                                            submitAQuote()
                                            showingAlert.toggle()
                                        }, label: {
                                            HStack{
                                                Image(systemName: "link")
                                                Text("Submit a Quote")
                                            }
                                        })
                                        .alert("Submit Your Own Quote", isPresented: $showingAlert) {
                                            TextField("type quote here...", text: $newQuote)
                                            
                                                .font(.custom("Arial", size: 16))
                                                .frame(width: 50, height: 30)
                                            Button("OK", action: submitAQuote)
                                            Button("Cancel", role: .cancel) { }
                                        }
                                        
                                    }
                                    .foregroundColor(ColorScheme ? .white : .black)
                                    .font(.system(size: 16, weight: .semibold))
                                    
                                }
                                
                                .navigationTitle("Settings")
                                
                            }
                            // .padding()
                            
                        }
                        
                    )
                    .shadow(color: colorDictionary[borderColor] ?? .cyan, radius: 15, x: 0, y: 0)
                    .ignoresSafeArea()
            }
            else {
                VStack{
                    NavigationView{
                        Form{
                            Section(header: Text("Display"),
                                    footer: Text("Dark mode will override system preferences.")){
                                
                                Toggle("Enhanced Look", systemImage: OutlineOn ? "livephoto" : "livephoto.slash", isOn: $OutlineOn)
                                    .tint(.blue)
                                
                                
                                Toggle("Dark Mode", systemImage: ColorScheme ? "lightbulb" : "lightbulb.slash", isOn: $ColorScheme)
                                    .tint(.blue)
                                
                            }
                            Section(header: Text("Task List"),
                                    footer: Text("Modifications to these settings will take place on the task list inside of the motivation view")){
                                Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)
                                    .tint(.blue)
                                Menu {
                                    Button(action: {}, label: {
                                                             
                                                                  
                                                                 
                                                          })
                                                         
                                                      } label: {
                                                          Label(selectedOption, systemImage: "chevron.down")
                                                              
                                                              
                                                              
                                                      }
        
                                
                            }
                            Section(header: Text("Features"),
                                    footer: Text("Turning on notifications allows us to send you reminders everday when the next motivation is available.")){
                                Toggle("Notifications", systemImage: Notifications ? "bell" : "bell.slash", isOn: $Notifications)
                                    .tint(.blue)
                            }
                            Section {
                                Button(action: {
                                    submitAQuote()
                                    showingAlert.toggle()
                                }, label: {
                                    HStack{
                                        Image(systemName: "link")
                                        Text("Submit a Quote")
                                    }
                                })
                                .alert("Submit Your Own Quote", isPresented: $showingAlert) {
                                    TextField("type quote here...", text: $newQuote)
                                    
                                        .font(.custom("Arial", size: 16))
                                        .frame(width: 50, height: 30)
                                    Button("OK", action: submitAQuote)
                                    Button("Cancel", role: .cancel) { }
                                }
                                
                            }
                            .foregroundColor(ColorScheme ? .white : .black)
                            .font(.system(size: 16, weight: .semibold))
                            
                        }
                        
                        .navigationTitle("Settings")
                        
                    }
                    // .padding()
                    
                }
            }
        }
     
    }
    func submitAQuote(){
        
    }
}

#Preview {
    ContentView()
}
