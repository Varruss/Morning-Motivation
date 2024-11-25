//
//  ReadViewModel.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import SwiftUI
import Foundation
import FirebaseDatabase
class ReadViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    
    @Published var value: String? = nil
    
    func readValue() {
        ref.child("Quote1").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String
        }
    }
}
