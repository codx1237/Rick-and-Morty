//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 2.09.2024.
//

import SwiftUI
import NukeUI



struct CharacterDetailView: View {
    @Environment(\.dismiss) var dissmiss
    let character: Character
    var body: some View {
        VStack{
            ZStack(alignment:.topLeading){
                LazyImage(url: URL(string: character.image)) { state in
                    if let image = state.image {
                        image
                        .resizable()
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity,maxHeight: 300)
                        .aspectRatio(contentMode: .fill)
                    } else if state.error != nil {
                        Color.red.frame(width: 60,height: 60).clipShape(Circle()) // Indicates an error
                    } else {
                        ProgressView("loading") // Acts as a placeholder
                    }
                }
                Button(action: {
                    dissmiss()
                }, label: {
                    Text("←")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.black)
                        .padding(.leading)
                })
              
            }


            HStack{
                Text(character.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.yellow)
                Spacer()
            }.padding()

            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                .fill(Color.black.opacity(0.5))
                .frame(width: 300,height: 250)
                .shadow(color: .black, radius: 10,x: 1,y: 1)
                .overlay(alignment: .leading, content: {
                    VStack(alignment: .leading ,spacing: 10){
                        HStack{
                            Text("Status:")
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(character.status)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        HStack{
                            Text("Species:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(character.species)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        HStack{
                            Text("Gender:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(character.gender)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        HStack{
                            Text("Origin:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(character.origin.name)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        HStack{
                            Text("Location:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(character.location.name)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        
                        Spacer()
                    }.padding()
                })


            
            
            Spacer()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    CharacterDetailView(character: Character(id: 1, name: "Rick", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", location: Location(name: "Citadel of Ricks"), origin: Origin(name: "Earth (C-137)")))
}
