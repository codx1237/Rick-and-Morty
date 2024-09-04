//
//  MainView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 2.09.2024.
//

import SwiftUI
import NukeUI

struct MainView: View {
    @StateObject private var characterModel = CharacterModel()
    var body: some View {
                  
        NavigationStack{
            VStack{
                Image("img")
                    .resizable()
                    .frame(maxWidth: 350 ,maxHeight: 300)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous))
                
                HStack{
                    Text("Characters")
                        .font(.title)
                        .foregroundStyle(Color.blue)
                        .bold()
                    Spacer()
                }.padding(.top).padding(.leading,10)
                
                HStack{
                    Text("Main Characters")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(Color.green)
                    Spacer()
                }.padding()
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(characterModel.characters) { char in
                            NavigationLink(value: char) {
                                CharacterCellView(character: char)
                                    .padding(.leading)
                            }
                        }
                    }.padding(.leading,5)
                        .navigationDestination(for: Character.self) { char in
                            CharacterDetailView(character: char)
                        }
                }
                Spacer()
            }.task {
                await characterModel.fetchCharacters()
            }
        }
        

        
        
        
        
    }
}

#Preview {
    MainView()
}
