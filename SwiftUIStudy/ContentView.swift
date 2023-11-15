//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/13/23.
//

import SwiftUI

//Generic: 사용할 때 타입을 구체적으로 지정
//some: Opaque type : 역제네릭 타입

struct ContentView: View {
    var body: some View {

//        Button("버튼데스") {
//            let value = type(of: self.body)
//            print(value)
//        }
//        .background(Color.red)
//        .foregroundStyle(Color.white)

        VStack {
            Text("스유")
                .font(.largeTitle)
                .background(Color.pink)
                .padding()
                .background(Color.blue)
            .border(.green, width: 10)

            Text("스유")
                .font(.largeTitle)
                .background(Color.pink)
                .padding()
                .background(Color.blue)
                .border(.green, width: 10)
            //.clipShape(Circle())
        }

    }
}

#Preview {
    ContentView()
}
