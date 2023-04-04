
import Foundation

enum FoodCategory : Int, CaseIterable {
    case all = 0
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    case fifth = 5
    
    func toString() -> String {
        switch self {
        case .all:
            return "Все"
        case .first:
            return "Первая"
        case .second:
            return "Вторая"
        case .third:
            return "Третья"
        case .fourth:
            return "Четвертая"
        case .fifth:
            return "Пятая"
        }
    }
}

final class FoodViewModel {
    
    let title: String
    
    let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum elementum dignissim. Quisque placerat ligula ligula, et eleifend sem fermentum consectetur. Vivamus molestie nisl tellus, vel rutrum massa imperdiet dignissim."
    
    let category: FoodCategory = FoodCategory.allCases.filter { category in
        return category.rawValue > 0
    }.randomElement() ?? .first
    
    let imageUrl: String
    
    let price: Int = Int.random(in: 1...3000)
    
    init(_ food: Food) {
        self.title = food.title
        self.imageUrl = food.imageUrl
    }
}
