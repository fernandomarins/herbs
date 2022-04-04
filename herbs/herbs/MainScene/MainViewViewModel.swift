//
//  MainViewViewModel.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Foundation
import Firebase

class MainViewViewModel {
    // variable to reload the collection view
    var reloadedCollectionView: (() -> Void)?
    var herbs = [Herb]()
    var filteredValues = [HerbCellViewModel]()
    let service = ClientAPI()
    
    var herbCellViewModels = [HerbCellViewModel]() {
        didSet {
            reloadedCollectionView?()
        }
    }
    
    func getData() {
        service.getData { [weak self] result in
            self?.fetchData(herbs: result)
        }
    }
    
    func fetchData(herbs: [Herb]) {
        self.herbs = herbs
        var vms = [HerbCellViewModel]()
        // Injecting created cells in the array to display data
        for herb in herbs {
            vms.append(createCellModel(herb: herb))
        }
        
        herbCellViewModels = vms
    }
    
    func createCellModel(herb: Herb) -> HerbCellViewModel {
        let name = herb.name.uppercased()
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
    
    func getCellViewModel(at indexPath: IndexPath) -> HerbCellViewModel {
        return herbCellViewModels[indexPath.item]
    }
    
    func getFilteredViewModel(at indexPath: IndexPath) -> HerbCellViewModel {
        return filteredValues[indexPath.item]
    }
    
    func getCell(at indexPath: IndexPath) -> Herb {
        return herbs[indexPath.item]
    }
    
}
