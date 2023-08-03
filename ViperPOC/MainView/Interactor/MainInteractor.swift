//
//  MainInteractor.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    var data: [BaseModel]? { get }
    func fetchDataFromApi()
    func getNoOfSections() -> Int?
    func getNoOfItems(in section: Int) -> Int?
    func updateUI()
    func getModel(for index: Int) -> BaseModel?
}


final class MainInteractor: MainInteractorProtocol {
    
    // MARK: - Presenter Dependency
    weak var presenter: MainPresenterProtocol?
    
    // MARK: - Interactor Properties
    var data: [BaseModel]?
    
    // MARK: - Interactor Methods
    func fetchDataFromApi() {
        self.data = BaseModel.exampleDummyModels
        self.updateUI()
    }
    
    func getNoOfSections() -> Int? {
        1
    }
    
    func getNoOfItems(in section: Int) -> Int? {
        self.data?.count
    }
    
    func updateUI() {
        self.presenter?.updateUI()
    }
    
    func getModel(for index: Int) -> BaseModel? {
        self.data?[index]
    }
    
}
