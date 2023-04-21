//
//  File.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation
enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
        
    private let baseURL = "https://rickandmortyapi.com/api"
    private let imageBasePath = "https://image.tmdb.org/t/p/original/"
    
    func requestUrl(url: String) -> String {
        return baseURL + url
    }

    func getImagePath(url: String) -> String {
        return imageBasePath + url
    }
}
