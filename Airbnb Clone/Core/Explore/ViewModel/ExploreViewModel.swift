//
//  ExploreViewModel.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""

    private let service: ExploreService
    private var listingsCopy = [Listing]() // used to maintain the unfiltered items

    init(with service: ExploreService) {
        self.service = service // inject the service

        Task(priority: .medium) {
            await fetchListings()
        }
    }

    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
            listingsCopy = listings
        } catch {
            print("DEBUG: failed to fetch listings with error \(error.localizedDescription)")
        }
    }

    func filterListingByLocation() {
        let normalizedLocation = searchLocation.lowercased()

        let filteredListings = listings.filter {
            $0.city.lowercased() == normalizedLocation ||
                $0.state.lowercased() == normalizedLocation
        }

        listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
