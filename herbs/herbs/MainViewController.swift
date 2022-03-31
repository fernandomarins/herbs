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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        contentView.collectionView.register(HerbsCellCollectionViewCell.self, forCellWithReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier)
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier, for: indexPath) as! HerbsCellCollectionViewCell
        
        return cell
    }
}
