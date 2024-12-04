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
    var body: some View {
        ZStack{
            if OutlineOn == true {
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
            VStack{ NavigationView{
                Form{
                    Section(header: Text("Display"),
                            footer: Text("Dark mode will override system preferences.")){
                        
                        Toggle("Enhanced Look", systemImage: OutlineOn ? "livephoto" : "livephoto.slash", isOn: $OutlineOn)
                            .tint(.blue)

                           
                        Toggle("Dark Mode", systemImage: ColorScheme ? "lightbulb" : "lightbulb.slash", isOn: $ColorScheme)
                            .tint(.blue)
                        
                    }
                    Section(header: Text("Features"),
                            footer: Text("Turning on notifications allows us to send you reminders everday when the next motivation is available.")){
                        Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)
                            .tint(.blue)
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
            }
        }
    }
    func submitAQuote(){
        
    }
}

#Preview {
    ContentView()
}
