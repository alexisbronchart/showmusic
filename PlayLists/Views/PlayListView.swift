//
//  PlayListView.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import SwiftUI

struct PlayListView: View {

    let playlist: PlayList

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.playlist.title)
                .font(.title3)
                .padding(.top)
                .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(self.playlist.albums) { album in
                        AlbumThumbnailView(album: album)
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
        }
    }
}

struct PlayListView_Previews: PreviewProvider {
    static let playlist = PlayList(
        id: "42",
        title: "Awesome Mix Vol. 1",
        albums: [
            AlbumThumbnailView_Previews.album,
            AlbumThumbnailView_Previews.album,
            AlbumThumbnailView_Previews.album
        ])

    static var previews: some View {
        PlayListView(playlist: playlist)
    }
}
