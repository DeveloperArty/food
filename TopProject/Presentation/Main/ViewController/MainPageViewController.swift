//
//  MainPageViewController.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    var todayVC: UIViewController!
    var toByListVC: UIViewController!
    
    var vcs: [UIViewController] {
        return [todayVC, toByListVC]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self 

        setViewControllers([todayVC],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    
}

extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return vcs[(vcs.index(of: viewController)! + 1) % 2]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return vcs[(vcs.index(of: viewController)! + 1) % 2]
    }
}
