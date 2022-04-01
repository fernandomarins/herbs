//
//  ViewController.swift
//  herbs
//
//  Created by Fernando Marins on 30/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Loading
    var contentView = MainView(frame: UIScreen.main.bounds)

    var viewModel: MainViewViewModel
    
    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.getData()
        viewModel.reloadedCollectionView = { [weak self] in
            DispatchQueue.main.async {
                self?.contentView.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Collection View
    private func setupCollectionView() {
        contentView.collectionView.register(HerbsCellCollectionViewCell.self,
                                            forCellWithReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier)
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.herbs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = DetailViewModel()
        vm.herb = viewModel.getCell(at: indexPath)
        let vc = DetailsViewController(viewModel: vm)
        show(vc, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! HerbsCellCollectionViewCell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewMode = cellVM
        
        return cell
    }
}
