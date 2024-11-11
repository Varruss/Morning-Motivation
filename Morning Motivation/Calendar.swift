//
//  CalendarView.swift
//  Morning Motivation
//
//  Created by Luke R. Christopulos on 11/11/24.
//

import SwiftUI

struct CalendarView: View {
    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
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
            VStack{
                Text("Calendar")
                    .font(.largeTitle)
                    .bold()
                    .padding(35)
                Spacer()
            }
        }
    }
}

#Preview {
    CalendarView()
}
