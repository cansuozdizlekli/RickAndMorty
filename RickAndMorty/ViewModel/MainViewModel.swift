//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation

class MainViewModel {
    let manager = MainManager.shared
    var characterItems = [CharacterResult]()
    var singleCharacterItem = [CharacterResult]()
    var multipleCharacterItems = [CharacterResult]()
    var locationItems = [LocationResult]()
    var locationNameArray = [String]()
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    
    
    func getSingleCharacter(CharacterIdsArray: [Int]){
        manager.getSingleCharacter(CharacterIdsArray: CharacterIdsArray) { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.singleCharacterItem = items ?? []
                self?.successCallback?()
            }
        }
    }
    
    func getMultipleCharacters(CharacterIdsArray: [Int]){
        manager.getMultipleCharacters(CharacterIdsArray: CharacterIdsArray) { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                guard let data = items as? [CharacterResult] else{
                    return
                }
                self?.multipleCharacterItems = data
                self?.successCallback?()
                
            }
        }
    }
    
//    func getCharacters() {
//        manager.getCharacters { [weak self] items, error in
//            if let error = error {
//                self?.errorCallback?(error.localizedDescription)
//            } else {
//                self?.characterItems = items as! [CharacterResult]
//                self?.successCallback?()
//            }
//            
//        }
//    }
    
    func getLocations() {
        manager.getLocations { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.locationItems = items ?? []
                self?.successCallback?()
            }
            
        }
        
    }
}
