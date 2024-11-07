//
//  SettingsView.swift
//  Morning Motivation
//
//  Created by Luke R. Christopulos on 11/7/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var isOn = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 65)
                .stroke(Color.cyan, lineWidth: 15)
                .ignoresSafeArea()
                .background(
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color.clear)
                        .ignoresSafeArea()
                    
                )
                .shadow(color: Color.blue.opacity(1), radius: 15, x: 0, y: 0)
                .ignoresSafeArea()
            
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
                Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)
                    .font(.largeTitle)
                    .tint(.blue)
                    .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                    .padding()
                
                VStack {
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    SettingsView()
}
