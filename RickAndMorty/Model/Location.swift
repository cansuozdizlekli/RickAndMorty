//
//  Location.swift
//  RickAndMorty
//
//  Created by Cansu Özdizlekli on 4/20/23.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let info: Info
    let results: [LocationResult]
}

// MARK: - Info
struct LocationInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: JSONNull?
}

// MARK: - Result
struct LocationResult: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}

