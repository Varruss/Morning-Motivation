//
//  ContentView.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/7/24.
//

import SwiftUI



struct ContentView: View {
    @State private var deletedTasks: [String] = [""]
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    var body: some View {
        TabView {
            CalendarView()
                .preferredColorScheme(ColorScheme ? .dark: .light)
                .tabItem {
                    if OutlineOn == true {
                        Label("", systemImage: "calendar.badge.clock")
                    } else {
                        Text("Calendar")
                    }
                }
            MotivationOfTheDay(deletedTasks: $deletedTasks, newTask: "")
                            .preferredColorScheme(ColorScheme ? .dark : .light)
                            .tabItem {
                                if OutlineOn == true {
                                    Label("", systemImage: "star")
                                } else {
                                    Text("Motivation")
                                }
                            }
            ChangeColorView()
                .preferredColorScheme(ColorScheme ? .dark: .light)
                .tabItem {
                    if OutlineOn == true {
                        Label("", systemImage: "paintbrush")
                    } else {
                        Text("Customize")
                    }
                }
            SettingsView(deletedTasks: $deletedTasks)
                            .preferredColorScheme(ColorScheme ? .dark : .light)
                            .tabItem {
                                if OutlineOn == true {
                                    Label("", systemImage: "gear")
                                } else {
                                    Text("Settings")
                                }
                            }
        }
    }
}
#Preview {
    ContentView()
}
