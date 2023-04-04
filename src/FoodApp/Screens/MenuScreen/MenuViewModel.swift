
import Foundation

final class MenuViewModel {
    
    private let foodProvider: FoodProviderProtocol
    
    init(foodProvider: FoodProviderProtocol){
        self.foodProvider = foodProvider
    }
    
    var foodCollection: [FoodViewModel] = []
    
    func load(completion: @escaping ((_ result: Result<[FoodViewModel], Error>) -> Void)) {
        foodProvider.performFoodRequest { result in
        
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let foodCollection):
                    self.foodCollection = foodCollection.map { food in
                        return FoodViewModel(food: food)
                    }
                    completion(.success(self.foodCollection))
                }
            }

        }
    }
}
