//
//  DetailsViewController.swift
//  herbs
//
//  Created by Fernando Marins on 01/04/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    var contentView = DetailsView(frame: UIScreen.main.bounds)
    
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    private func setData() {
        contentView.titleLabel.text = viewModel.herb?.name.uppercased()
        contentView.categoryLabel.text = viewModel.herb?.category.uppercased()
        contentView.valueScientificNameLabel.text = viewModel.herb?.scientificName
        contentView.valuePropertiesLabel.text = viewModel.herb?.properties
        contentView.valueDosesLabel.text = viewModel.herb?.doses
        contentView.valueContraIndicationLabel.text = viewModel.herb?.contraIndication
        
        // Boldening one part of the code
        let font = UIFont.MontSerratLight(size: 16)
        let boldFont = UIFont.MontSerratBlack(size: 16)
        let text = "ATENÇÃO" as NSString
        contentView.functionsLabel.attributedText = viewModel.herb?.functions.withBoldText(boldPartsOfString: [text], font: font, boldFont: boldFont)
        
        contentView.toxicityLabel.text = viewModel.herb?.toxicity
    }
    
}
