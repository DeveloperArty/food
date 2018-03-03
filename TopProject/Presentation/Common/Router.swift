//
//  Router.swift
//  TopProject
//
//  Created by Artem Pavlov on 03.03.2018.
//  Copyright © 2018 Artem Pavlov. All rights reserved.
//

import Foundation
import UIKit


protocol Router {
    
    var storyboard: UIStoryboard { get }
    var presenter: UIViewController? { get }
}


extension Router {
    
    func show(_ viewController: UIViewController) {
        guard let presenter = presenter else {
            UIWindow.keyWindowTransitToViewController(viewController)
            return
        }
        presenter.show(viewController, sender: .none)
    }
    
    func presentModally(_ viewController: UIViewController) {
        guard let presenter = presenter else {
            UIWindow.keyWindowTransitToViewController(viewController)
            return
        }
        presenter.present(viewController,
                          animated: true,
                          completion: .none)
    }
    
    static func storyboard(named: String) -> UIStoryboard {
        return UIStoryboard.init(name: named, bundle: nil)
    }
}

extension UIViewController {
    func firstParent() -> UIViewController {
        if let parent = self.parent {
            return parent.firstParent()
        } else {
            return self
        }
    }
}


public extension UIWindow {
    
    class func keyWindowTransitToViewController(_ viewController: UIViewController) {
        UIApplication.shared.keyWindow?.transitToViewController(viewController)
    }
    
    func transitToViewController(_ viewController: UIViewController) {
        insertSubview(viewController.view, belowSubview: rootViewController!.view)
        
        UIView.transition(with: self,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { self.rootViewController = viewController },
                          completion: nil)
    }
    
}
