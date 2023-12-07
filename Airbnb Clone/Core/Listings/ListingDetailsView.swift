//
//  ListingDetailsView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/7/23.
//

import SwiftUI

struct ListingDetailsView: View {
    var body: some View {
        ScrollView(.vertical) {
            // images
            ImageCarouselView(images: mockListingImages,
                              cornerRadius: 0)

            // property details

            // owner info

            // perks

            // amenities
        }
    }
}

#Preview {
    ListingDetailsView()
}
