// https://github.com/Quick/Quick

import Quick
import Nimble
import TransformableObject
import ObjectMapper
import RealmSwift

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("transform object") {
            beforeEach {
                Realm.Configuration.defaultConfiguration.inMemoryIdentifier = UUID().uuidString
            }
            
            it("struct to realm object") {
                let obj = Struct(JSON: JSONCreator.json())!
                let transformedObj = obj.transformToObject()!
                
                expect(obj.equalValues(to: transformedObj)).to(beTrue())
            }
            
            it("unmanaged realm object to struct") {
                let obj = RealmObject(value: JSONCreator.json())
                let transformedObj = obj.transformToObject()!
                
                expect(obj.equalValues(to: transformedObj)).to(beTrue())
            }
            
            it("managed realm object to struct") {
                let obj = RealmObject(value: JSONCreator.json())
                
                let realm = try! Realm()
                try! realm.write {
                    realm.add(obj)
                }
                
                realm.beginWrite()
                let transformedObj = obj.transformToObject()!
                try! realm.commitWrite()
                
                expect(obj.equalValues(to: transformedObj)).to(beTrue())
            }
        }
    }
}
