//
//  ReadView.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import SwiftUI
import Foundation
struct ReadView: View {
    @StateObject var viewModel = ReadViewModel()
    var body: some View {
        VStack {
            if viewModel.value != nil {
                Text(viewModel.value!)
                              .padding()
                              .background(
                                  Color.gray )
            } else {
                Text("Display value")
                              .padding()
                              .background(
                                  Color.gray )
            }
          
            Button {
                viewModel.readValue()
            } label: {
                Text("Read")
            }
        }
    }
}

#Preview {
    ReadView()
}
