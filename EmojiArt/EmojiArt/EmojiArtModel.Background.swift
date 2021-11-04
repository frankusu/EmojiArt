//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by Frank Su on 2021-11-04.
//

import Foundation

extension EmojiArtModel {
    
    enum Background {
        case blank
        // associated data
        case url(URL)
        case imageData(Data)
        
        // convenience function
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
}
