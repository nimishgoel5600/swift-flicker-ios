//
//  ContentView.swift
//  Test Demo
//
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText: String = ""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                    
                
                GeometryReader { geometry in
                    ScrollView {
                        let columns = [GridItem(.adaptive(minimum: geometry.size.width / 2 - 10))]
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.filteredItems) { item in
                                NavigationLink(destination: DetailView(item: item)) {
                                    VStack {
                                        AsyncImageView(url: item.media.m)
                                            .frame(width: geometry.size.width / 2 - 10, height: geometry.size.width / 2 - 10)
                                        Text(item.title)
                                            .font(.caption)
                                            .lineLimit(1)
                                    }
                                    .frame(width: geometry.size.width / 2 - 10)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }
            }
            .navigationBarTitle("Search & Grid")
        }
    }
}

#Preview {
    HomeView()
}
