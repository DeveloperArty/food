//
//  ImageTableViewCell.swift
//  TopProject
//
//  Created by Artem Pavlov on 04.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var com: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ data: (UIImage, String, Int, Сomplexity)) {
        self.mealImage.image = data.0
        self.name.text = data.1
        self.time.text = "\(data.2) мин."
        switch data.3 {
        case .Easy:
            com.backgroundColor = UIColor.green
        case .Hard:
            com.backgroundColor = UIColor.red
        case .OK:
            com.backgroundColor = UIColor.yellow
        }
    }
    
}
