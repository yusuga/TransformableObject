//
//  TransformableObject.swift
//  Pods
//
//  Created by Yu Sugawara on 7/11/17.
//
//

import ObjectMapper

public protocol TransformableObject {
    associatedtype TransformedObject
}

public extension TransformableObject where Self: Mappable, TransformedObject: Mappable {
    func transformToObject() -> TransformedObject? {
        return TransformedObject(JSON: toJSON())
    }
}
