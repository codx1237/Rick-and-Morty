//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import Foundation


@MainActor
class LocationModel: ObservableObject{
    @Published var locations: [Mylocation] = []
    @Published var charBasedLoc: [Character] = []

    func fetchLocations() async {
        do{
            let location = try await fetchLocationsFromApi()
            self.locations = location
        } catch {
            print("error \(error.localizedDescription)")
        }
    }

    private func fetchLocationsFromApi() async throws -> [Mylocation] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
            throw NetworkError.badUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse  = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let locationResponse = try? JSONDecoder().decode(MylocationsResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return locationResponse.results
    }
    
      func getCharactersBasedOnLocation(urls: [String]) async throws {
          charBasedLoc = []
         for urlString in urls {
             guard let url = URL(string: urlString) else {
                 throw NetworkError.badUrl
             }
             let (data,response) = try await URLSession.shared.data(from: url)

             guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                 throw NetworkError.badRequest
             }

             guard let char = try? JSONDecoder().decode(Character.self, from: data) else {
                 throw NetworkError.decodingError
             }
              charBasedLoc.append(char)
         }
         
        



    }
    
    
    
    
    
    
}
