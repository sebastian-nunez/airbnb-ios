//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import SwiftUI

struct DestinationSearchView: View {
    // bindings
    @Binding var showView: Bool

    // state
    @State private var destinationText = ""

    var body: some View {
        VStack {
            // top controls
            HStack {
                // close button
                Button {
                    withAnimation(.snappy) {
                        showView.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.black)
                }

                Spacer()

                Text("Clear")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)

            // location search
            LocationSearchView(text: $destinationText)
            
            // data selection
            VStack {
                
            }
            
            // guest selection

            Spacer()
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    DestinationSearchView(showView: .constant(false))
}

private struct LocationSearchView: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Where to?")
                .font(.title2)
                .fontWeight(.semibold)

            HStack {
                Image(systemName: "magnifyingglass")
                    .imageScale(.medium)

                TextField("Search destinations...", text: $text)
                    .font(.subheadline)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.systemGray4))
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}
