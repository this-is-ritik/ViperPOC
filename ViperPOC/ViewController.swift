//
//  ViewController.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ctaButton.setTitle("Viper POC", for: .normal)
        self.ctaButton.layer.cornerRadius = 8
    }


    @IBAction func ctaTapped(_ sender: Any) {
        let vc = MainRouter.createMainVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

