//
//  ListingDetailsView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/7/23.
//

import MapKit
import SwiftUI

struct ListingDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var listing: Listing

    var body: some View {
        ScrollView(.vertical) {
            // images
            ZStack(alignment: .topLeading) {
                ImageCarouselView(images: listing.images, cornerRadius: 0)

                // back button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.foreground)
                        .frame(width: 45, height: 45)
                        .background(
                            Circle()
                                .fill(.foregroundAccent)
                        )
                        .padding(.leading, 32)
                        .padding(.top, 64)
                }
            }

            // property details
            PropertyDetailsView(title: listing.title,
                                rating: listing.rating,
                                numReviews: listing.numReviews,
                                location: "\(listing.city), \(listing.state)")

            Divider()

            // host info
            HostInfoView(headline: listing.type.description,
                         hostName: listing.ownerName,
                         hostImage: listing.ownerImageUrl,
                         numGuests: listing.numGuests,
                         numBedrooms: listing.numBedrooms,
                         numBeds: listing.numBeds,
                         numBaths: listing.numBathrooms)

            Divider()

            // listing features
            ListingFeaturesView(features: listing.features)

            Divider()

            // room details
            RoomDetailsView(numRooms: listing.numBedrooms)

            Divider()

            // amenities
            ListingAmenitiesView(amenities: listing.amemities)

            Divider()

            // map view
            ListingMapView()
        }
        .toolbar(.hidden, for: .tabBar) // disable tab bar since we have overlay
        .ignoresSafeArea() // make images span to the top of the screen
        .padding(.bottom, 64) // push map above overlay
        .overlay(alignment: .bottom) { // bottom overlay
            ReserveListingOverlayView()
        }
    }
}

#Preview {
    ListingDetailsView(listing: Mock.listings[0])
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
                    Text(rating.printTo(2))
                        .fontWeight(.bold)

                    Text(" - ")

                    // reviews
                    Text("\(numReviews) reviews")
                        .fontWeight(.semibold)
                        .underline()
                }
                .foregroundStyle(.foreground)

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
    var features: [ListingFeature]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(features) { feature in
                // feature
                HStack(spacing: 12) {
                    Image(systemName: feature.imageName)

                    VStack(alignment: .leading) {
                        Text(feature.title)
                            .font(.footnote)
                            .fontWeight(.semibold)

                        Text(feature.subTitle)
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

private struct RoomDetailsView: View {
    var numRooms: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1 ... numRooms, id: \.self) { roomNumber in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(systemName: "bed.double")

                            Text("Bedroom \(roomNumber)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 150, height: 100)
                        .background(.foregroundAccent)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 0.5)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging) // "locking" effect
        }
        .padding()
    }
}

private struct ListingAmenitiesView: View {
    let amenities: [ListingAmenity]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)

            ForEach(amenities) { amenity in
                HStack {
                    Image(systemName: amenity.imageName)
                        .frame(width: 32)

                    Text(amenity.title)
                        .font(.footnote)

                    Spacer()
                }
            }
        }
        .padding()
    }
}

private struct ListingMapView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)

            Map()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

private struct ReserveListingOverlayView: View {
    var body: some View {
        VStack {
            Divider()
                .padding(.bottom)

            HStack {
                // reservation details
                VStack(alignment: .leading) {
                    Text("$500")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("Total before taxes")
                        .font(.footnote)

                    Text("Oct 15 - Oct 20")
                        .font(.footnote)
                        .underline()
                        .fontWeight(.semibold)
                }

                Spacer()

                // reserve button
                Button {
                    print("DEBUG: Reserving listing...")
                } label: {
                    Text("Reserve")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
        .background(.background)
    }
}
