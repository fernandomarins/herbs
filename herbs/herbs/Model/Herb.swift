//
//  Herb.swift
//  herbs
//
//  Created by Fernando Marins on 31/03/22.
//

import Firebase

struct Herb {
    let ref: DatabaseReference?
    let name: String
    let scientificName: String
    let properties: String
    let doses: String
    let functions: String
    let toxicity: String?
    let contraIndication: String?
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject],
              let name = value["name"] as? String,
              let scientificName = value["scientificName"] as? String,
              let properties = value["properties"] as? String,
              let doses = value["doses"] as? String,
              let functions = value["functions"] as? String,
              let toxicity = value["toxicity"] as? String,
              let contraIndication = value["contraIndication"] as? String
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.scientificName = scientificName
        self.properties = properties
        self.doses = doses
        self.functions = functions
        self.toxicity = toxicity
        self.contraIndication = contraIndication
        
    }
}
