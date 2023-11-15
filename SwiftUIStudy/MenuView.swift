//
//  MenuView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/13/23.
//

import SwiftUI

struct MenuView: View {

    var cardProperty: some View {
        VStack(spacing: 10) {
            Image(systemName: "star")
                .background(.yellow)
            Text("text")
                .background(.blue)
        }
        .padding(10)
        .background(.red)
    }

    var body: some View {
        VStack {
            
            HStack(spacing: 20) {
                CardView(image: "star", text: "토스뱅크")
                CardView(image: "person", text: "고객센터")
                CardView(image: "pencil", text: "토스증권")

                cardProperty
            }

        }
        List() {
            Section {
                Text("보안과 인증")
                    .asPointBorderText()
                ColorPicker("컬러 설정", selection: .constant(.red))
                Text("내 신용점수")
                Text("진행 중인 이벤트")
            }
            Section("자산") {
                Text("내 자산")
                Text("송금")
                Text("투자 모아보기")
                    .modifier(PointBorderText())
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    MenuView()
}

struct CardView: View {
    let image: String
    let text: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: image)
                .background(.yellow)
            Text(text)
                .background(.blue)
                .underline()
                .strikethrough()
        }
        .padding(10)
        .background(.red)
    }
}

// custom modifier
struct PointBorderText: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(.capsule)
    }

}

extension View {

    func asPointBorderText() -> some View {
        modifier(PointBorderText())
    }

}
