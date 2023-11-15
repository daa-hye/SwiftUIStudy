//
//  TransitionView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/15/23.
//

import SwiftUI

struct TransitionView: View {

    @State private var isFull = false
    @State private var isSheet = false

    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button("Full", role: .destructive) {
                    isFull.toggle()
                }
                Button("Sheet", role: .destructive) {
                    isSheet = true
                }
                NavigationLink("Push") {
                    RenderView()
                }
            }
            .sheet(isPresented: $isSheet, content: {
                RenderView()
            })
            .fullScreenCover(isPresented: $isFull, content: {
                RenderView()
        })
        }
    }
}

#Preview {
    TransitionView()
}
