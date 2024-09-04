//
//  Character.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 2.09.2024.
//

import Foundation

struct Character: Decodable,Identifiable,Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let location: Location
    let origin: Origin
}

struct Origin: Decodable,Hashable {
    let name: String
}

struct Location: Decodable,Hashable {
    let name: String
}

struct CharacterResponse: Decodable {
    let results: [Character]
}
