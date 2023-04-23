//
//  MainManager.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation

protocol MainManagerProtocol {
    func getCharacters(complete: @escaping((Any?, Error?)->()))
    func getLocations(complete: @escaping(([LocationResult]?, Error?)->()))
    func getSingleCharacter(CharacterIdsArray: [Int], complete: @escaping(([CharacterResult]?, Error?)->()))
    
    func getMultipleCharacters(CharacterIdsArray: [Int], complete: @escaping(((Any)?, Error?)->()))
}

class MainManager : MainManagerProtocol {
    
    static let shared = MainManager()
    
    func getMultipleCharacters(CharacterIdsArray: [Int], complete: @escaping (((Any)?, Error?) -> ())) {
        var charArr: [CharacterResult] = []
        var charSetUrl = Endpoint.character.path + "/"
        CharacterIdsArray.forEach { ids in
            charSetUrl = charSetUrl + "\(ids),"
        }
        print("bakalmmm",charSetUrl)
        charSetUrl.removeLast()
        NetworkManager.shared.request(type: [CharacterResult].self,
                                      url: charSetUrl,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                
                print("bakcanım",data)
                complete(data.self, nil)
            case .failure(let error):
                print("olmadı mı")
                complete(nil, error)
            }
        }
    }
    
    
    func getSingleCharacter(CharacterIdsArray: [Int], complete: @escaping (([CharacterResult]?, Error?) -> ())) {
        var charArr : [CharacterResult] = []
        
        var charUrl = Endpoint.character.path + "/"
        CharacterIdsArray.forEach { ids in
            charUrl = charUrl + "\(ids)"
        }
        
        print("bakalmmm",charUrl )
        NetworkManager.shared.request(type: CharacterResult.self,
                                      url: charUrl,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                charArr.append(data)
                print("bakcanım",data)
                complete(charArr, nil)
            case .failure(let error):
                print("olmadı mı")
                complete(nil, error)
            }
        }
    }
    
    
    
    
    func getCharacters(complete: @escaping ((Any?, Error?) -> ())) {
        NetworkManager.shared.request(type: CharacterResult.self,
                                      url: Endpoint.character.path,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                print("burasııı",data)
                complete(data, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
    
    func getLocations(complete: @escaping (([LocationResult]?, Error?) -> ())) {
        NetworkManager.shared.request(type: Location.self,
                                      url: Endpoint.location.path,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                print("neymis",data.results)
                complete(data.results, nil)
            case .failure(let error):
                complete(nil, error)
            }
        }
    }
    
 
    
}
