//
//  ExploreViewModel.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService

    init(with service: ExploreService) {
        self.service = service // inject the service

        Task(priority: .medium) {
            fetchListings
        }
    }

    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
        } catch {
            print("DEBUG: failed to fetch listings with error \(error.localizedDescription)")
        }
    }
}
