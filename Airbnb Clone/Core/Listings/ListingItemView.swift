//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ListingItemView: View {
    var listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ImageCarouselView(images: listing.images)
            
            // listing info
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.bold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                // ratings
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                    
                    Text(listing.rating.printTo(2))
                        .fontWeight(.bold)
                }
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ListingItemView(listing: Mock.listings[0])
}
