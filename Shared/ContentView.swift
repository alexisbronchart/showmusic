//
//  ContentView.swift
//  Shared
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                #if os(macOS)
                Text("ShowMusic")
                    .font(.title)
                    .bold()
                    .padding()
                #endif
                List() {
                    NavigationLink(destination: PlayListsScreenView()) {
                        Label("Playlists", systemImage: "music.note.list")
                    }
                    .tag(42)
                }
                .navigationTitle("ShowMusic")
                .listStyle(SidebarListStyle())
            }
            PlayListsScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlayListsPresenter())
    }
}
