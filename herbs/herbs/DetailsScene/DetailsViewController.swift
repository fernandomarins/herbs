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
        viewModel.fetchData { [weak self] herb in
            DispatchQueue.main.async {
                self?.setData(herb: herb)
            }
        }
    }
    
    private func setData(herb: HerbCellViewModel) {
        contentView.titleLabel.text = herb.name.uppercased()
        contentView.categoryLabel.text = herb.category.uppercased()
        contentView.valueScientificNameLabel.text = herb.scientificName
        contentView.valuePropertiesLabel.text = herb.properties
        contentView.valueDosesLabel.text = herb.doses
        contentView.valueContraIndicationLabel.text = herb.contraIndication
        
        contentView.functionsLabel.text = herb.functions
        contentView.toxicityLabel.text = herb.toxicity
    }
    
}
