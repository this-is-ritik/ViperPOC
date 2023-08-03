//
//  MainPresenter.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func fetchDataFromApi()
    func getNoOfSections() -> Int
    func getNoOfItems(in section: Int) -> Int
    func updateUI()
    func getModel(for index: Int) -> BaseModel?
}

final class MainPresenter {
    
    private var view: MainViewProtocol?
    private var interactor: MainInteractorProtocol?
    private var router: MainRouterProtocol?
    
    init(view: MainViewProtocol? = nil, interactor: MainInteractorProtocol? = nil, router: MainRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MainPresenter: MainPresenterProtocol {
    func getModel(for index: Int) -> BaseModel? {
        self.interactor?.getModel(for: index)
    }
    
    func fetchDataFromApi() {
        self.interactor?.fetchDataFromApi()
    }
    
    func getNoOfSections() -> Int {
        self.interactor?.getNoOfSections() ?? .zero
    }
    
    func getNoOfItems(in section: Int) -> Int {
        self.interactor?.getNoOfItems(in: section) ?? .zero
    }
    
    func updateUI() {
        self.view?.updateUI()
    }
    
    
}
