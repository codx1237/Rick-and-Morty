//
//  Location.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import Foundation


struct Mylocation: Decodable,Identifiable,Hashable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}


struct MylocationsResponse: Decodable {
    let results: [Mylocation]
}
