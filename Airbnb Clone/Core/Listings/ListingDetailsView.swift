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
            ImageCarouselView(images: mockListingImages, cornerRadius: 0)

            // property details
            PropertyDetailsView(title: "Miami Villa",
                                rating: 4.86,
                                numReviews: 28,
                                location: "Miami, Florida")

            Divider()

            // host info
            HostInfoView(headline: "Entire villa",
                         hostName: "John Smith",
                         hostImage: "male-photo",
                         numGuests: 4,
                         numBedrooms: 4,
                         numBeds: 4,
                         numBaths: 3)

            Divider()

            // listing features
            ListingFeaturesView() // TODO: create data model

            Divider()

            // amenities
        }
    }
}

#Preview {
    ListingDetailsView()
}

private struct PropertyDetailsView: View {
    var title: String
    var rating: Double
    var numReviews: Int
    var location: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title)
                .bold()

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    // ratings
                    Image(systemName: "star.fill")
                    Text(String(format: "%.2f", rating))
                        .fontWeight(.bold)

                    Text(" - ")

                    // reviews
                    Text("\(numReviews) reviews")
                        .fontWeight(.semibold)
                        .underline()
                }
                .foregroundStyle(.black)

                // location
                Text(location)
            }
            .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading) // align left
        .padding()
    }
}

private struct HostInfoView: View {
    var headline: String
    var hostName: String
    var hostImage: String

    var numGuests: Int
    var numBedrooms: Int
    var numBeds: Int
    var numBaths: Int

    var body: some View {
        HStack {
            // subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text("\(headline) hosted by \(hostName)")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)

                // property info
                HStack(spacing: 2) {
                    Text("\(numGuests) guests -")
                    Text("\(numBedrooms) bedrooms -")
                    Text("\(numBeds) beds -")
                    Text("\(numBaths) baths")
                }
                .font(.caption)
            }
            .frame(width: 300, alignment: .leading)

            Spacer()

            // user image
            Image(hostImage)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        }
        .padding()
    }
}

private struct ListingFeaturesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(1 ... 2, id: \.self) { _ in
                // feature
                HStack(spacing: 12) {
                    Image(systemName: "medal")

                    VStack(alignment: .leading) {
                        Text("Self check-in")
                            .font(.footnote)
                            .fontWeight(.semibold)

                        Text("Check yourself in with the keypad")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    Spacer()
                }
            }
        }
        .padding()
    }
}
