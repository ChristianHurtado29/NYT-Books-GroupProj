//
//  NYTAPIClient.swift
//  NYT-Books-GroupProj
//
//  Created by Christian Hurtado on 2/5/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTBooksAPIClient {
    
    static func fetchBooks(for bookType: String, completion: @escaping (Result<[Books], AppError>) -> ()){
        
        let endPointURL = "https://api.nytimes.com/svc/books/v3/lists/current/\(bookType).json?api-key=\(Secrets.appKey)"
        
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL(endPointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do {
                    let booksInfo = try JSONDecoder().decode(BooksData.self, from: data)
                    
                    let books = booksInfo.results
                    
                    completion(.success(books))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
