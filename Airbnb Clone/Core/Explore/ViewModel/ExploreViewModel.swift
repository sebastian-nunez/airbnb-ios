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
            await fetchListings()
        }
    }

    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
        } catch {
            print("DEBUG: failed to fetch listings with error \(error.localizedDescription)")
        }
    }

    func filterListingByLocation(for location: String) {
        let normalizedLocation = location.lowercased()

        let filteredListings = listings.filter {
            $0.city.lowercased().starts(with: normalizedLocation) ||
                $0.state.lowercased().starts(with: normalizedLocation)
        }

        listings = filteredListings.isEmpty ? listings : filteredListings
    }
}
