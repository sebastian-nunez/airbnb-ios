//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by Sebastian on 12/8/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    // bindings
    @Binding var showView: Bool

    // state
    @State private var destinationText = ""
    @State private var selectedOption: DestinationSearchOptions = .location

    var body: some View {
        VStack {
            // nav controls
            NavigationControlsView(showView: $showView)

            // location search
            LocationSearchView(text: $destinationText, selectedOption: selectedOption)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .location }
                }

            // date selection
            DateSelectionView(selectedOption: selectedOption)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .dates }
                }

            // guest selection
            GuestSelectionView(selectedOption: selectedOption)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .guests }
                }

            Spacer()
        }
        .background(Color(.systemGray5))
    }
}

#Preview {
    DestinationSearchView(showView: .constant(false))
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

            // clear button
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

private struct LocationSearchView: View {
    @Binding var text: String

    var selectedOption: DestinationSearchOptions

    var body: some View {
        if selectedOption == .location {
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
        } else {
            CollapsedCardView(title: "Where", description: "Add destination")
        }
    }
}

private struct CollapsedCardView: View {
    var title: String
    var description: String

    var body: some View {
        VStack {
            // header
            HStack {
                Text(title)
                    .foregroundStyle(.gray)

                Spacer()

                Text(description)
            }
            .font(.headline)
            .fontWeight(.semibold)
        }
        .frame(height: 32)
        .cardStyle()
    }
}

private struct DateSelectionView: View {
    var selectedOption: DestinationSearchOptions

    var body: some View {
        VStack {
            if selectedOption == .dates {
                VStack(alignment: .leading) {
                    // header
                    HStack {
                        Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Spacer()
                    }
                }
                .cardStyle()
            } else {
                CollapsedCardView(title: "When", description: "Add dates")
            }
        }
    }
}

private struct GuestSelectionView: View {
    var selectedOption: DestinationSearchOptions

    var body: some View {
        VStack {
            if selectedOption == .guests {
                VStack(alignment: .leading) {
                    // header
                    HStack {
                        Text("How many guests?")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Spacer()
                    }
                }
                .cardStyle()
            } else {
                CollapsedCardView(title: "When", description: "Add guests")
            }
        }
    }
}
