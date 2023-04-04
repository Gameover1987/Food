
import Foundation

final class MenuViewModel {
    
    private let foodProvider: FoodProviderProtocol
    
    init(foodProvider: FoodProviderProtocol){
        self.foodProvider = foodProvider
    }
    
    var foodCollection: [Food] = []
    
    func load(completion: @escaping ((_ result: Result<[Food], Error>) -> Void)) {
        foodProvider.performFoodRequest { result in
        
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let foodCollection):
                    print(foodCollection)
                    completion(result)
                }
            }

        }
    }
}
