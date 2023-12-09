//
//  Listing.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/9/23.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String

    // owner info
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String

    // listing info
    let title: String
    var rating: Double
    var numReviews: Int
    let type: ListingType
    var images: [String]

    // bedrooms
    let numBedrooms: Int
    let numBeds: Int
    let numBathrooms: Int

    // pricing
    let numGuests: Int
    var pricePerNight: Int

    // location
    let latitude: Double
    let longitude: Double

    // address
    let street: String
    let city: String
    let state: String
    let zipCode: Int

    // property benefits
    var features: [ListingFeature]
    var amemities: [ListingAmenity]
}

enum ListingFeature: Int, Codable, Identifiable, Hashable {
    case selfCheckin
    case superHost

    var id: Int {
        return self.rawValue
    }

    var title: String {
        switch self {
        case .selfCheckin: "Self Check-in"
        case .superHost: "Superhost"
        }
    }

    var subTitle: String {
        switch self {
        case .selfCheckin: "Check yourself in with the keypad."
        case .superHost: "Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests"
        }
    }

    var imageName: String {
        switch self {
        case .selfCheckin: "door.left.hand.open"
        case .superHost: "medal"
        }
    }
}

enum ListingAmenity: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony

    var id: Int {
        return self.rawValue
    }

    var title: String {
        switch self {
        case .pool: "Pool"
        case .kitchen: "Kitchen"
        case .wifi: "Wifi"
        case .laundry: "Laundry"
        case .tv: "TV"
        case .alarmSystem: "Alarm System"
        case .office: "Office"
        case .balcony: "Balcony"
        }
    }

    var imageName: String {
        switch self {
        case .pool: "figure.pool.swim"
        case .kitchen: "fork.knife"
        case .wifi: "wifi"
        case .laundry: "washer"
        case .tv: "tv"
        case .alarmSystem: "checkerboard.shield"
        case .office: "pencil.and.ruler.fill"
        case .balcony: "building"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa

    var description: String {
        switch self {
        case .apartment: "Apartment"
        case .house: "House"
        case .townHouse: "Town House"
        case .villa: "Villa"
        }
    }

    var id: Int {
        return self.rawValue
    }
}
