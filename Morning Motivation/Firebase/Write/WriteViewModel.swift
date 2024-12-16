//
//  WriteViewModel.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import SwiftUI
import Foundation
import FirebaseDatabase
class WriteViewModel: ObservableObject {
    
    private let ref = Database.database().reference()
    
    private var number = 0
    func pushNewValue(value: String) {
        let uuid = NSUUID().uuidString.lowercased()

        //  ref.childByAutoId().setValue(value)
        ref.child("W").child("sumbitted quote id; \(uuid)").setValue(value)
        number += 1
    }
    
//    func pushObject(){
//        var generateObject = ObjectView()
//        generateObject.id = String(number)
//        generateObject.quote = "Demo Quote"
//        generateObject.name = "Demo Name"
//        
//        ref.child(generateObject.id).setValue(generateObject.toDictionary)
//        
//        number += 1
//    }
}
