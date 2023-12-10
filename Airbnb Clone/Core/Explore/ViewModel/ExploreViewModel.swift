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

        let filteredListings = listings.filter { listing in
            let normalizedCity = listing.city.lowercased()
            let normalizedState = listing.state.lowercased()

            return normalizedCity.starts(with: normalizedLocation) ||
                normalizedState.starts(with: normalizedLocation)
        }

        listings = filteredListings.isEmpty ? listings : filteredListings
    }
}
