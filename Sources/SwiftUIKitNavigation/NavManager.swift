//
//  File.swift
//  
//
//  Created by Apple on 19/09/2021.
//

import UIKit


public class NavManager {
    let navController: UINavigationController
    
    private init() {
        print("Init")
        navController = UINavigationController()
    }
    
    public static func pop(animated:Bool = true) {
        NavManager.shared.navController.popViewController(animated: animated)
    }
    
    public static func pop(animated:Bool = true, showAppBar: Bool = true) {
        NavManager.shared.navController.popViewController(animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func popToRoot(animated:Bool = true) {
        NavManager.shared.navController.popToRootViewController(animated: animated)
    }
    
    public static func popToRoot(animated:Bool = true, showAppBar: Bool = true) {
        NavManager.shared.navController.popViewController(animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func popToViewController(withTag tag: Int, animated: Bool = true) {
        let nc = NavManager.shared.navController
         let index = nc.viewControllers.lastIndex { view in
            return view.view.tag == tag
        }
        
        guard let i = index else { return }
    
        nc.popToViewController(nc.viewControllers[i], animated: true)
    }
    
    public static func popToViewController(withTag tag: Int, animated:Bool = true, showAppBar: Bool = true) {
        let nc = NavManager.shared.navController
         let index = nc.viewControllers.lastIndex { view in
            return view.view.tag == tag
        }
        
        guard let i = index else { return }
        nc.popToViewController(nc.viewControllers[i], animated: true)
        NavManager.shared.navController.popViewController(animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static let shared = NavManager()
}
