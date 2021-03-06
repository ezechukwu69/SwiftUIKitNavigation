//
//  File.swift
//  
//
//  Created by Apple on 19/09/2021.
//

import SwiftUI
import UIKit

public protocol Page: View {
    var tag: Int { get set }
}

public class Stack<Content: View> {
    
    public static func createPage(_ tag: Int, @ViewBuilder _ view: () -> Content) -> UIHostingController<Content> {
        let vc = UIController(rootView: view())
        vc.view.bounds = UIScreen.main.bounds
        vc.setTag(tag)
        return vc
    }
    
    public static func push(_ tag: Int = 1,animated:Bool = true,@ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.view.bounds = UIScreen.main.bounds
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
    }
    
    
    public static func push(showAppBar: Bool = true, _ tag: Int = 1,animated: Bool = true,@ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.view.bounds = UIScreen.main.bounds
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func setViews(showAppBar: Bool = true, _ tag: Int = 1,animated: Bool = true, views: [Content]) {
        NavManager.shared.navController.viewControllers = views.map({ view in
            let vc = UIController(rootView: view)
            vc.view.bounds = UIScreen.main.bounds
            vc.setTag(tag)
            return vc
        })
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func pushViews(showAppBar: Bool = true, _ tag: Int = 1,animated: Bool = true, views: [Content]) {
        NavManager.shared.navController.viewControllers.append(contentsOf: views.map({ view in
            let vc = UIController(rootView: view)
            vc.view.bounds = UIScreen.main.bounds
            vc.setTag(tag)
            return vc
        }))
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func pushAndMakeRoot(showAppBar: Bool = true,animated: Bool = true,@ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.view.bounds = UIScreen.main.bounds
        vc.setTag(0)
        NavManager.shared.navController.setViewControllers([vc], animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
}
