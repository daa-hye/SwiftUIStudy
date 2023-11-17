//
//  PosterView.swift
//  SwiftUIStudy
//
//  Created by 박다혜 on 11/15/23.
//

import SwiftUI
/*
 ScrollView
 LazyVStack vs VStack
 List
 AsyncImage
*/
struct PosterView: View {

    @State private var isPresented = false

    var body: some View {
        ScrollView(showsIndicators: true) {
            LazyVStack {
                ForEach(0..<50) { item in
                    AsyncImageView()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            print("tap")
                            isPresented.toggle()
                        }
                }
            }
            //.frame(maxWidth: .infinity)
        }
        .background(.gray)
        .sheet(isPresented: $isPresented, content: {
            CategoryView()
        })
        //.contentMargins(50, for: .scrollIndicators)
    }
}

struct AsyncImageView: View {

    let url = URL(string: "https://picsum.photos/200")

    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure(_):
                Image(systemName: "star")
            @unknown default:
                Image(systemName: "star")
            }
        }

    }
}

#Preview {
    PosterView()
}

//struct AsyncImageView: View {
//
//    let url = URL(string: "https://picsum.photos/200")
//
//    var body: some View {
//        AsyncImage(url: url) { image in
//            image
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//        } placeholder: {
//            //Image(systemName: "star")
//            ProgressView()
//        }
//
//    }
//}
