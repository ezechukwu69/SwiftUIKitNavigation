//
//  File.swift
//  
//
//  Created by Apple on 19/09/2021.
//

import SwiftUI

#if !os(macOS)
import UIKit
#endif

@available(iOS 13.0, *)
struct UIKitNavigationImplementation<Content: View>: UIViewControllerRepresentable {
    
    let root: Content?
    
    public init(@ViewBuilder content: () -> Content) {
        root = content()
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        let nav = NavManager.shared.navController
        let vc = UIController(rootView: root)
        vc.setTag(0)
        nav.viewControllers = [vc]
        return nav
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    public typealias UIViewControllerType = UIViewController
    
}
