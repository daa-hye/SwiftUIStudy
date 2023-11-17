//
//  RenderView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/13/23.
//

import SwiftUI

struct RenderView: View {

    //시스템에서 정의된 값을 감지하고 뷰를 업데이트 할 수 있음
    //@Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme

    @State var age = 10

    init(age: Int = 10) {
        self.age = age
        print("render init")
    }

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
                Button( colorScheme == .dark ? "다크모드클릭" : "라이트모드클릭") {
                    //presentationMode.wrappedValue.dismiss()
                    dismiss.callAsFunction()
                }
                .background(colorScheme == .dark ? .black : .white)
                .foregroundStyle(colorScheme == .dark ? .blue : .red)
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

