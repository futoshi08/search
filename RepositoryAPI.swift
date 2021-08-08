//
//  RepositoryAPI.swift
//  app2021
//
//  Created by futoshi on 2021/04/28.
//

import Alamofire
import Foundation

enum RepositoryAPI {
    static func searchRepository(with name : String , completion: @escaping(Result<[Repository], Error >) -> Void) {
        DispatchQueue.global(qos: .background) .async {
            AF.request("https://api.github.com/search/repositories",parameters:["q" : name]).response { (response) in
                guard let data = response.data else {
                    DispatchQueue.main.async {
                        completion(.failure(APIError.dataNotFound))
                    }
                    return
                }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [] ) as! [String: Any]
                    print(json.keys)
                    let repositoryData = try JSONSerialization.data(withJSONObject: json["items"] ?? [] , options: [])
                    let repositoies = try JSONDecoder().decode([Repository].self, from: repositoryData)
                    DispatchQueue.main.async {
                        completion(.success(repositoies))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    
    static func hoge(a:Int) throws -> String {
        if a == 0 {
            throw APIError.dataNotFound
        }
        return "hoge"
    }
    
}
