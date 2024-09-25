//
//  HomeViewModel.swift
//  Test Demo
//
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var items: [FlickerItem] = []
    @Published var searchText: String = "" {
        didSet {
            guard !searchText.isEmpty else { return }
            Task {
                await self.fetchItems()
            }
        }
    }
    private var apiClient = APIClient()
    init() {
        Task {
            await fetchItems()
        }
    }
    func fetchItems() async {
        do {
            guard let fetchedItems = try await apiClient.fetchItems(searchText: searchText) else { 
                return
            }
            DispatchQueue.main.async {
                self.items = fetchedItems.items
            }
        } catch {
            print("Failed to fetch items: \(error)")
        }
    }
    
    var filteredItems: [FlickerItem] {
        return items
    }
}
