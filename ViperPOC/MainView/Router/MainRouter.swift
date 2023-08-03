//
//  MainRouter.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    
}


final class MainRouter: MainRouterProtocol {
    
    static func createMainVC() -> MainViewController {
        
        let router = MainRouter()
        guard let mainVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {return MainViewController()}
        let interactor = MainInteractor()
        
        let presenter = MainPresenter(view: mainVC, interactor: interactor, router: router)
        
        mainVC.presenter = presenter
        interactor.presenter = presenter
        
        return mainVC
    }
}
