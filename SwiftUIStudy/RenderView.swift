//
//  RenderView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/13/23.
//

import SwiftUI

struct RenderView: View {

    @State var age = 10

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue, Color.yellow]), startPoint: .bottomLeading, endPoint: .trailing)

                        )
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [Color.red,Color.yellow]), center: .bottom, startRadius: 0, endRadius: 60)
                        )
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            AngularGradient(colors: [Color.purple,Color.blue], center: .center, angle: .degrees(100))
                        )
                }
                .frame(width: .infinity, height: 100)

                NavigationLink("Push") {
                    MenuView()
                }
                Text("Hue: \(age)")
                Text("Jack: \(Int.random(in: 1...100))")
                bran
                KokoView()
                Button("클릭") {
                    age = Int.random(in: 1...100)
                }
            }
            .navigationTitle("네비게이션 타이틀")
            .navigationBarItems(leading: Text("클릭"))
        }
    }

    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
    }
}

#Preview {
    RenderView()
}

struct KokoView: View {
    var body: some View {
        Text("Koko: \(Int.random(in: 1...100))")
    }
}

