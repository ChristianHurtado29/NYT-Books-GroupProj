//
//  BooksModel.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

struct BooksStatus: Codable & Equatable {
    let results: BooksData
}

struct BooksData: Codable & Equatable {
    let listName: String
    let books: [BookInfo]
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case books
    }
}

struct BookInfo: Codable & Equatable {
    
    let rank: Int
    let weeksOnList: Int
    let description: String
    let title: String
    let author: String
    let bookImage: String
    let bookUrl: String?
    let buyLinks: [Links]
    private enum CodingKeys: String, CodingKey {
        case rank
        case weeksOnList = "weeks_on_list"
        case description
        case title
        case author
        case bookImage = "book_image"
        case bookUrl = "book_url"
        case buyLinks = "buy_links"
    }
}

struct Links: Codable & Equatable {
    let name: String
    let url: String
}
