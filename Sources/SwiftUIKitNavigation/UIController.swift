//
//  File.swift
//  
//
//  Created by Apple on 19/09/2021.
//

import SwiftUI


class UIController<Content: View>: UIHostingController<Content> {
    func setTag(_ tag: Int) {
        self.view.tag = tag
    }
}
