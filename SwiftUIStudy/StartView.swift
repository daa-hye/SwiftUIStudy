//
//  StartView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/15/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        TabView {
            Text("1")
                .tabItem {
                    Text("홈화면")
                    Image(systemName: "house.fill")
                }
            Text("2")
                .tabItem {
                    Text("검색화면")
                    Image(systemName: "magnifyingglass")
                }
            Text("3")
                .tabItem {
                    Text("설정화면")
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    StartView()
}
