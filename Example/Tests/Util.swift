//
//  Util.swift
//  TransformableObject
//
//  Created by Yu Sugawara on 7/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

extension ObjectType {
    func equalValues<T: ObjectType>(to other: T) -> Bool {
        return bool == other.bool
            && int == other.int
            && float == other.float
            && double == other.double
            && string == other.string
            && date.timeIntervalSince1970 == other.date.timeIntervalSince1970
            && data == other.data
    }
}

struct JSONCreator {
    private init() {}
    
    static func json() -> [String: Any] {
        return ["bool": true,
                "int": IntMax(),
                "float": Float.greatestFiniteMagnitude,
                "double": Double.greatestFiniteMagnitude,
                "string": UUID().uuidString,
                "date": DateTransform().transformToJSON(Date())!,
                "data": DataTransform().transformToJSON(UUID().uuidString.data(using: .utf8)!)!]
    }
}
