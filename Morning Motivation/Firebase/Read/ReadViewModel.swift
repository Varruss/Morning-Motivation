////
////  ReadViewModel.swift
////  Morning Motivation
////
////  Created by Jonas R. Gregory on 11/25/24.
////
//
import SwiftUI
import Foundation
import FirebaseDatabase
import Combine

//class RealtimeDatabaseViewModel: ObservableObject {
//    @Published var items: [Item] = []
//
//    private var databaseRef: DatabaseReference = Database.database().reference()
//
//    init() {
//        fetchData()
//    }
//
//    func fetchData() {
//        databaseRef.child("0").observe(.value) { snapshot in
//            var newItems: [Item] = []
//
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let value = childSnapshot.value as? [String: Any],
//                   let name = value["name"] as? String,
//                   let quoteString = value["quote"] as? String {
//                    let item = Item(id: childSnapshot.key, name: name, quote: quoteString)
//                    newItems.append(item)
//                }
//            }
//
//            DispatchQueue.main.async {
//                self.items = newItems
//            }
//        }
//    }
//}










class ReadViewModel: ObservableObject {
    
    var ref = Database.database().reference()
    
    
    @Published var value: String? = nil
    @Published var object: ObjectView? = nil
    @AppStorage("timer") var number = 0
    func readValue() {
        
        ref.child("\(number)").child("quote").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String
        }

    }
    func observerDataChange() {
        ref.child("Quote1").observe(.value) { snapshot in
            self.value = snapshot.value as? String
        }
    }
//    func check() -> Int {
//            if let referenceDate = UserDefaults.standard.object(forKey: "reference") as? Date {
//                // reference date has been set, now check if date is not today
//                if !Calendar.current.isDateInToday(referenceDate) {
//                    // if date is not today, do things
//                    // update the reference date to today
//                    UserDefaults.standard.set(Date(), forKey: "reference")
//                    number += 1
//                    return number
//                }
//            } else {
//                // reference date has never been set, so set a reference date into UserDefaults
//                UserDefaults.standard.set(Date(), forKey: "reference")
//                number += 1
//
//                return number
//            }
//        number += 1
//
//            return 0
//        }
//    func readObject() {
//        ref.child("0").observeSingleEvent(of: .value) { snapshot in
//              
//            guard let value = snapshot.value as? [String: Any],
//                  let jsonData = try? JSONSerialization.data(withJSONObject: value),
//                  let quote = try? JSONDecoder().decode(ObjectView.self, from: jsonData) else {
//                      return
//                  }
//            self.object = quote
//        }
//    }
}
