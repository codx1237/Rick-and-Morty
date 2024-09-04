//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import SwiftUI

struct EpisodeView: View {
    @StateObject var seasonsModel = SeasonsModel()
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment:.bottomLeading){
                ZStack(alignment:.bottomLeading){
                    Image("location")
                        .resizable()
                        .frame(maxWidth: .infinity,maxHeight: 350)

                }.mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .top, endPoint: .bottom))

                VStack(alignment:.leading){
                    Text("Pilot")
                        .font(.title)
                        .foregroundStyle(Color("TabbarColor"))
                        .bold()

                    Text("December 2, 2013 1S1E")
                        .foregroundStyle(Color.black)
                        .bold()

                    Text("Rick encourages Morty who is having reservations about being on an alien planet")

                }.padding(.leading)
            }
            HStack{
                Text("Seasons")
                    .foregroundStyle(Color("TabbarColor"))
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding()

            HStack{
                ForEach(0 ..< 4) { item in
                    Button(action: {

                    }, label: {
                        Text("Season \(item + 1)")
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 12))
                            .bold()
                            .background(Color("TabbarColor"))
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                    })
                }
            }.padding(.leading)

            ScrollView {
                VStack{
                    ForEach(seasonsModel.seasons) { season in
                        HStack(spacing: 10){
                            Image("location")
                                .resizable()
                                .frame(width: 80,height: 80)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))

                            VStack(alignment: .leading,spacing: 5){
                                Text(season.name)
                                Text(season.air_date)
                                    .font(.caption)
                                Text("⭐️⭐️⭐️⭐️⭐️")
                                    .font(.caption)

                            }
                            Spacer()
                        }
                    }
                }.padding()

            }.scrollIndicators(.hidden)


            Spacer()
        }.ignoresSafeArea(edges:.top)
            .task {
                await seasonsModel.fetchSeasons()
            }





    }
}

#Preview {
    EpisodeView()
}
