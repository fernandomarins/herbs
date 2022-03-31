//
//  HerbsCellCollectionViewCell.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import UIKit

class HerbsCellCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "HerbsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nameLabel: UILabel! = {
        let label = UILabel()
        return label
    }()
    
    lazy var propertiesLabel: UILabel! = {
        let label = UILabel()
        return label
    }()
    
    lazy var dosesLabel: UILabel! = {
        let label = UILabel()
        return label
    }()
    
}

extension HerbsCellCollectionViewCell {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAditionalConfiguration()
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        contentView.addSubview(propertiesLabel)
        contentView.addSubview(dosesLabel)
    }
    
    func setupContraints() {
        nameView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(16)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.height.equalTo(88)
            $0.width.equalTo(122)
        }
//        contentView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.bottom.equalToSuperview()
//            $0.right.equalToSuperview()
//        }
//
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(contentView.snp.top).offset(50)
//            $0.centerX.equalToSuperview()
//        }
//
//        subTitleLabel.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
//            $0.centerX.equalToSuperview()
//            $0.left.equalTo(contentView.snp.left).offset(20)
//            $0.right.equalTo(contentView.snp.right).offset(-20)
//        }
//
//        searchButton.snp.makeConstraints {
//            $0.right.equalTo(contentView.snp.right).offset(-16)
//            $0.centerY.equalTo(subTitleLabel.snp.centerY)
//            $0.height.equalTo(50)
//            $0.width.equalTo(50)
//        }
//
//        mainContentView.snp.makeConstraints {
//            $0.top.equalTo(subTitleLabel.snp.bottom).offset(16)
//            $0.left.equalToSuperview()
//            $0.bottom.equalToSuperview()
//            $0.right.equalToSuperview()
//        }
//
//        collectionView.snp.makeConstraints {
//            $0.top.equalTo(mainContentView.snp.top).offset(16)
//            $0.left.equalTo(mainContentView.snp.left).offset(16)
//            $0.bottom.equalTo(mainContentView.snp.bottom).offset(-16)
//            $0.right.equalTo(mainContentView.snp.right).offset(-16)
//        }
    }
    
    func setupAditionalConfiguration() {
        contentView.backgroundColor = UIColor.init(red: 202/255, green: 243/255, blue: 211/255, alpha: 1.0)
    }
}
