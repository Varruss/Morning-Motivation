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
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .bold()
                        .padding(35)
                    Spacer()
                    Toggle("Submit a Quote", systemImage: isOn ? "tree" : "square.stack.3d.up.fill", isOn: $showingAlert)
                        .alert("Submit Your Own Quote", isPresented: $showingAlert) {
                            TextField("type quote here...", text: $newQuote)
                               
                                                   .font(.custom("Arial", size: 16))
                                .frame(width: 50, height: 30)
                            Button("OK", action: submitAQuote)
                                   Button("Cancel", role: .cancel) { }
                               }
                        .font(.largeTitle)
                        .tint(.blue)
                        .toggleStyle(.button)
                        .contentTransition(.symbolEffect)
                        .frame(alignment: .leading)
                        .padding()
                        Spacer()
                            .frame(height: 25)
                Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)
                    .font(.largeTitle)
                    .tint(.blue)
                    .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                    .frame(alignment: .leading)
                    .padding()
                    Spacer()
                        .frame(height: 35)
                Toggle("Enhanced Look", systemImage: OutlineOn ? "livephoto" : "livephoto.slash", isOn: $OutlineOn)
                    .font(.largeTitle)
                    .tint(.blue)
                    .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                    .frame(alignment: .leading)
                    Spacer()
                        .frame(height: 30)
                Toggle("Dark Mode", systemImage: ColorScheme ? "lightbulb.fill" : "lightbulb.slash", isOn: $ColorScheme)
                    .font(.largeTitle)
                    .tint(.blue)
                    .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                    .padding()
                    Spacer()
                        .frame(height: 0)
                    
                   
            }
        }
    }
    func submitAQuote(){
        
    }
}
#Preview {
    ContentView()
}
