//
//  MainViewViewModel.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Foundation
import Firebase

class MainViewViewModel {
    var reloadedTableView: (() -> Void)?
    var herbs = [Herb]()
    let service = ClientAPI()
    
    var herbCellViewModels = [HerbCellViewModel]() {
        didSet {
            reloadedTableView?()
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
        let name = herb.name
        let scientificName = herb.scientificName
        let properties = herb.properties
        let doses = herb.doses
        let functions = herb.functions
        let toxicity = herb.toxicity
        let contraIndication = herb.contraIndication
        
        return HerbCellViewModel(name: name, scientificName: scientificName,
                                 properties: properties, doses: doses, functions:
                                    functions, toxicity: toxicity,
                                 contraIndication: contraIndication)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> HerbCellViewModel {
        return herbCellViewModels[indexPath.row]
    }
    
}
