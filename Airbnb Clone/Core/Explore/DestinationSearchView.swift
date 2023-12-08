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
            // nav controls
            NavigationControlsView(showView: $showView)

            // location search
            LocationSearchView(text: $destinationText)

            // date selection
            VStack {
                HStack {
                    Text("When")
                        .foregroundStyle(.gray)

                    Spacer()

                    Text("Add dates")
                }
                .font(.headline)
                .fontWeight(.semibold)
            }
            .cardStyle()

            // guest selection
            VStack {
                HStack {
                    Text("Who")
                        .foregroundStyle(.gray)

                    Spacer()

                    Text("Add guests")
                }
                .font(.headline)
                .fontWeight(.semibold)
            }
            .cardStyle()

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
        .cardStyle()
    }
}

struct NavigationControlsView: View {
    @Binding var showView: Bool

    var body: some View {
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
    }
}
