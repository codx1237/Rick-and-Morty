//
//  SeasonsModel.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 4.09.2024.
//

import Foundation

@MainActor
class SeasonsModel: ObservableObject{
    @Published var seasons: [Seasons] = []
    @Published var isLoading = false
    @Published var error = ""

    func fetchSeasons() async {
        isLoading = true
        do{
            let seasons = try await fetchSeasonsFromApi()
            self.seasons = seasons
            isLoading = false
        }catch{
            self.error = error.localizedDescription
            print(error.localizedDescription)
        }
    }


    private func fetchSeasonsFromApi() async throws -> [Seasons] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            throw NetworkError.badUrl
        }

        let (data,response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }

        guard let seasonResponse = try? JSONDecoder().decode(SeasonsResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return seasonResponse.results

    }





}
