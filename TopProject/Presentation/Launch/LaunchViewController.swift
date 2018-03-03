//
//  LaunchViewController.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MainRouter(presenter: .none).showMainScreen()
    }
}
