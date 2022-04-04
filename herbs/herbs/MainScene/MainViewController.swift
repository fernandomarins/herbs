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
    
    var isSearchBarEmpty: Bool {
        return contentView.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return contentView.searchBar.isFirstResponder && !isSearchBarEmpty
    }
    
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
        setupSearchBar()
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
    
    private func setupSearchBar() {
        contentView.searchBar.delegate = self
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        viewModel.filteredValues = viewModel.herbCellViewModels.filter { (herb: HerbCellViewModel) -> Bool in
            return herb.name.lowercased().contains(searchText.lowercased())
        }

        contentView.collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return viewModel.filteredValues.count
        }
        return viewModel.herbCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailViewController(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HerbsCellCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! HerbsCellCollectionViewCell
        
        let cellVM: HerbCellViewModel
        if isFiltering {
            cellVM = viewModel.getFilteredViewModel(at: indexPath)
        } else {
            cellVM = viewModel.getCellViewModel(at: indexPath)
        }
        
        cell.cellViewMode = cellVM
        
        return cell
    }
    
    private func presentDetailViewController(indexPath: IndexPath) {
        let vm = DetailViewModel()
        let vc = DetailsViewController(viewModel: vm)
        vm.herb = viewModel.getCell(at: indexPath)
        show(vc, sender: self)
    }
    
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        contentView.toggle()
        dismissKeyboard()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
}
