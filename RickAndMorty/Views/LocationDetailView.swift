//
//  LocationDetailView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import SwiftUI
import NukeUI

struct LocationDetailView: View {
    @Environment(\.dismiss) var dissmiss
    @ObservedObject var locationModel: LocationModel



    let location: Mylocation
    var body: some View {
        VStack(){
            ZStack(alignment: .topLeading){
                Image("AnatomyPark")
                    .resizable()
                    .frame(maxWidth: .infinity,maxHeight: 350)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                    
                Button(action: {
                    dissmiss()
                }, label: {
                    Text("←")
                        .font(.system(size: 35))
                        .foregroundStyle(Color.black)
                        .padding()
                        .padding(.top)
                })
                    
            }
            
            HStack{
                Text(location.name)
                    .foregroundStyle(Color("TabbarColor"))
                    .font(.title)
                    .bold()
                Spacer()
            }.padding(.leading).padding(.top)
            
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                .fill(Color.black.opacity(0.5))
                .frame(width: 300,height: 150)
                .shadow(color: .black, radius: 10,x: 1,y: 1)
                .overlay(alignment: .leading, content: {
                    VStack(alignment: .leading ,spacing: 10){
                        HStack{
                            Text("Type:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(location.type)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }
                        HStack{
                            Text("Dimentions:")
                                .foregroundStyle(Color.yellow)
                                .foregroundStyle(Color.yellow)
                                .font(.title2)
                            Text(location.dimension)
                                .foregroundStyle(Color.white)
                                .font(.title3)
                        }

                        
                        Spacer()
                    }.padding()
                })
            
            HStack{
                Text("Residents")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color.purple)
                Spacer()
            }.padding()
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(locationModel.charBasedLoc,id: \.self){ res in
                        LazyImage(url: URL(string: res.image)) { state in
                            if let image = state.image {
                                image
                                .resizable()
                                .frame(width: 60,height: 60)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            } else if state.error != nil {
                                Color.red.frame(width: 60,height: 60).clipShape(Circle()) // Indicates an error
                            } else {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                                    .fill(Color.orange)
                                    .frame(width: 60,height: 60)
                                    .overlay {
                                        ProgressView("")
                                    }
                            }
                        }
                    }
                }.padding(.leading)
            }
            
            
            
            
            
            Spacer()
        }.navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: .top)
        .task {
            do{
                try await locationModel.getCharactersBasedOnLocation(urls: location.residents)
            }catch {

            }
        }
        
        
        
    }
}

#Preview {
    LocationDetailView( locationModel: LocationModel(), location: Mylocation(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: [ "https://rickandmortyapi.com/api/character/38",    "https://rickandmortyapi.com/api/character/45"]))
}
