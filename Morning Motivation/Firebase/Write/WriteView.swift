//
//  SwiftUIView.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import SwiftUI
import Foundation
import Firebase
struct WriteView: View {
    @StateObject var viewModel = WriteViewModel()
    @State var content: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
            Button {
                viewModel.pushNewValue(value: content)
            } label: {
                Text("Push")
                    .padding()
            }
//            Button {
//                viewModel.pushObject()
//            } label: {
//                Text("Push Object")
//                    .padding()
//            }

        }
    }
}

#Preview {
    WriteView()
}
