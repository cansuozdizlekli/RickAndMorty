//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type,
                             url: String,
                             method: HTTPMethod,
                             completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "", method: method).responseData { response in
            switch response.result {
            case .success(let data):
                print("cemilll",data)
                self.handleResponse(data: data) { response in
                    completion(response)
                    print("cemilll",response)
                }
            case .failure( _):
                completion(.failure(.generalError))
            }
        }
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
        do {
            print("neyazimki data",data)
            let result = try JSONDecoder().decode(T.self, from: data)
            print("neyazimki result",result)
            completion(.success(result))
        } catch let error {
            print("neyazimki catch", String(describing: error))
            completion(.failure(.invalidData))
        }
    }
    
    func requestMultipleCharacters<T: Codable>(type: T.Type,
                             url: String,
                             method: HTTPMethod,
                             completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "", method: method).responseData { response in
            switch response.result {
            case .success(let data):
                print("cansusum",data)
                self.handleResponseArrayOfObject(data: data) { response in
                    completion(response)
                    print("cansusum",response)
                }
            case .failure( _):
                completion(.failure(.generalError))
            }
        }
    }

    fileprivate func handleResponseArrayOfObject<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
        do {
            print("neyazimki data",data)
            let result = try JSONDecoder().decode([T].self, from: data)
            print("neyazimki result",result)
            completion(.success(result as! T))
        } catch let error {
            print("neyazimki catch", String(describing: error))
            completion(.failure(.invalidData))
        }
    }
    
}
