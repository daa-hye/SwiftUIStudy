//
//  NavigationLazyView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/16/23.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {

    let build: () -> T

    init(_ build: @autoclosure @escaping () -> T ) {
        self.build = build
    }

    var body: some View {
        build()
    }
}
