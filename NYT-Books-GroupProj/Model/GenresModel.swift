//
//  GenresModel.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/18/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

struct GenresResults: Codable & Equatable {
    let results: [Genres]
}

struct Genres: Codable & Equatable {
    let listName: String
    let displayName: String
    private enum CodingKeys: String, CodingKey{
        case listName = "list_name"
        case displayName = "display_name"
    }
}
