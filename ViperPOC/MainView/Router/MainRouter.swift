//
//  MainRouter.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    func start(view: UIViewController)
}


final class MainRouter: MainRouterProtocol {
    
    private func createMainVC() -> MainViewController? {
        guard let mainVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return nil }
        return mainVC
    }
    
    func start(view: UIViewController) {
        guard let vc = self.createMainVC() else { return }
        
        let interactor = MainInteractor()
        let presenter = MainPresenter(view: vc, interactor: interactor, router: self)
        
        vc.presenter = presenter
        interactor.presenter = presenter
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
