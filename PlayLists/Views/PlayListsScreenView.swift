//
//  PlayListsScreenView.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import SwiftUI

struct PlayListsScreenView: View {

    @EnvironmentObject var presenter: PlayListsPresenter

    var body: some View {
        ZStack {
            switch self.presenter.playlistsState {
            case .error(let error):
                Text("Sorry, an error occurred! \(error.localizedDescription)")
            case .loading:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            case .playlists(let playlists, let isLoading):
                ScrollView {
                    LazyVStack {
                        ForEach(playlists) { playlist in
                            PlayListView(playlist: playlist)
                        }
                    }
                }
                .overlay {
                    if isLoading {
                        ProgressView()
                    }
                }
            case .empty:
                Spacer()
            }
        }
        .navigationTitle("Playlists")
        .onAppear() {
            self.presenter.fetchLibrary()
        }
    }
}

struct PlayListsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListsScreenView()
    }
}
