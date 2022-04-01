//
//  DetailsViewController.swift
//  herbs
//
//  Created by Fernando Marins on 01/04/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    var herb: Herb?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = herb?.name
        view.backgroundColor = .white
    }
}
