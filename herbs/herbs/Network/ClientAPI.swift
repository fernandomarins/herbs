//
//  ClientAPI.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Foundation
import Firebase

protocol ClientAPIProtocol {
    func getData(completion: @escaping ([Herb]) -> Void)
}

class ClientAPI: ClientAPIProtocol {
    
    let rootRef = Database.database().reference()
    let ref = Database.database().reference(withPath: "herbs")
    
    func getData(completion: @escaping ([Herb]) -> Void) {
        ref.observe(.value, with: { snapshot in
            var items: [Herb] = []
            for item in snapshot.children {
                if let snapshot = item as? DataSnapshot,
                let herb = Herb(snapshot: snapshot) {
                    items.append(herb)
                }
            }
            completion(items)
        })
    }
}
