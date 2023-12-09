//
//  mocks.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/7/23.
//

import Foundation

let mockListingImages = [
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4"
]

enum Mock {
    static var listings: [Listing] = [
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-1",
            title: "Cozy Apartment near Downtown",
            rating: 4.5,
            numReviews: 29,
            type: .apartment,
            images: [
                "listing-1",
                "listing-2",
                "listing-4",
                "listing-8",
                "listing-5"
            ],
            numBedrooms: 2,
            numBeds: 3,
            numBathrooms: 1,
            numGuests: 4,
            pricePerNight: 100,
            latitude: 37.7749,
            longitude: -122.4194,
            street: "123 Main St",
            city: "San Francisco",
            state: "CA",
            zipCode: 94105,
            features: [.selfCheckin, .superHost],
            amemities: [.wifi, .kitchen, .tv, .laundry, .alarmSystem]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jane Miller",
            ownerImageUrl: "female-2",
            title: "Spacious House with Garden",
            rating: 5.0,
            numReviews: 203,
            type: .house,
            images: [
                "listing-4",
                "listing-5",
                "listing-2",
                "listing-6"
            ],
            numBedrooms: 3,
            numBeds: 4,
            numBathrooms: 2,
            numGuests: 6,
            pricePerNight: 150,
            latitude: 34.0522,
            longitude: -118.2437,
            street: "456 Oak St",
            city: "Los Angeles",
            state: "CA",
            zipCode: 90012,
            features: [.superHost],
            amemities: [.pool, .kitchen, .wifi, .tv, .laundry]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Emily Johnson",
            ownerImageUrl: "female-1",
            title: "Modern Townhouse in the Heart of the City",
            rating: 4.2,
            numReviews: 120,
            type: .townHouse,
            images: [
                "listing-7",
                "listing-8",
                "listing-9",
                "listing-1",
                "listing-2"
            ],
            numBedrooms: 2,
            numBeds: 2,
            numBathrooms: 1,
            numGuests: 3,
            pricePerNight: 120,
            latitude: 40.7128,
            longitude: -74.0060,
            street: "789 Elm St",
            city: "New York",
            state: "NY",
            zipCode: 10001,
            features: [.selfCheckin],
            amemities: [.wifi, .office, .balcony, .kitchen, .alarmSystem]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Michael Brown",
            ownerImageUrl: "male-2",
            title: "Luxurious Villa with Ocean View",
            rating: 4.8,
            numReviews: 37,
            type: .villa,
            images: [
                "listing-10",
                "listing-1",
                "listing-2",
                "listing-3",
                "listing-4"
            ],
            numBedrooms: 4,
            numBeds: 5,
            numBathrooms: 3,
            numGuests: 8,
            pricePerNight: 300,
            latitude: 33.6844,
            longitude: -117.8265,
            street: "101 Palm Ave",
            city: "Newport Beach",
            state: "CA",
            zipCode: 92660,
            features: [.superHost],
            amemities: [.pool, .kitchen, .wifi, .tv, .alarmSystem]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Chris Anderson",
            ownerImageUrl: "male-3",
            title: "Charming Cottage with Garden",
            rating: 4.6,
            numReviews: 32,
            type: .house,
            images: [
                "listing-5",
                "listing-6",
                "listing-7"
            ],
            numBedrooms: 2,
            numBeds: 2,
            numBathrooms: 1,
            numGuests: 4,
            pricePerNight: 130,
            latitude: 41.8781,
            longitude: -87.6298,
            street: "456 Maple St",
            city: "Chicago",
            state: "IL",
            zipCode: 60601,
            features: [.selfCheckin],
            amemities: [.kitchen, .wifi, .tv, .laundry]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sophie Miller",
            ownerImageUrl: "female-3",
            title: "Sunny Apartment with Panoramic Views",
            rating: 4.9,
            numReviews: 72,
            type: .apartment,
            images: [
                "listing-8",
                "listing-9",
                "listing-10",
                "listing-1"
            ],
            numBedrooms: 1,
            numBeds: 1,
            numBathrooms: 1,
            numGuests: 2,
            pricePerNight: 90,
            latitude: 37.3382,
            longitude: -121.8863,
            street: "789 Oak St",
            city: "San Jose",
            state: "CA",
            zipCode: 95112,
            features: [.superHost],
            amemities: [.wifi, .kitchen, .tv]
        ),
        Listing(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "David Clark",
            ownerImageUrl: "male-4",
            title: "Rustic Cabin Retreat in the Mountains",
            rating: 4.7,
            numReviews: 14
            type: .house,
            images: [
                "listing-2",
                "listing-3",
                "listing-4",
                "listing-5"
            ],
            numBedrooms: 3,
            numBeds: 3,
            numBathrooms: 2,
            numGuests: 6,
            pricePerNight: 180,
            latitude: 39.5501,
            longitude: -105.7821,
            street: "234 Pine St",
            city: "Denver",
            state: "CO",
            zipCode: 80202,
            features: [.selfCheckin, .superHost],
            amemities: [.kitchen, .wifi, .tv, .laundry, .balcony]
        )
    ]
}
