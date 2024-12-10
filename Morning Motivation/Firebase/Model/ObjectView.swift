//
//  Object.swift
//  Morning Motivation
//
//  Created by Jonas R. Gregory on 11/25/24.
//

import Foundation
import SwiftUI

struct ObjectView: Encodable, Decodable {
    var id: String
    var name: String
    var quote: String
}

extension Encodable {
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
