//
//  PlayList.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import Foundation

struct PlayList: Identifiable {
    let id: String
    let title: String
    let albums: [Album]
}

struct Album: Identifiable {
    let id: String
    let title: String
    let imageUrl: String
}
