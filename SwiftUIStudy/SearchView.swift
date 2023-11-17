//
//  SearchView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/16/23.
//

import SwiftUI

//struct SearchView: View {
//
//    @State var randomNumber = 0
//
//    init(randomNumber: Int = 0) {
//        self.randomNumber = randomNumber
//        print("searchView init")
//    }
//
//    var body: some View {
//        VStack {
//            HueView()
//            jackView
//            kokoView()
//            Text("Bran \(randomNumber)")
//                .background(Color.random())
//            Button("클릭") {
//                randomNumber = Int.random(in: 1...100)
//            }
//        }
//    }
//
//    var jackView: some View {
//        Text("Jack")
//            .background(Color.random())
//    }
//
//    func kokoView() -> some View {
//        Text("Koko")
//            .background(Color.random())
//    }
//}

struct Movie: Hashable {
    let name: String
    let color = Color.random()
    let count = Int.random(in: 1...100)
}

struct SearchView: View {

    @State var searchQuery = ""
    @State var showChart = false

    let movie = [
        Movie(name: "A"),
        Movie(name: "해리포터"),
        Movie(name: "겨울왕국"),
        Movie(name: "어바웃타임"),
        Movie(name: "엑스맨"),
        Movie(name: "아이언맨")
    ]

    var filterMoview: [Movie] {
        return searchQuery.isEmpty ? movie : movie.filter{$0.name.contains(searchQuery)}
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filterMoview, id: \.self) { item in
//                    NavigationLink {
//                        SearchDetailView(movie: item)
//                    } label: {
//                        HStack {
//                            Circle()
//                                .foregroundStyle(item.color)
//                            Text("\(item.name)")
//                        }
//                    }
                    NavigationLink(value: item) {
                        HStack {
                            Circle()
                                .foregroundStyle(item.color)
                            Text("\(item.name)")
                        }
                    }

                }
                .frame(height: 60)
            }
            .navigationTitle("검색")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        showChart.toggle()
                        print("클릭")
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        print("클릭")
                    } label: {
                        Image(systemName: "person.fill")
                    }
                }
            }
            .navigationDestination(for: Movie.self) { item in
                SearchDetailView(movie: item)
            }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "검색검색")
            .onSubmit(of: .search) {
                print("aaaaa")
            }
            .sheet(isPresented: $showChart, content: {
                CharttView(movie: movie)
            })
        }
    }

}

struct SearchDetailView: View {

    let movie: Movie

    var body: some View {
        VStack {
            Text("\(movie.name)")
            Button("search detail") {
                print("a")
            }
            Button(action: {
                print("a")
            }, label: {
                HStack {
                    Circle().foregroundStyle(Color.red)
                    Text("Button")
                }
            })
            .frame(width: 100, height: 40)
        }
    }

}

#Preview {
    SearchView()
}

struct HueView: View {

    init() {
        print("init hue")
    }

    var body: some View {  // init과 body가 별도로 동작
        Text("Hue")
            .background(Color.random())
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
