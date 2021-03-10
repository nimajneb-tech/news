//
//  ArticleListViewModel.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import Foundation
import RxSwift
import RxCocoa

final class ArticleListViewModel {
    
    private let repository: ArticleServiceProtocol
    private let diposeBag = DisposeBag()
//    public var articleData: PublishSubject<[Article]> = PublishSubject()
    
    init(articleService: ArticleServiceProtocol = ArticleDataRepository()) {
        self.repository = articleService
    }
    
    func fetchArticlesViewModels() -> Observable<[ArticleViewModel]> {
        self.repository.fetchAppleArticles().map { $0.map { ArticleViewModel(article: $0) } }
    }
}
