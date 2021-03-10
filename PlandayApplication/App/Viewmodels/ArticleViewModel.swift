//
//  ArticleViewModel.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import Foundation
import RxSwift

class ArticleViewModel {
    private let article: Article
    
    var displayTitle: String {
        return article.title
    }
    
    var displayImage: String {
        return article.urlToImage
    }
    
    var displayAuthor: String {
        return article.author
    }
    
    var displayDescription: String {
        return article.articleDescription
    }
    
    var displayContent: String {
        return article.content
    }
    
    var displaySource: String {
        return article.source.name
    }
    
    var openLink: String {
        return article.url
    }
    
    init(article: Article) {
        self.article = article
    }
    
    var displayPublished: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let formattedDate = dateFormatterPrint.string(from: article.publishedAt)
        return formattedDate
    }
}
