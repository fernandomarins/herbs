//
//  MainView.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var contentView: UIView! = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 57/255, green: 195/255, blue: 154/255, alpha: 1.0)
        return view
    }()
    
    lazy var title: UILabel! = {
        let label = UILabel()
        label.text = "ervas"
        label.font = UIFont.MontSerratBlack(size: 64)
        label.textColor = UIColor.white
        label.text = label.text?.uppercased()
        return label
    }()
    
    lazy var subTitle: UILabel! = {
        let label = UILabel()
        label.text = "herbário de medicina tradicional chinesa"
        label.font = UIFont.ActorRegular(size: 24)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var searchButton: UIButton! = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    lazy var mainContentView: UIView! = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var collectionView: UICollectionView! = {
        let collectionView = UICollectionView()
        return collectionView
    }()
}

extension MainView {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
    }
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(subTitle)
        contentView.addSubview(searchButton)
        contentView.addSubview(mainContentView)
    }
    
    func setupContraints() {
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.right.equalTo(contentView.snp.right).offset(-20)
        }
        
        searchButton.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).offset(-16)
            $0.centerY.equalTo(subTitle.snp.centerY)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        mainContentView.snp.makeConstraints {
            $0.top.equalTo(subTitle.snp.bottom).offset(16)
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}
