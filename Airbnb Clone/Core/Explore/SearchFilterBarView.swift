//
//  SearchFilterBarView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/6/23.
//

import SwiftUI

struct SearchFilterBarView: View {
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                // image
                Image(systemName: "magnifyingglass")

                // location info
                VStack(alignment: .leading, spacing: 2) {
                    Text("Where to?")
                        .font(.footnote)
                        .fontWeight(.bold)

                    Text("Anywhere - Any Week - Add Guests")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
            }

            Spacer()

            // filter
            Button {} label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray3))
                .dropShadow()
        }
        .padding()
    }
}

#Preview {
    SearchFilterBarView()
}
