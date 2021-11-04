//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Frank Su on 2021-11-04.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}

