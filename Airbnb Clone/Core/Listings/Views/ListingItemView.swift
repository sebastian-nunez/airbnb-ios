//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ListingItemView: View {
    var body: some View {
        VStack(spacing: 8) {
            // images
            ImageCarouselView(images: mockListingImages)
            
            // listing info
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.bold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                // ratings
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                        .fontWeight(.bold)
                }
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ListingItemView()
}
