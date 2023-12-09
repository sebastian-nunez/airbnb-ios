//
//  MockExploreServiceImpl.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

class MockExploreServiceImpl: ExploreService {
    func fetchListings() async throws -> [Listing] {
        return Mock.listings // TODO: replace with actual API call
    }
}
