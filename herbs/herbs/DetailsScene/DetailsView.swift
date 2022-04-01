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
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView! = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.text = "CONTRA-INDICAÇÃO:"
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
        label.textAlignment = .left
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
        label.textAlignment = .left
        return label
    }()
}

extension DetailsView {
    
    func setupView() {
        buildViewHierarchy()
        setupContraints()
    }
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
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
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
        scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.left.equalTo(scrollView.snp.left)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.right.equalTo(scrollView.snp.right)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(16)
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

        scientificNameLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(36)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.width.equalTo(161)
        }

        valueScientificNameLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(36)
            $0.left.equalTo(scientificNameLabel.snp.right).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        propertiesLabel.snp.makeConstraints {
            $0.top.equalTo(scientificNameLabel.snp.bottom).offset(36)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.width.equalTo(143)
        }

        valuePropertiesLabel.snp.makeConstraints {
            $0.top.equalTo(scientificNameLabel.snp.bottom).offset(36)
            $0.left.equalTo(propertiesLabel.snp.right).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        dosesLabel.snp.makeConstraints {
            $0.top.equalTo(propertiesLabel.snp.bottom).offset(36)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.width.equalTo(64)
        }

        valueDosesLabel.snp.makeConstraints {
            $0.top.equalTo(propertiesLabel.snp.bottom).offset(36)
            $0.left.equalTo(dosesLabel.snp.right).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        contraIndicationLabel.snp.makeConstraints {
            $0.top.equalTo(dosesLabel.snp.bottom).offset(36)
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.width.equalTo(184)
        }

        valueContraIndicationLabel.snp.makeConstraints {
            $0.top.equalTo(dosesLabel.snp.bottom).offset(36)
            $0.left.equalTo(contraIndicationLabel.snp.right).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        functionsTitle.snp.makeConstraints {
            $0.top.equalTo(contraIndicationLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        functionsLabel.snp.makeConstraints {
            $0.top.equalTo(functionsTitle.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }

        toxicityTitle.snp.makeConstraints {
            $0.top.equalTo(functionsLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(16)
            $0.right.equalTo(contentView.snp.right).offset(-16)
        }

        toxicityLabel.snp.makeConstraints {
            $0.top.equalTo(toxicityTitle.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalTo(mainContentView.snp.bottom).offset(-36)
            $0.right.equalToSuperview().offset(-16)

        }
    }
}
