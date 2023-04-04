
import Foundation

struct FoodRequest : Codable {
    var items: [Food]
}

struct Food : Codable {
    var title: String
    
    var imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "image"
    }
}
