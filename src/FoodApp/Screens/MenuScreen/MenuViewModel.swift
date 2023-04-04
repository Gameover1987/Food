
import Foundation

final class MenuViewModel {
    
    private var sourceCollection: [FoodViewModel] = []
    private let foodProvider: FoodProviderProtocol
    
    init(foodProvider: FoodProviderProtocol){
        self.foodProvider = foodProvider
    }
    
    var foodCollection: [FoodViewModel] = []
    
    var selectedCategory = FoodCategory.all {
        didSet {
            foodCollection = sourceCollection.filter({ foodViewModel in
                if (selectedCategory == .all) {
                    return true
                }
                
                return foodViewModel.category == selectedCategory
            })
            
            collectionChangedHandler?(selectedCategory)
        }
    }
    
    var collectionChangedHandler: ((FoodCategory) -> Void)?
    
    func load() {
        foodProvider.performFoodRequest { result in
        
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let foodCollection):
                    self.sourceCollection = foodCollection.map { food in
                        return FoodViewModel(food)
                    }
                    
                    self.selectedCategory = .all
                }
            }
        }
    }
}
