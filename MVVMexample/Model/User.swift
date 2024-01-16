import Foundation

//Any는 Codable프로토콜을 따르지 않음
struct User: Codable {
    var name : String
    var userid : String
    var pwd : String
}

let defaults = UserDefaults.standard

var datas: [User] {
    get {
        if let savedData = defaults.data(forKey: "users"),
           let decodedData = try? JSONDecoder().decode([User].self, from: savedData) {
            return decodedData
        }
        return []
    }
    set {
        if let encodedData = try? JSONEncoder().encode(newValue) {
            defaults.set(encodedData, forKey: "users")
        }
    }
}

//동시성 문제 - Race condition
