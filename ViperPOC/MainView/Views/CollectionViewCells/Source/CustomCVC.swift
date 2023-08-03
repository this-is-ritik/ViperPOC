//
//  CustomCVC.swift
//  ViperPOC
//
//  Created by Ritik Sharma on 02/08/23.
//

import UIKit


protocol CollectionViewCellProtocol: AnyObject {
    func configureView(with model: BaseModel?)
}
class CustomCVC: UICollectionViewCell {
    
    @IBOutlet private weak var stkView: UIStackView!
    @IBOutlet private weak var headerLbl: UILabel!
    @IBOutlet private weak var descLbl: UILabel!
    
    public static let reuseIdentifier: String = "CustomCVC"
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    func initialSetup() {
        self.headerLbl.numberOfLines = 1
        self.descLbl.numberOfLines = 3
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.cornerRadius = 16
    }
}


extension CustomCVC: CollectionViewCellProtocol {
    
    func configureView(with model: BaseModel?) {
        self.headerLbl.text = model?.title
        self.descLbl.text = model?.description
    }
    
    
}
