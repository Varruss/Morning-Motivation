//
//  ReadView.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import SwiftUI
import Foundation
import FirebaseDatabase

struct ReadView: View {
    @StateObject private var viewModel = ReadViewModel()

    var body: some View {
        VStack{
            if viewModel.value != nil {
                Text(viewModel.value!)
                    .padding()
                
            } else {
                Text("Display value")
                    .padding()
                
            }
        }
        .onAppear {
            viewModel.readValue()
        }
    }
}



//struct ReadView: View {
//    @State var viewModel = ReadViewModel()
//    var body: some View {
//        VStack {
//            if viewModel.object != nil {
//                Text(viewModel.object?.quote ?? "No work")
//                              .padding()
//                              .background(
//                                  Color.gray )
//            } else {
//                Text("Display value")
//                              .padding()
//                              .background(
//                                  Color.gray )
//            }
//          
//            Button {
//                viewModel.readObject()
//            } label: {
//                Text("Read")
//            }
//        }
//    }
//}

#Preview {
    ReadView()
}
