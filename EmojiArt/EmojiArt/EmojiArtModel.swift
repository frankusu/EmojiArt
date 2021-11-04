//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Frank Su on 2021-11-04.
//

import Foundation

// this is model
struct EmojiArtModel {
    var background: Background = Background.blank
    var emojis = [Emoji]()
    
    // hashable cuz we want to put it in a set
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int
        var y: Int
        var size: Int
        let id: Int
        
        // only we can create an emoji and not anyone else
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    // we don't want other people to create an EmojiArtModel
    init() { }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
    }
}
