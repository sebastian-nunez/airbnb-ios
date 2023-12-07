//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                // search bar
                SearchFilterBarView()

                // listings
                LazyVStack(spacing: 32) {
                    ForEach(1 ... 20, id: \.self) { listing in // TODO: replace with actual listing model
                        NavigationLink(value: listing) {
                            ListingItemView()
                        }
                    }
                }
            }.navigationDestination(for: Int.self) { listing in // TODO: replace with actual listing model
                Text("Listing details view (\(listing))...")
            }
        }
    }
}

#Preview {
    ExploreView()
}
