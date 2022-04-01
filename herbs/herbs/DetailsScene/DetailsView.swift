//
//  DetailsView.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import UIKit
import SnapKit

class DetailsView: UIView {
    
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
        label.text = "FLOR DE MAGÓGLIA JAPONESA"
        label.font = UIFont.MontSerratBlack(size: 26)
        label.textColor = UIColor.white
        label.text = label.text?.uppercased()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var mainContentView: UIView! = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var categoryLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratRegular(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var scientificNameLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratBlack(size: 16)
        label.text = "NOME CIENTÍFICO:"
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var valueScientificNameLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var propertiesLabel: UILabel! = {
        let label = UILabel()
        label.text = "PROPRIEDADES:"
        label.font = UIFont.MontSerratBlack(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var valuePropertiesLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var dosesLabel: UILabel! = {
        let label = UILabel()
        label.text = "DOSES:"
        label.font = UIFont.MontSerratBlack(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var valueDosesLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var contraIndicationLabel: UILabel! = {
        let label = UILabel()
        label.text = "CONTRA-INDICAÇÃO"
        label.font = UIFont.MontSerratBlack(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var valueContraIndicationLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var functionsTitle: UILabel! = {
        let label = UILabel()
        label.text = "FUNÇÕES"
        label.font = UIFont.MontSerratBlack(size: 24)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var functionsLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var toxicityTitle: UILabel! = {
        let label = UILabel()
        label.text = "TOXICIDADE"
        label.font = UIFont.MontSerratBlack(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var toxicityLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.MontSerratLight(size: 16)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}

extension DetailsView {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
    }
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainContentView)
        mainContentView.addSubview(categoryLabel)
        mainContentView.addSubview(scientificNameLabel)
        mainContentView.addSubview(valueScientificNameLabel)
        mainContentView.addSubview(propertiesLabel)
        mainContentView.addSubview(valuePropertiesLabel)
        mainContentView.addSubview(dosesLabel)
        mainContentView.addSubview(valueDosesLabel)
        mainContentView.addSubview(contraIndicationLabel)
        mainContentView.addSubview(valueContraIndicationLabel)
        mainContentView.addSubview(functionsTitle)
        mainContentView.addSubview(functionsLabel)
        mainContentView.addSubview(toxicityTitle)
        mainContentView.addSubview(toxicityLabel)
    }
    
    func setupContraints() {
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(100)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        mainContentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(mainContentView.snp.top).offset(16)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }
    }
}
