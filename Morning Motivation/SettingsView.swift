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
    var body: some View {
            ZStack{
                if OutlineOn == true {
                    RoundedRectangle(cornerRadius: 65)
                        .stroke(Color.indigo, lineWidth: 15)
                        .ignoresSafeArea()
                        .background(
                            RoundedRectangle(cornerRadius: 65)
                                .fill(Color.clear)
                                .ignoresSafeArea()
                        )
                        .shadow(color: Color.indigo.opacity(1), radius: 15, x: 0, y: 0)
                        .ignoresSafeArea()
                }
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .bold()
                        .padding(35)
                    Spacer()
                }
                VStack {
                    Spacer()
                Toggle("Task List", systemImage: isOn ? "square.stack.3d.up.fill" : "square.stack.3d.up.slash.fill", isOn: $isOn)

                    .font(.largeTitle)

                    .tint(.indigo)

                    .toggleStyle(.button)

                    .contentTransition(.symbolEffect)

                    .frame(alignment: .leading)

                    .padding()

                    

                Toggle("Enhanced Look", systemImage: OutlineOn ? "livephoto" : "livephoto.slash", isOn: $OutlineOn)

                    .font(.largeTitle)

                    .tint(.indigo)

                    .toggleStyle(.button)

                    .contentTransition(.symbolEffect)

                    .frame(alignment: .leading)

                Toggle("Dark Mode", systemImage: ColorScheme ? "lightbulb.fill" : "lightbulb.slash", isOn: $ColorScheme)

                    .font(.largeTitle)

                    .tint(.indigo)

                    .toggleStyle(.button)

                    .contentTransition(.symbolEffect)

                    .padding()

            }

        }

    }

}


#Preview {
    SettingsView()
}
