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
    
    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.text = "ervas"
        label.font = UIFont.MontSerratBlack(size: 64)
        label.textColor = UIColor.white
        label.text = label.text?.uppercased()
        return label
    }()
    
    lazy var subTitleLabel: UILabel! = {
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
        button.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        return button
    }()
    
    lazy var searchBar: UISearchBar! = {
        let searchBar = UISearchBar()
        searchBar.layer.cornerRadius = 15
        searchBar.barTintColor = UIColor.init(red: 57/255, green: 195/255, blue: 154/255, alpha: 1.0)
        searchBar.backgroundColor = .white
        searchBar.showsCancelButton = true
        searchBar.searchTextField.textColor = .white
        searchBar.placeholder = "Buscar..."
        return searchBar
    }()
    
    lazy var mainContentView: UIView! = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var collectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 48, height: 120)
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        return collectionView
    }()
    
    @objc func toggle() {
        searchBar.becomeFirstResponder()
        if searchBar.isHidden {
            searchBar.isHidden = false
            subTitleLabel.isHidden = true
            searchButton.isHidden = true
        } else {
            searchBar.isHidden = true
            subTitleLabel.isHidden = false
            searchButton.isHidden = false
        }
    }
}

extension MainView {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        aditionalConfiguration()
    }
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(searchButton)
        contentView.addSubview(searchBar)
        contentView.addSubview(mainContentView)
        mainContentView.addSubview(collectionView)
    }
    
    func setupContraints() {
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.right.equalTo(contentView.snp.right).offset(-20)
        }
        
        searchButton.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).offset(-16)
            $0.centerY.equalTo(subTitleLabel.snp.centerY)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
            $0.height.equalTo(50)
        }
        
        mainContentView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(mainContentView.snp.top).offset(16)
            $0.left.equalTo(mainContentView.snp.left).offset(16)
            $0.bottom.equalTo(mainContentView.snp.bottom).offset(-30)
            $0.right.equalTo(mainContentView.snp.right).offset(-16)
        }
    }
    
    func aditionalConfiguration() {
        searchBar.isHidden = true
    }
}
