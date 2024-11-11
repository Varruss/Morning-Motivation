//
//  MotivationOfTheDay.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/7/24.
//

import SwiftUI



struct MotivationOfTheDay: View {

    @AppStorage("isOn") var isOn = true
    @AppStorage("OutlineOn") var OutlineOn = true
    @AppStorage("ColorScheme") var ColorScheme = false
    var body: some View {
        ZStack{
            if OutlineOn == true {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.indigo, lineWidth: 25)
                    .ignoresSafeArea()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.clear)
                            .ignoresSafeArea()
                    )
                    .shadow(color: Color.indigo.opacity(1), radius: 15, x: 0, y: 0)
                    .ignoresSafeArea()
            }
            VStack{
                Text("Motivation")
                    .bold()
                    .font(.largeTitle)
                    .padding(35)
                Spacer()
                if isOn == true {
                    Text("Test")
                }
            }
        }
    }
}

#Preview {
    MotivationOfTheDay()
}
