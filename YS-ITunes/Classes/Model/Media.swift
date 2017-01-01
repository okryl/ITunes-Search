//
//  Media.swift
//  YS-ITunes
//
//  Created by Omer Karayel on 31/12/16.
//  Copyright © 2016 Omer Karayel. All rights reserved.
//

enum Media: Int {
    case All
    case Movie
    case Podcast
    case Music
    case MusicVideo
    case Audiobook
    case ShortFilm
    case TvShow
    case Software
    case Ebook
}

extension Media {
    var value: String {
        switch self {
        case .All:
            return "All"
        case .Movie:
            return "Movie"
        case .Podcast:
            return "Podcast"
        case .Music:
            return "Music"
        case .MusicVideo:
            return "Music Video"
        case .Audiobook:
            return "Audio Book"
        case .ShortFilm:
            return "Short Film"
        case .TvShow:
            return "TV Show"
        case .Software:
            return "Software"
        case .Ebook:
            return "E-Book"
       
        }
    }
    var url: String {
        switch self {
        case .All:
            return ""
        case .Movie:
            return "movie"
        case .Podcast:
            return "podcast"
        case .Music:
            return "music"
        case .MusicVideo:
            return "musicVideo"
        case .Audiobook:
            return "audiobook"
        case .ShortFilm:
            return "shortFilm"
        case .TvShow:
            return "tvShow"
        case .Software:
            return "software"
        case .Ebook:
            return "ebook"
            
        }
    }
}
