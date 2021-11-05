//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Frank Su on 2021-11-04.
//

import SwiftUI

// viewModel
class EmojiArtDocument: ObservableObject {
    @Published private(set) var emojiArt: EmojiArtModel {
        // if our model ever changes, this didSet gets called
        didSet {
            if emojiArt.background != oldValue.background {
                fetchBackgroundImageDataIfNeeded()
            }
        }
    }
    
    init() {
        emojiArt = EmojiArtModel()
        emojiArt.addEmoji("😃", at: (-200,20), size: 60)
        emojiArt.addEmoji("😷", at: (200,-20), size: 120)
    }
    
    var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
    var background: EmojiArtModel.Background { emojiArt.background }
    
    @Published var backgroundImage: UIImage?
    
    private func fetchBackgroundImageDataIfNeeded() {
        backgroundImage = nil
        switch emojiArt.background {
        case .url(let url):
            let imageData = try? Data(contentsOf: url)
            if imageData != nil {
                backgroundImage = UIImage(data: imageData!)
            }
        case .imageData(let data):
            backgroundImage = UIImage(data: data)
        case .blank:
            break
        }
    }
    
    // MARK: - Intent(s)
    
    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
        print("background set to \(background)")
    }
    
    func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
        emojiArt.addEmoji(emoji, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        // we need to find the index since we need to change in the actual array or we'll just be changing a copy of it 
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
    
}
