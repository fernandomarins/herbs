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
    var filteredValues = [Herb]()
    let service = ClientAPI()
    
    var herbs = [Herb]() {
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
    }
    
    func getFilteredCell(at indexPath: IndexPath) -> Herb {
        return filteredValues[indexPath.item]
    }
    
    func getCell(at indexPath: IndexPath) -> Herb {
        return herbs[indexPath.item]
    }
    
}
