//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/5/23.
//

import SwiftUI

struct ListingItemView: View {
    // TODO: replace with actual images
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            // listing info
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }.foregroundStyle(.black)
                }
                
                Spacer()
                
                // ratings
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                        .fontWeight(.bold)
                }.foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ListingItemView()
}
