//
//  Model.swift
//  TransformableObject
//
//  Created by Yu Sugawara on 7/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import TransformableObject
import ObjectMapper
import RealmSwift

protocol ObjectType: Mappable {
    var bool: Bool { get set }
    var int: Int { get set }
    var float: Float { get set }
    var double: Double { get set }
    var string: String { get set }
    var date: Date { get set }
    var data: Data { get set }
}

extension ObjectType {
    mutating func mapping(map: Map) {
        bool <- map["bool"]
        int <- map["int"]
        float <- map["float"]
        double <- map["double"]
        string <- map["string"]
        date <- (map["date"], DateTransform())
        data <- (map["data"], DataTransform())
    }
}

/*---*/

struct Struct: ObjectType {
    var bool = false
    var int = 0
    var float: Float = 0
    var double: Double = 0
    var string = ""
    var date = Date()
    var data = Data()
    
    init?(map: Map) { }
}

extension Struct: TransformableObject {
    typealias TransformedObject = RealmObject
}

/*---*/

class RealmObject: Object, ObjectType {
    dynamic var bool = false
    dynamic var int = 0
    dynamic var float: Float = 0
    dynamic var double: Double = 0
    dynamic var string = ""
    dynamic var date = Date()
    dynamic var data = Data()
    
    required convenience init?(map: Map) {
        self.init()
    }    
}

extension RealmObject: TransformableObject {
    typealias TransformedObject = Struct
}
