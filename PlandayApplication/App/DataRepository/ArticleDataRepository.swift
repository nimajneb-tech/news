//
//  ArticleDataRepository.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import Foundation
import RxSwift

protocol ArticleServiceProtocol {
    func fetchAppleArticles() -> Observable<[Article]>
}

class ArticleDataRepository: ArticleServiceProtocol {
    var ApiKey: String = "ffd07d68b52440419f784793a96493ca"
    var baseUrl: String = "https://newsapi.org/v2/everything?"
    var articles: [Article] = [Article]()
    
    func fetchAppleArticles() -> Observable<[Article]>{
        
        return Observable.create { observer -> Disposable in
            
            guard let url = URL(string: self.baseUrl + "q=Apple&apiKey=" + self.ApiKey) else {
                return Disposables.create { }
            }
            
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    guard let data = data else {
                        observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                        
                        return
                    }
                    
                    do {
                        let articles = try decoder.decode(ArticleList.self, from: data)
                        
                        observer.onNext(articles.articles)
                    } catch {
                        observer.onError(error)
                    }
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
