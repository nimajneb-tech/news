//
//  ItemModel.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import Foundation

// MARK: - Welcome
struct ArticleList: Codable {
    let status: String
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status, articles
    }
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String

    enum CodingKeys: String, CodingKey {
        case author, title, source
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
