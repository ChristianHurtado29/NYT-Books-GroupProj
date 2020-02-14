//
//  NYT_Books_GroupProjTests.swift
//  NYT-Books-GroupProjTests
//
//  Created by Maitree Bain on 2/14/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import XCTest
@testable import NYT_Books_GroupProj

class NYT_Books_GroupProjTests: XCTestCase {
    
    func testNYTModel() {
        let jsonData = """
 {
    "status": "OK",
    "copyright": "Copyright (c) 2020 The New York Times Company.  All Rights Reserved.",
    "num_results": 15,
    "last_modified": "2020-02-12T23:38:01-05:00",
    "results": {
        "list_name": "Trade Fiction Paperback",
        "list_name_encoded": "trade-fiction-paperback",
        "bestsellers_date": "2020-02-08",
        "published_date": "2020-02-23",
        "published_date_description": "latest",
        "next_published_date": "",
        "previous_published_date": "2020-02-16",
        "display_name": "Paperback Trade Fiction",
        "normal_list_ends_at": 15,
        "updated": "WEEKLY",
        "books": [{
                "rank": 1,
                "rank_last_week": 1,
                "weeks_on_list": 40,
                "asterisk": 0,
                "dagger": 0,
                "primary_isbn10": "0735224315",
                "primary_isbn13": "9780735224315",
                "publisher": "Penguin",
                "description": "An artist with a mysterious past and a disregard for the status quo upends a quiet town outside Cleveland.",
                "price": 0,
                "title": "LITTLE FIRES EVERYWHERE",
                "author": "Celeste Ng",
                "contributor": "by Celeste Ng",
                "contributor_note": "",
                "book_image": "https://s1.nyt.com/du/books/images/9780735224308.jpg",
                "book_image_width": 328,
                "book_image_height": 495,
                "amazon_product_url": "https://www.amazon.com/Little-Fires-Everywhere-Celeste-Ng-ebook/dp/B01N4VW75U?tag=NYTBS-20",
                "age_group": "",
                "book_review_link": "https://www.nytimes.com/2017/09/25/books/review/little-fires-everywhere-celeste-ng.html",
                "first_chapter_link": "",
                "sunday_review_link": "",
                "article_chapter_link": "",
                "isbns": [{
                        "isbn10": "0735224293",
                        "isbn13": "9780735224292"
                    },
                    {
                        "isbn10": "0735224307",
                        "isbn13": "9780735224308"
                    },
                    {
                        "isbn10": "0525498079",
                        "isbn13": "9780525498070"
                    },
                    {
                        "isbn10": "0525498060",
                        "isbn13": "9780525498063"
                    },
                    {
                        "isbn10": "0735224315",
                        "isbn13": "9780735224315"
                    }
                ],
                "buy_links": [{
                        "name": "Amazon",
                        "url": "https://www.amazon.com/Little-Fires-Everywhere-Celeste-Ng-ebook/dp/B01N4VW75U?tag=NYTBS-20"
                    },
                    {
                        "name": "Apple Books",
                        "url": "http://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=LITTLE+FIRES+EVERYWHERE&author=Celeste+Ng"
                    },
                    {
                        "name": "Barnes and Noble",
                        "url": "http://www.anrdoezrs.net/click-7990613-11819508?url=http%3A%2F%2Fwww.barnesandnoble.com%2Fw%2F%3Fean%3D9780735224315"
                    },
                    {
                        "name": "Local Booksellers",
                        "url": "http://www.indiebound.org/book/9780735224315?aff=NYT"
                    }
                ],
                "book_uri": "nyt://book/f343748c-cc89-5545-a895-324c4190a56f"
            },
            {
                "rank": 2,
                "rank_last_week": 2,
                "weeks_on_list": 3,
                "asterisk": 0,
                "dagger": 0,
                "primary_isbn10": "1538750589",
                "primary_isbn13": "9781538750582",
                "publisher": "Grand Central",
                "description": "A World War II veteran on parole must find the real killer in a small town or face going back to jail.",
                "price": 0,
                "title": "ONE GOOD DEED",
                "author": "David Baldacci",
                "contributor": "by David Baldacci",
                "contributor_note": "",
                "book_image": "https://s1.nyt.com/du/books/images/9781538750568.jpg",
                "book_image_width": 328,
                "book_image_height": 495,
                "amazon_product_url": "https://www.amazon.com/One-Good-Deed-David-Baldacci/dp/1538750562?tag=NYTBS-20",
                "age_group": "",
                "book_review_link": "",
                "first_chapter_link": "",
                "sunday_review_link": "",
                "article_chapter_link": "",
                "isbns": [{
                        "isbn10": "1538750562",
                        "isbn13": "9781538750568"
                    },
                    {
                        "isbn10": "1538750554",
                        "isbn13": "9781538750551"
                    },
                    {
                        "isbn10": "1549151967",
                        "isbn13": "9781549151965"
                    },
                    {
                        "isbn10": "1549151940",
                        "isbn13": "9781549151941"
                    },
                    {
                        "isbn10": "1549151959",
                        "isbn13": "9781549151958"
                    },
                    {
                        "isbn10": "1549152769",
                        "isbn13": "9781549152764"
                    },
                    {
                        "isbn10": "1538750570",
                        "isbn13": "9781538750575"
                    },
                    {
                        "isbn10": "1549151975",
                        "isbn13": "9781549151972"
                    },
                    {
                        "isbn10": "1538750589",
                        "isbn13": "9781538750582"
                    }
                ],
                "buy_links": [{
                        "name": "Amazon",
                        "url": "https://www.amazon.com/One-Good-Deed-David-Baldacci/dp/1538750562?tag=NYTBS-20"
                    },
                    {
                        "name": "Apple Books",
                        "url": "http://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=ONE+GOOD+DEED&author=David+Baldacci"
                    },
                    {
                        "name": "Barnes and Noble",
                        "url": "http://www.anrdoezrs.net/click-7990613-11819508?url=http%3A%2F%2Fwww.barnesandnoble.com%2Fw%2F%3Fean%3D9781538750582"
                    },
                    {
                        "name": "Local Booksellers",
                        "url": "http://www.indiebound.org/book/9781538750582?aff=NYT"
                    }
                ],
                "book_uri": "nyt://book/dcecfb4e-c014-5c60-88c9-64f55d288396"
            }
        ]

}
 }
""".data(using: .utf8)!
        
        let expectedCount = 2
        
        do {
            let bookInfo = try JSONDecoder().decode(BooksStatus.self, from: jsonData)
            
            let books = bookInfo.results.books
            XCTAssertEqual(books.count, expectedCount, "there should be \(expectedCount) books instead of \(books.count)")
        } catch {
            XCTFail("decoding error: \(error)")
        }
        
    }
}
