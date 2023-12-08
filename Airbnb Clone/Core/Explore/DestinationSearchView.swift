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
            CollapsableCardView(title: "When", description: "Add dates")

            // guest selection
            CollapsableCardView(title: "Who", description: "Add guests")

            Spacer()
        }
        .background(Color(.systemGray5))
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

private struct NavigationControlsView: View {
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
                    .foregroundStyle(.foreground)
            }

            Spacer()

            Button {
                print("DEBUG: clearing the search inputs...")
            } label: {
                Text("Clear")
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.foreground)
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}

private struct CollapsableCardView: View {
    var title: String
    var description: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)

                Spacer()

                Text(description)
            }
            .font(.headline)
            .fontWeight(.semibold)
        }
        .cardStyle()
    }
}
