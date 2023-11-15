//
//  TamagochiView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/14/23.
//

import SwiftUI

struct User {

    var nickname = "고래밥"

    var introduce: String {
        mutating get {
            nickname = "칙촉"
            return "안녕하세요 \(nickname) 입니다"
        }
    }

    mutating func changeNickname() {
        nickname = "칙촉"
    }

}

// 앱에서 UI는 Data에 의존해서 자신의 상태를 결정하게 된다.

// @State. Source of Truth. View에 대한 상태를 저장하기 위한 목적
// 상태 프로퍼티 (State Property)
// @Binding. Derived Value

struct TamagochiView: View {

    @State private var waterCount = 0
    @State private var riceCount = 0

    @State private var isOn = false
    @State private var inputText = ""

    var body: some View {
        VStack {
            TextField("밥알 갯수 입력하기", text: $inputText)

            Toggle("스위치", isOn: $isOn)
                .padding(50)

            ExtractedView(title: "밥알", count: $riceCount)
            Button("밥알 먹이기") {
                riceCount += 1
                isOn.toggle()
            }
            .padding(50)
            .background(.red)
            ExtractedView(title: "물방울", count: $waterCount)
            Button(action: {
                waterCount += 1
            }, label: {
                Text("물방울 먹이기")
                    .padding(50)
                    .background(.yellow)
            })
        }
        .padding()
    }
}

#Preview {
    TamagochiView()
}

struct ExtractedView: View {

    let title: String
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("\(title) 갯수 : \(count)개")
                .background(.black)
                .foregroundStyle(.white)
            .font(.title)
            Button("하위뷰 버튼") {
                count += 1
            }

        }
    }
}
