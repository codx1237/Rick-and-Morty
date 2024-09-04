//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 2.09.2024.
//

import Foundation


@MainActor
class CharacterModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var isLoading = false
    
    
    
    func fetchCharacters() async {
        isLoading = true
        
        do{
            let characters = try await fetchCharactersFromApi()
            self.characters = characters
            isLoading = false
        } catch {
            print("error \(error.localizedDescription)")
        }
    }

    
    
    private func fetchCharactersFromApi() async throws -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw NetworkError.badUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let characterResponse = try? JSONDecoder().decode(CharacterResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return characterResponse.results
    }
    

    
    
}


enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
}
