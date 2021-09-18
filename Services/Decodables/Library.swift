//
//  Library.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import Foundation

struct Library: Decodable {
    let albums: [Album]
    let playlists: [PlayList]

    internal struct Album: Decodable {
        let id: String
        let title: String
        let imageUrl: String
    }

    internal struct PlayList: Decodable {
        let id: String
        let title: String
        let albums: [String]
    }
}
