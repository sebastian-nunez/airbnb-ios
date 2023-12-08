//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false

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
                        ForEach(1 ... 20, id: \.self) { listing in // TODO: replace with actual listing model
                            NavigationLink(value: listing) {
                                ListingItemView()
                            }
                        }
                    }
                }.navigationDestination(for: Int.self) { _ in // TODO: replace with actual listing model
                    ListingDetailsView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
