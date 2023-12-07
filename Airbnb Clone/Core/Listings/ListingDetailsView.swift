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
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .bold()

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        // ratings
                        Image(systemName: "star.fill")
                        Text("4.86")
                            .fontWeight(.bold)

                        Text(" - ")

                        // reviews
                        Text("28 reviews")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .foregroundStyle(.black)

                    // location
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading) // align left
            .padding(.leading)

            // owner info

            // perks

            // amenities
        }
    }
}

#Preview {
    ListingDetailsView()
}
