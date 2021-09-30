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
        vc.setTag(tag)
        return vc
    }
    
    public static func push<Content: View>(_ tag: Int = 1,animated:Bool = true,_ view: Content) {
        let vc = UIController(rootView: view)
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
    }
    
    public static func pushViews<Content: View>(_ tag: Int = 1,animated:Bool = true,_ views: [Content]) {
        NavManager.shared.navController.viewControllers = NavManager.shared.navController.viewControllers + views.map({ view in
            UIController(rootView: view)
        })
    }
    
    public static func pushViewsAndMakeRoot<Content: View>(_ tag: Int = 1,animated:Bool = true,_ views: [Content]) {
        NavManager.shared.navController.viewControllers = views.map({ view in
            UIController(rootView: view)
        })
    }
    
    public static func push<Content: View>(showAppBar: Bool = true, _ tag: Int = 1,animated: Bool = true,_ view: Content) {
        let vc = UIController(rootView: view)
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    public static func pushAndMakeRoot<Content: View>(showAppBar: Bool = true,animated: Bool = true,_ view: Content) {
        let vc = UIController(rootView: view)
        vc.setTag(0)
        NavManager.shared.navController.setViewControllers([vc], animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
}
