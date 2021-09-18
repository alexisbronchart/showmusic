//
//  ShowMusicService.swift
//  ShowMusic
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import Foundation
import Moya

class ShowMusicService: MoyaProvider<ShowMusicServiceDefinition> {
    init() {
        super.init(plugins: [NetworkLoggerPlugin()])
    }
}
