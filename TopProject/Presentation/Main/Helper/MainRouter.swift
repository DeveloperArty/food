//
//  MainRouter.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: Router {
    
    let presenter: UIViewController?
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(presenter: UIViewController?) {
        self.presenter = presenter
    }
    
    func showMainScreen() {
        let nc = storyboard.instantiateViewController(withIdentifier: "mainNC") as! UINavigationController
        
        let page = nc.viewControllers.first! as! MainPageViewController
        let todayVC = storyboard.instantiateViewController(withIdentifier: "todayVC")
        let toByListVC = storyboard.instantiateViewController(withIdentifier: "toBuyListVC")
        page.todayVC = todayVC
        page.toByListVC = toByListVC
        
        show(nc)
    }
}
