//
//  CharttView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/17/23.
//

import SwiftUI
import Charts

struct CharttView: View {

    let movie: [Movie]

    @Environment (\.colorScheme) var color

    @ViewBuilder
    var chartTitle: some View {
        if color == .dark {
            Text("다크차트")
        } else {
            Text("라이트차트")
        }
    }

    var body: some View {
        VStack {
            chartTitle
            Chart(movie, id: \.self) { item in
//                BarMark(
//                RectangleMark(
//                LineMark(
                AreaMark(
                    x: .value("장르", item.name),
                    y: .value("관람횟수", item.count)
                )
                .foregroundStyle(Color.random())
            }
            .frame(height: 200)
        }
        .padding()
    }

}

#Preview {
    CharttView(movie: [
        Movie(name: "SF"),
        Movie(name: "스릴러"),
        Movie(name: "로맨스"),
        Movie(name: "가족"),
        Movie(name: "액션")
    ])
}
