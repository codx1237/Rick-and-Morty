//
//  Seasons.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 4.09.2024.
//

import Foundation

struct Seasons: Decodable,Identifiable,Hashable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
}

struct SeasonsResponse: Decodable {
    let results: [Seasons]
}
