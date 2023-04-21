//
//  Service.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation

enum Endpoint: String {
    case character = "/character"
    case location = "/location"

    var path: String {
        switch self {
        case .character:
            return NetworkHelper.shared.requestUrl(url: Endpoint.character.rawValue)
        case .location:
            return NetworkHelper.shared.requestUrl(url: Endpoint.location.rawValue)
        }
    }
}
