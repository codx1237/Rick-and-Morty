//
//  RootView.swift
//  RickAndMorty
//
//  Created by Fırat Ören on 3.09.2024.
//

import SwiftUI

struct RootView: View {
    

    
    var body: some View {
        TabView {
            Group{
                MainView()
                    .tabItem {
                        Label("Character", systemImage: "person.2.slash")

                    }
                
                LocationView()
                    .tabItem {
                        Label("Location", systemImage: "location")
                    }
                
                EpisodeView()
                    .tabItem {
                        Label("Episode", systemImage: "play.tv")
                    }
            }.toolbarBackground(Color("TabbarColor"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)

            
        }.tint(.red)

    }
}

#Preview {
    RootView()
}
