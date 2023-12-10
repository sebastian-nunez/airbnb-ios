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
    @ObservedObject var viewModel: ExploreViewModel

    // state
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numAdults = 1

    var body: some View {
        VStack {
            // nav controls
            NavigationControlsView(showView: $showView,
                                   viewModel: viewModel)

            // location search
            LocationSearchView(destination: $viewModel.searchLocation,
                               selectedOption: selectedOption,
                               viewModel: viewModel,
                               showView: $showView)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .location }
                }

            // date selection
            DateSelectionView(selectedOption: selectedOption, startDate: $startDate, endDate: $endDate)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .dates }
                }

            // guest selection
            GuestSelectionView(selectedOption: selectedOption, numAdults: $numAdults)
                .onTapGesture {
                    withAnimation(.snappy) { selectedOption = .guests }
                }

            Spacer()
        }
        .background(Color(.systemGray5))
    }
}

#Preview {
    DestinationSearchView(showView: .constant(false),
                          viewModel: ExploreViewModel(with: MockExploreServiceImpl()))
}

private struct NavigationControlsView: View {
    @Binding var showView: Bool
    @ObservedObject var viewModel: ExploreViewModel

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
            if !viewModel.searchLocation.isEmpty {
                withAnimation(.snappy) {
                    Button {
                        viewModel.searchLocation = ""
                        viewModel.filterListingByLocation()
                    } label: {
                        Text("Clear")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.foreground)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
    }
}

private struct LocationSearchView: View {
    @Binding var destination: String
    var selectedOption: DestinationSearchOptions
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var showView: Bool

    var body: some View {
        if selectedOption == .location {
            VStack(alignment: .leading) {
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)

                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.medium)

                    TextField("Search destinations...", text: $destination)
                        .font(.subheadline)
                        .onSubmit {
                            viewModel.filterListingByLocation()
                            showView.toggle() // close overlay
                        }
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
    @Binding var startDate: Date
    @Binding var endDate: Date

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

                    // date picker
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)

                        Divider()

                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .tint(.pink) // change calendar color
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
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
    @Binding var numAdults: Int

    var body: some View {
        VStack {
            if selectedOption == .guests {
                VStack(alignment: .leading) {
                    // header
                    HStack {
                        Text("Who's coming?")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Spacer()
                    }

                    Stepper {
                        Text("\(numAdults) Adults")
                    } onIncrement: {
                        numAdults += 1
                    } onDecrement: {
                        guard numAdults > 1 else { return }

                        numAdults -= 1
                    }
                }
                .cardStyle()
            } else {
                CollapsedCardView(title: "Who", description: "Add guests")
            }
        }
    }
}
