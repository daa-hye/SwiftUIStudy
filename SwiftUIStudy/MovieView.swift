//
//  MovieView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/14/23.
//

import SwiftUI

struct MovieView: View {

    @State private var isPresented = false

    var body: some View {
        ZStack {
//            Color.green
            Image("dummy")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()

            Image("dummy")
                .resizable()
                .frame(width: 100, height: 100)
                .border(Color.white, width: 10)

            Text("ㅎㅎㅎ")

            VStack {
                Button("Show") {
                    isPresented = true
                }
                .padding()
                .background(.red)
                Spacer()
                HStack {
                    Circle()
                    Circle()
                    Circle()
                }
            }
        }
//        .sheet(isPresented: $isPresented, content: {
//            TamagochiView()
//        })
        .fullScreenCover(isPresented: $isPresented, content: {
            TamagochiView()
        })
    }
}

#Preview {
    MovieView()
}
