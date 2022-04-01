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
    let rootRef = Database.database().reference()
    let ref = Database.database().reference(withPath: "herbs")
    
    let service = ClientAPI()
    
    func getData() {
        service.getData { result in
//            var herbs: [Herb] = []
            self.herbs = result
            print(self.herbs)
        }
    }
//    func getData(completion: @escaping ([Herb]?, FirebaseError?) -> Void) {
//        service.getData { result in
//            switch result {
//            case .success(let herbs):
//                completion(herbs ?? [], nil)
//            case .failure(let error):
//                completion(nil, error)
//            }
//        }
//    }
    
}
