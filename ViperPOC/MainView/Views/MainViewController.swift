//
//  MainViewController.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setTitle(with title: String)
    func updateUI()
}

class MainViewController: UIViewController {

    // MARK: - Outlets Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Class Properties
    
    // MARK: - Presenter
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromApi()
        self.setupView()
        self.registerCells()
        self.collectionView.reloadData()
    }
    func registerCells() {
        let nib = UINib(nibName: "CustomCVC", bundle: .main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: CustomCVC.reuseIdentifier)
    }
    func setupView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}


extension MainViewController: MainViewProtocol, UICollectionViewDelegate {
    func updateUI() {
        self.collectionView.reloadData()
    }
    func setTitle(with title: String) {
        self.title = title
    }
    
}



extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVC", for: indexPath)
        (cell as? CollectionViewCellProtocol)?.configureView(with: self.presenter?.getModel(for: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter?.getNoOfItems(in: section) ?? .zero
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.presenter?.getNoOfSections() ?? .zero
    }
}
