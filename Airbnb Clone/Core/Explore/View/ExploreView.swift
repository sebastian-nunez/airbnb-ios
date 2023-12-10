//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ExploreView: View {
    // inject view model
    @StateObject var viewModel = ExploreViewModel(with: MockExploreServiceImpl())

    @State private var showDestinationSearchView = false

    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(showView: $showDestinationSearchView,
                                      viewModel: viewModel)
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
                }.navigationDestination(for: Listing.self) { listing in // TODO: replace with actual listing model
                    ListingDetailsView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    ExploreView(viewModel: ExploreViewModel(with: MockExploreServiceImpl()))
}
