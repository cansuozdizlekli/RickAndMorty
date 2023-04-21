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
    var multipleCharacterItems = [CharacterResult]()
    var locationItems = [LocationResult]()
    var locationNameArray = [String]()
    var errorCallback : ((String)->())?
    var successCallback : (()->())?
    
    
    func getMultipleCharacters(CharacterIdsArray: [Int]){
        manager.getMultipleCharacters(CharacterIdsArray: CharacterIdsArray) { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.multipleCharacterItems = items ?? []
                print("multiplecanım",self?.multipleCharacterItems)
                self?.successCallback?()
            }
        }
    }
        
    
    func getCharacters() {
        manager.getCharacters { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.characterItems = items ?? []
                print("deneme",self!.characterItems)
                self?.successCallback?()
            }
            
        }
    }
    
    func getLocations() {
        manager.getLocations { [weak self] items, error in
            if let error = error {
                self?.errorCallback?(error.localizedDescription)
            } else {
                self?.locationItems = items ?? []
                print("neymiski",self!.locationItems.count)
                self?.successCallback?()
            }
            
        }
        
    }
}
