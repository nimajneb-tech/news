//
//  ArticleTableViewCell.swift
//  PlandayApplication
//
//  Created by Benjamin on 08/03/2021.
//
import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    
    let arcticleImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = false
        
        return imgView
    }()
    
    let articleTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    let articlePublisedDate: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(arcticleImageView)
        contentView.addSubview(articleTitle)
        contentView.addSubview(articlePublisedDate)
        
        articleTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        articlePublisedDate.snp.makeConstraints { (make) in
            make.top.equalTo(articleTitle.snp.bottom).offset(5)
            make.leading.equalTo(articleTitle.snp.leading)
            make.trailing.equalTo(articleTitle.snp.trailing)
        }
        
        arcticleImageView.snp.makeConstraints { (make) in
            make.top.equalTo(articlePublisedDate.snp.bottom).offset(5)
            make.height.equalTo(150)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
