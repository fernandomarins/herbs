//
//  DetailsViewModel.swift
//  herbs
//
//  Created by Fernando Marins on 01/04/22.
//

import Foundation

class DetailViewModel {
    
    var passData: (() -> Void)?
    
    var herb: Herb?
    
    var herbData: HerbCellViewModel? {
        didSet {
            passData?()
        }
    }
    
    func fetchData() {
        if let herb = herb {
            herbData = createCellModel(herb: herb)
            print(herbData)
        }
    }
    
    func createCellModel(herb: Herb) -> HerbCellViewModel {
        let name = herb.name
        let scientificName = herb.scientificName
        let properties = herb.properties
        let doses = herb.doses
        let functions = herb.functions
        let toxicity = herb.toxicity
        let contraIndication = herb.contraIndication
        let category = herb.category
        
        return HerbCellViewModel(name: name, scientificName: scientificName,
                                 properties: properties, doses: doses, functions:
                                    functions, toxicity: toxicity,
                                 contraIndication: contraIndication, category: category)
    }
}
