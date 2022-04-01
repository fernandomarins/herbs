//
//  ViewController.swift
//  herbs
//
//  Created by Fernando Marins on 30/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var contentView = MainView(frame: UIScreen.main.bounds)

    var viewModel = MainViewViewModel()
    
    init(viewModel: MainViewViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var herbs = [Herb]()
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.getData()
//        viewModel.getData { herbs, error in
//            guard let herbs = herbs else {
//                return
//            }
//
//
//
//        }
//        let t = loadJson(filename: "example")
//        herbs = t!
    }
    
//    func loadJson(filename fileName: String) -> [Herb]? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(Herbs.self, from: data)
//                return jsonData.herbs
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
    
    private func setupCollectionView() {
        contentView.collectionView.register(HerbsCellCollectionViewCell.self,
                                            forCellWithReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier)
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return herbs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! HerbsCellCollectionViewCell
        let herb = herbs[indexPath.row]
        cell.nameLabel.text = herb.name
        cell.dosesLabel.text = herb.doses
        cell.propertiesLabel.text = herb.properties
        
        return cell
    }
}
