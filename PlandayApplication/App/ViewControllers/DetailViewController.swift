//
//  DetailViewController.swift
//  PlandayApplication
//
//  Created by Benjamin on 04/03/2021.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
 
    let articleTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        
        return label
    }()
    
    let articleAuthor: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    let articleDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    let articleLink: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.textAlignment = .left
        
        return button
    }()
    
    let articleSource: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    private var articleViewModel: ArticleViewModel?
    
    override func viewDidLoad() {
        self.setupView()
        self.setupConstraints()
    }
    
    init(articleVM: ArticleViewModel) {
        self.articleViewModel = articleVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(articleTitle)
        self.view.addSubview(articleLink)
        self.view.addSubview(articleSource)
        self.view.addSubview(articleAuthor)
        self.view.addSubview(articleDescription)
    
        articleTitle.text = self.articleViewModel?.displayTitle
        articleAuthor.text = "Author: \(self.articleViewModel!.displayAuthor)"
        articleDescription.text = self.articleViewModel?.displayDescription
        articleSource.text = self.articleViewModel?.displaySource
        
        articleLink.setTitle("Go to article", for: .normal)
        
        articleLink.rx.tap.bind {
            UIApplication.shared.open(URL(string: self.articleViewModel!.openLink)!)
        }
    }
    
    func setupConstraints() {
        articleTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        articleAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(articleTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        articleLink.snp.makeConstraints { (make) in
            make.top.equalTo(articleDescription.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        articleDescription.snp.makeConstraints { (make) in
            make.top.equalTo(articleAuthor.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        articleSource.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}

