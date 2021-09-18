//
//  PlayListsPresenter.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import Foundation

enum PlayListsState {
    case empty
    case loading
    case playlists(playlists: [PlayList], isLoading: Bool)
    case error(_: Error)
}

class PlayListsPresenter: ObservableObject {

    // MARK: Publishers

    @Published var playlistsState: PlayListsState = .empty


    // MARK: Service

    lazy private var showMusicService: ShowMusicService = {
        return ShowMusicService()
    }()


    // MARK: Data

    func fetchLibrary() {
        if case .playlists = self.playlistsState {} else {
            self.playlistsState = .loading
        }
        self.showMusicService.request(.library) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let library = try moyaResponse.filterSuccessfulStatusCodes().map(Library.self)
                    self.playlistsState = .playlists(
                        playlists: PlayListsPresenter.mapLibraryToPlayLists(library: library),
                        isLoading: false)
                }
                catch let error {
                    self.playlistsState = .error(error)
                }
            case let .failure(error):
                self.playlistsState = .error(error)
            }
        }
    }

    
    // MARK: Mappers

    static func mapLibraryToPlayLists(library: Library) -> [PlayList] {
        let playlists: [PlayList] = library.playlists.map { (playlist) in
            let libraryAlbums = playlist.albums.compactMap({albumId in library.albums.first(where: ({ albumId == $0.id }))})
            let albums = libraryAlbums.map { (a) in
                Album(id: a.id, title: a.title, imageUrl: a.imageUrl)
            }
            return PlayList(id: playlist.id, title: playlist.title, albums: albums)
        }

        // filter out playlists which have albums that don't exist
        return playlists.filter({ $0.albums.count > 0})
    }
}
