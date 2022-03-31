//
//  HerbsCellCollectionViewCell.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import UIKit
import SnapKit

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
        label.font = UIFont.ActorRegular(size: 18)
        label.text = label.text?.uppercased()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var propertiesLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.AdventProREgular(size: 17)
        label.text = label.text?.uppercased()
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var dosesLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.AdventProREgular(size: 16)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
}

extension HerbsCellCollectionViewCell {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAditionalConfiguration()
        dropShadow()
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
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.left.equalToSuperview().offset(16)
        }
        
        propertiesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.left.equalTo(nameView.snp.right).offset(16)
        }
        
        dosesLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16)
            $0.right.equalToSuperview().offset(-16)
            $0.left.equalTo(nameView.snp.right).offset(16)
        }
    }
    
    func setupAditionalConfiguration() {
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor.init(red: 202/255, green: 243/255, blue: 211/255, alpha: 1.0)
    }
    
    func dropShadow() {
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 8)
        contentView.layer.shadowRadius = 10
    }
}
