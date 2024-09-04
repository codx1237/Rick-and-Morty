//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import SwiftUI

struct LocationView: View {
    @StateObject var locationModel = LocationModel()
    var locationImages = ["AbadangoCluster",""]

    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Location")
                        .font(.title)
                        .foregroundStyle(Color("TabbarColor"))
                        .bold()
                    Spacer()
                }.padding()
                
                ScrollView{
                    ForEach(locationModel.locations) { loc in
                            VStack(spacing: 10){
                                NavigationLink(value: loc) {
                                    VStack(alignment: .leading){
                                        Image("location")
                                            .resizable()
                                            .frame(width: 340,height: 180)
                                            .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                                        Text(loc.name)
                                            .foregroundStyle(Color.black)
                                            .bold()
                                        Text(loc.type)
                                            .foregroundStyle(Color.black)
                                    }
                                }
                            }
                        }
                    

                }.scrollIndicators(.hidden)
                    .navigationDestination(for: Mylocation.self) { loc in
                        LocationDetailView(locationModel: locationModel, location: loc)
                    }
                
                
                Spacer()
            }.task {
                await locationModel.fetchLocations()
            }
        }
    }
}

#Preview {
    LocationView()
}
