//
//  ViewController.swift
//  herbs
//
//  Created by Fernando Marins on 30/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var contentView = MainView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
}

