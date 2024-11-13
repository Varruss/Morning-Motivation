//
//  SubmitQuote.swift
//  Morning Motivation
//
//  Created by Victor B. Tabacoff on 11/13/24.
//
import SwiftUI

struct SubmitQuoteView: View {
    @State private var newQuote: String = ""
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
            VStack {
                Text("Submit Your Quote")
                    .bold()
                    .font(.largeTitle)
                    .padding(35)
                Spacer()
                TextField("Enter your quote here", text: $newQuote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Submit") {
                    // to Firebase
                }
                .padding()
            }
        }
    }
}
#Preview {
    SubmitQuoteView()
}
