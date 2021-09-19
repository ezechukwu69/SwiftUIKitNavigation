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
    
    static func createPage(_ tag: Int, @ViewBuilder _ view: () -> Content) -> UIHostingController<Content> {
        let vc = UIController(rootView: view())
        vc.setTag(tag)
        return vc
    }
    
    static func push(_ tag: Int = 1,animated:Bool = true, @ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
    }
    
    static func push(showAppBar: Bool = true, _ tag: Int = 1,animated: Bool = true, @ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.setTag(tag)
        NavManager.shared.navController.pushViewController(vc, animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
    
    static func pushAndMakeRoot(showAppBar: Bool = true,animated: Bool = true, @ViewBuilder _ view: () -> Content) {
        let vc = UIController(rootView: view())
        vc.setTag(0)
        NavManager.shared.navController.setViewControllers([vc], animated: animated)
        NavManager.shared.navController.navigationBar.isHidden = !showAppBar
    }
}
