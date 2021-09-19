//
//  File.swift
//  
//
//  Created by Apple on 19/09/2021.
//

import SwiftUI


public class UIController<Content: View>: UIHostingController<Content> {
    public func setTag(_ tag: Int) {
        self.view.tag = tag
    }
}
