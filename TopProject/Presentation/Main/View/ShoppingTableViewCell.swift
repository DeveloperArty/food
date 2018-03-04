//
//  ShoppingTableViewCell.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit
import M13Checkbox

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var box: M13Checkbox!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var selectedFlag: Bool = false {
        willSet {
            box.setCheckState(newValue ? .checked : .unchecked, animated: true)
            UIView.animate(withDuration: 0.3,
                           animations: { [weak self] in
                            guard let presenter = self else { return }
                            presenter.container.alpha = !newValue ? 1 : 0.3
                            [presenter.nameLabel, presenter.countLabel].forEach({ $0?.alpha = !newValue ? 1 : 0.7 })
                            [presenter.countLabel, presenter.nameLabel].forEach({ $0?.textColor = !newValue ? UIColor.black : #colorLiteral(red: 0.9748228192, green: 0.4085458517, blue: 0.1495008171, alpha: 1)})
                            presenter.box.tintColor = !newValue ? UIColor.black : #colorLiteral(red: 0.9748228192, green: 0.4085458517, blue: 0.1495008171, alpha: 1)
            })
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        box.stateChangeAnimation = .spiral
        box.checkState = .unchecked
        box.tintColor = #colorLiteral(red: 0.9748228192, green: 0.4085458517, blue: 0.1495008171, alpha: 1)
        box.isUserInteractionEnabled = false
        
        self.selectionStyle = .none
        
        container.layer.cornerRadius = 5
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.black.cgColor
    }
    
    func configure(_ data: (String, String)) {
        self.nameLabel.text = data.0
        self.countLabel.text = data.1
    }
}
