//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false

    // inject view model
    @State private var viewModel = ExploreViewModel(with: MockExploreServiceImpl())

    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(showView: $showDestinationSearchView)
            } else {
                ScrollView(.vertical) {
                    // search bar
                    SearchFilterBarView()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }

                    // listings
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in // TODO: replace with actual listing model
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                }.navigationDestination(for: Listing.self) { _ in // TODO: replace with actual listing model
                    ListingDetailsView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    ExploreView()
}
