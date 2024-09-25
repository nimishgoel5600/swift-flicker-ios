//
//  DetailView.swift
//  Test Demo
//
//

import SwiftUI

struct DetailView: View {
    let item: FlickerItem
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Format of the published date
        return formatter
    }()
    var body: some View {
        VStack {
            AsyncImageView(url: item.media.m)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .edgesIgnoringSafeArea(.top)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Title: \(item.title)")
                    .font(.title)
                    .padding(.top, 20)
                
                Text("Description: \(item.description)")
                    .font(.subheadline)
                
                Text("Author: \(item.author)")
                    .font(.subheadline)
                
                if let publishedDate = dateFormatter.date(from: item.published) {
                    Text("Published: \(formattedDate(from: publishedDate))")
                        .font(.subheadline)
                } else {
                    Text("Published: \(item.published)")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    private func formattedDate(from date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            return formatter.string(from: date)
        }
}

