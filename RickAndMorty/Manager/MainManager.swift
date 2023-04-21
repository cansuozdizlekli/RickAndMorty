//
//  MainManager.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation

protocol MainManagerProtocol {
    func getCharacters(complete: @escaping(([CharacterResult]?, Error?)->()))
    func getLocations(complete: @escaping(([LocationResult]?, Error?)->()))
    func getMultipleCharacters(CharacterIdsArray: [Int], complete: @escaping(([CharacterResult]?, Error?)->()))
}

class MainManager : MainManagerProtocol {
    func getMultipleCharacters(CharacterIdsArray: [Int], complete: @escaping (([CharacterResult]?, Error?) -> ())) {
        var charArr : [CharacterResult] = []
        var charUrl = Endpoint.character.path + "/"
        CharacterIdsArray.forEach { ids in
            if CharacterIdsArray.count > 1 {
                charUrl = charUrl + "\(ids),"
            }else {
                charUrl = charUrl + "\(ids)"
            }
        }
        if CharacterIdsArray.count > 1 {
            charUrl.removeLast()
            
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
    
    
    static let shared = MainManager()
    
    func getCharacters(complete: @escaping (([CharacterResult]?, Error?) -> ())) {
        NetworkManager.shared.request(type: Character.self,
                                      url: Endpoint.character.path,
                                      method: .get) { response in
            switch response {
            case .success(let data):
                print("burasııı")
                complete(data.results, nil)
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
