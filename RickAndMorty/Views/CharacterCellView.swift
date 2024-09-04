//
//  CharacterCellView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 2.09.2024.
//

import SwiftUI
import NukeUI

struct CharacterCellView: View {
    let character: Character
    
    var body: some View {
        
        VStack{
            LazyImage(url: URL(string: character.image)) { state in
                if let image = state.image {
                    image
                    .resizable()
                    .frame(width: 150,height: 200)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                } else if state.error != nil {
                    Color.red.frame(width: 60,height: 60).clipShape(Circle()) // Indicates an error
                } else {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                        .fill(Color.orange)
                        .frame(width: 150,height: 200)
                        .overlay {
                            ProgressView("")
                        }
                }
            }
        Text(character.name)
            .bold()
            .foregroundStyle(Color.black)
        Text("\(character.species), \(character.status)")
            .font(.subheadline)
            .foregroundStyle(Color.black)
        }
        

        

        
    }
}

#Preview {
    CharacterCellView(character: Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", location: Location(name: "Citadel of Ricks"), origin: Origin(name: "Earth (C-137)")))
}
