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
public struct UIKitNavigationImplementation<Content: View>: UIViewControllerRepresentable {
    
    let root: Content?
    
    init(@ViewBuilder content: () -> Content) {
        root = content()
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let nav = NavManager.shared.navController
        let vc = UIController(rootView: root)
        vc.setTag(0)
        nav.viewControllers = [vc]
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    typealias UIViewControllerType = UIViewController
    
}
