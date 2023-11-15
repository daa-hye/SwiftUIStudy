//
//  CategoryView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/15/23.
//

import SwiftUI

/*
 ForEach
 - ..<
 - KeyPath \.
 - id: KeyPath -> item
 - Hashable
 */

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {

    let category = [
        Category(name: "스릴러", count: 10),
        Category(name: "코미디", count: 11),
        Category(name: "액션", count: 40),
        Category(name: "SF", count: 71),
        Category(name: "애니메이션", count: 80),
        Category(name: "애니메이션", count: 60)
    ]

    var body: some View {
        VStack {
            ForEach(category, id: \.id) { item in
                Text("\(item.name) \(item.count) 안녕하세요")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CategoryView()
}
