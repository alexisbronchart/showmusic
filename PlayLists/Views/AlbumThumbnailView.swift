//
//  AlbumThumbnailView.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 19/03/2021.
//

import SwiftUI
import Kingfisher

struct AlbumThumbnailView: View {

    let album: Album
    let dimension: CGFloat = 150

    let placeholderBackgroundColor: Color = {
        #if os(macOS)
        return Color(.windowBackgroundColor)
        #elseif os(iOS)
        return Color(.secondarySystemBackground)
        #endif
    }()

    var body: some View {
        VStack(alignment: .center) {
            KFImage
                .url(URL(string: self.album.imageUrl))
                .placeholder {
                    VStack {
                        Image(systemName: "music.note.list")
                            .foregroundColor(.secondary)
                            .font(.system(size: dimension/2))
                    }
                    .frame(width: dimension, height: dimension)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(placeholderBackgroundColor)
                    )
                    .padding()
                    .aspectRatio(contentMode: .fill)
                }
                .resizable()
                .fade(duration: 0.25)
                .frame(width: dimension, height: dimension)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .aspectRatio(contentMode: .fill)

            Text(self.album.title)
                .font(.caption)
        }
    }
}

struct AlbumThumbnailView_Previews: PreviewProvider {
    static let album = Album(
        id: "42",
        title: "Simulation Theory",
        imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81RynTwX7VL._SL1425_.jpg"
    )

    static var previews: some View {
        Group {
            AlbumThumbnailView(album: album)
        }
    }
}
