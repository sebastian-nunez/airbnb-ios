//
//  ListingDetailsView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/7/23.
//

import MapKit
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

            // room details
            RoomDetailsView() // TODO: create data model & link to rooms

            Divider()

            // amenities
            ListingAmenitiesView() // TODO: create data model

            Divider()

            // map view
            ListingMapView()
        }
        .ignoresSafeArea() // make images span to the top of the screen
        .padding(.bottom, 64) // push map above overlay
        .overlay(alignment: .bottom) { // bottom overlay
            ReserveListingOverlayView()
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

private struct RoomDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1 ..< 5, id: \.self) { bedroom in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(systemName: "bed.double")

                            Text("Bedroom \(bedroom)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 150, height: 100)
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
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)

            ForEach(1 ..< 5, id: \.self) { _ in
                HStack {
                    Image(systemName: "wifi")
                        .frame(width: 32)

                    Text("Wifi")
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
        .background(.white)
    }
}
