//
//  ViewModel.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/21/24.
//

import SwiftUI
import Foundation
import FirebaseFirestore



class QuoteViewModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
//    func updateData(quoteToUpdate: Quote) {
//        let db = Firestore.firestore()
//        
//        db.collection("quotes").document(quoteToUpdate.id).setData(["Quote" : "Updated Quote"], merge:  true)
//    }
//    
//    func getData() {
//        
//        let db = Firestore.firestore()
//        
//        db.collection("quotes").getDocuments { snapshot, error in
//            
//            if error == nil {
//                
//                if let snapshot = snapshot {
//                    DispatchQueue.main.async {
//                        
//                    }
//                    self.quotes = snapshot.documents.map { d in
//                        
//                        return Quote(quote: d["Quote"] as? String ?? "",
//                                     name: d["name"] as? String ?? "",
//                                     id: d.documentID)
//                    }
//                }
//            }
//            else {
//                
//            }
//        }
//        
//    }
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("quotes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.quotes = documents.map { (queryDocumentSnapshot) -> Quote in
                let data = queryDocumentSnapshot.data()
                
                let quote = data["quote"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let id = data["id"] as? String ?? ""
                return Quote(quote: quote, name: name, id: id)
            }
        }
    }
}
