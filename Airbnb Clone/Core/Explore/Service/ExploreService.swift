//
//  ExploreService.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

protocol ExploreService {
    func fetchListings() async throws -> [Listing]
}
