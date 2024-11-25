//
//  Object.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import Foundation
class ObjectView: Encodable {
    var id: String = ""
    var quote: String = ""
    var name: String = ""
}
extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
