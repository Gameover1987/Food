
import Foundation

protocol FoodProviderProtocol {
    func performFoodRequest(completion: @escaping ((Result<[Food], Error>) -> Void))
}

enum ApiErrors : String, Error {
    case dataIsNil = "Data is nil!"
    case jsonParseError = "JSON parse error"
}

final class FoodProvider : FoodProviderProtocol {
    
    func performFoodRequest(completion: @escaping ((Result<[Food], Error>) -> Void)) {
        let request = getRequest()
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiErrors.dataIsNil))
                return
            }
            
            do
            {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                var string = String(data: data, encoding: .utf8)
                let foods = try decoder.decode([Food].self, from: data)
                completion(.success(foods))
            }
            catch {
                print(error)
                completion(.failure(error))
            }
        })

        dataTask.resume()
    }
    
    private func getRequest() -> NSMutableURLRequest {
        let headers = [
            "X-RapidAPI-Key": "c27ecb18f5msh16b8b89ce7d5106p1c98d1jsndd5de149ffd7",
            "X-RapidAPI-Host": "the-mexican-food-db.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://the-mexican-food-db.p.rapidapi.com/")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
