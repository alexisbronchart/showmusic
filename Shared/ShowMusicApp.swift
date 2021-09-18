//
//  ShowMusicApp.swift
//  Shared
//
//  Created by Alexis Bronchart on 18/03/2021.
//

import SwiftUI

@main
struct ShowMusicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PlayListsPresenter())
        }
    }
}
