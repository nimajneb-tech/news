//
//  HomeViewController.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class HomeViewController: UIViewController {
    
    private var articleListViewModel = ArticleListViewModel()
    var articlesTableView = UITableView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.articlesTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
        
        self.setupView()
        self.setupViewModel()
    }
    
    
    func setupView(){
        self.view.addSubview(articlesTableView)
        self.view.backgroundColor = .white
        self.articlesTableView.separatorStyle = .none
        self.articlesTableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        self.articlesTableView.rx.modelSelected(ArticleViewModel.self)
            .map{ $0 }
            .subscribe(onNext: { article in
                let vcToPresent = DetailViewController(articleVM: article)
                vcToPresent.modalPresentationStyle = .popover
                self.present(vcToPresent, animated: true, completion: nil)
            }).disposed(by: self.disposeBag)
    }
    
    func setupViewModel() {
        self.articleListViewModel.fetchArticlesViewModels().bind(to: self.articlesTableView.rx.items(cellIdentifier: "ArticleTableViewCell", cellType: ArticleTableViewCell.self)) { index, articleViewModel, cell in
            
            cell.articleTitle.text = articleViewModel.displayTitle
            cell.articlePublisedDate.text = "Published: \(articleViewModel.displayPublished)"
            cell.arcticleImageView.downloaded(from: articleViewModel.displayImage)
            
        }.disposed(by: self.disposeBag)
    }
}
